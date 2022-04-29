import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/cities_and_their_areas.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/shipment_and_customer_models.dart';
import 'package:wasela/helper_methods/modules/user_client_model.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class AppCubitClass extends Cubit<AppStates> {
  AppCubitClass() : super(InitialAppState());

  static AppCubitClass get(context) => BlocProvider.of(context);

  TextEditingController updatePhoneController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateCityController = TextEditingController();
  TextEditingController updateAddressController = TextEditingController();
  TextEditingController updateAreaController = TextEditingController();
  String ?  networkUpdatedImage;

  void resetControllers() {
    updatePhoneController = TextEditingController();
    updateEmailController = TextEditingController();
    updateNameController = TextEditingController();
    updateCityController = TextEditingController();
    updateAreaController = TextEditingController();
    updateAddressController = TextEditingController();
    emit(ResetAllControllers());
  }

  bool enableUpdateNameCompany = false;

  void enableUpdateNameCompanyFun() {
    enableUpdateNameCompany = true;
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdateEmailCompany = false;

  void enableUpdateEmailCompanyFunc() {
    enableUpdateEmailCompany = true;
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdatePhoneCompany = false;

  void enableUpdatePhoneCompanyFunc() {
    enableUpdatePhoneCompany = true;
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdateCityCompany = false;

  void enableUpdateCityCompanyFunc() {
    enableUpdateCityCompany = true;
    getAllCitiesForRegister();
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdateAddressCompany = false;

  void enableUpdateAddressCompanyFunc() {
    enableUpdateAddressCompany = true;
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdatePhotoCompany = false;

  void enableUpdatePhotoCompanyFunc() {
    enableUpdatePhotoCompany = true;
    emit(EnableUpdateSuccessState());
  }

  void resetFalse() {
    enableUpdateNameCompany = false;
    enableUpdateEmailCompany = false;
    enableUpdatePhoneCompany = false;
    enableUpdateCityCompany = false;
    enableUpdateAddressCompany = false;
    enableUpdatePhotoCompany = false;
    emit(ResetFalseSuccessState());
  }

  bool checkIfOneTrue() {
    if (enableUpdateNameCompany == true ||
        enableUpdatePhoneCompany == true ||
        enableUpdateCityCompany == true ||
        enableUpdateAddressCompany == true ||
        enableUpdateEmailCompany == true ||
        enableUpdatePhotoCompany == true) {
      return true;
    } else {
      return false;
    }
  }

  CompanyModel? companyModel;

  void getCompanyProfileData() {
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log("user type ${SaveValueInKey.userType}");
    emit(GetProfileCompanyLoadingState());
    DioHelper.getData(
      url: PROFILE,
      authorization: "Bearer ${SaveValueInKey.accessToken}",
    ).then((value) {
      log("Succeeeeeeeeeeeeeeeeeeeeeeeeees compaaaaaaaany");
      companyModel = CompanyModel.fromJson(value.data);
      log("${companyModel!.name}");
      log(areaIdNow.toString());
      log("${companyModel!.address}");
      log("${companyModel!.phoneNumber}");
      updatePhoneController.text = companyModel!.phoneNumber!;
      updateNameController.text = companyModel!.name!;
      updateEmailController.text = companyModel!.email!;
      updateAddressController.text = companyModel!.address!;
      networkUpdatedImage = companyModel!.photo!;
      //profileImage = clientModel!.profileImage!;
      SaveValueInKey.companyId = companyModel!.id!;
      SaveValueInKey.userId = companyModel!.userId!;
      SaveValueInKey.companyAreaId = companyModel!.areaId!;
      emit(GetProfileCompanySuccessState(companyModel!));
      getCompanyCityAndAreaProfile();
    }).catchError((error) {
      log(error.toString());
      emit(GetProfileCompanyErrorState(error.toString()));
    });
  }

  File? image;
  String imageName = "";

  getImageGallery() async {
    final imageFile = (await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50));
    if (imageFile != null) {
      image = File(imageFile.path);
      log(image.toString());
      // clientModel!.id = SaveValueInKey.companyId;
      // log("clientModel Id = ${clientModel!.id.toString()}");
      emit(GetImageSuccessState());
    } else {
      log('Error In Picking The Note Image');
    }
    //imageName = image != null ? basename(image!.path) : "";
  }

  getImageCamera() async {
    final imageFile = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50));
    if (imageFile != null) {
      image = File(imageFile.path);
      log(image.toString());
      // clientModel!.id = SaveValueInKey.companyId;
      // log("clientModel Id = ${clientModel!.id.toString()}");
      emit(GetImageSuccessState());
    } else {
      log('Error In Picking The Note Image');
    }
  }

  Future<void> updateCompanyProfileDataWithHttp() async {
    emit(UpdateProfileCompanyLoadingState());
    if(areaIdNow != null){
      SharedCashHelper.setValue(key: "areaId", value: areaIdNow);
      log("areaIdNow = $areaIdNow");
    }
    SaveValueInKey.companyAreaId = areaIdNow;
    log("SaveValueInKey.companyAreaId = ${SaveValueInKey.companyId}");
    log("SaveValueInKey.companyAreaId of model = ${companyModel!.id}");
    var uri = Uri.parse(
        "https://wasela.innovations-eg.com/$UPDATE_PROFILE_COMPANY${companyModel!.id}");
    var request = http.MultipartRequest("POST", uri);
    request.headers
        .addAll({'Authorization': "Bearer ${SaveValueInKey.accessToken}"});
    if (image != null) {
      var stream = File(image!.path).readAsBytes().asStream();
      var length = await image!.length();
      String fileName = image!.path.split('/').last;
      log("clientModel Id = ${SaveValueInKey.companyId.toString()}");

      http.MultipartFile multipartFile = http.MultipartFile(
        "photo",
        stream,
        length,
        filename: fileName,
      );
      request.files.add(multipartFile);
    }
      request.fields["name"] = updateNameController.text;
      request.fields["email"] = updateEmailController.text;
      request.fields["phone"] = updatePhoneController.text;
      request.fields["city"] = updateCityController.text;
      request.fields["address"] = updateAddressController.text;
      request.fields["area_id"] = SharedCashHelper.getValue(key: "areaId").toString();
    var response = await request.send();
    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      log("file name = ${fileName.toString()}");
      log(response.statusCode.toString());
      // final body = json.decode(value);
      if (response.statusCode == 200) {
        log("update Success");
        getCompanyProfileData();
        resetFalse();
        makeListsEmpty();
        emit(UpdateProfileCompanySuccessState());
      }
      if (response.statusCode == 500) {
        log("update not Success");
        // getCompanyProfileData();
        // resetFalse();
        // makeListsEmpty();
        log("response statusCode = ${value.toString()}");
        emit(UpdateProfileErrorState());
      }
    });
  }

  void updateCompanyProfileDataWithDio() async {
    SaveValueInKey.companyAreaId = areaIdNow;
    log("areaIdNow = $areaIdNow");
    log("SaveValueInKey.companyAreaId = $SaveValueInKey.companyAreaId");
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log("${SaveValueInKey.accessToken}");
    log("$UPDATE_PROFILE_COMPANY${companyModel!.id.toString()}");
    log("updated area id = ${areaIdNow.toString()}");
    log("Bearer ${SaveValueInKey.accessToken}");
    emit(UpdateProfileCompanyLoadingState());
    try {
      Response response = await DioHelper.postData(
          accessToken: "",
          token: "",
          url: "$UPDATE_PROFILE_COMPANY${companyModel!.id.toString()}",
          authorization: "Bearer ${SaveValueInKey.accessToken}",
          data: {
            "name": updateNameController.text,
            "email": updateEmailController.text,
            "phone": updatePhoneController.text,
            "city": updateCityController.text,
            "address": updateAddressController.text,
            "area_id": SaveValueInKey.companyAreaId,
            //"photo": image,
            //     File(
            //         "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png"),
          });
      log("update Success");
      log("update area id = ${response.data["company"]["area_id"]}");
      getCompanyProfileData();
      resetFalse();
      makeListsEmpty();
      emit(UpdateProfileCompanySuccessState());
    } on DioError catch (error) {
      log("update erroooor = ${error.response!.data.toString()}");
      log(error.toString());
      emit(UpdateProfileCompanyErrorState(error.toString()));
    }
  }

  AllCities? allCities;
  CityModel? cityModel;
  AreaModel? areaModel;
  List areaIdList = [];
  List cityIdList = [];
  List<String> cityList = [];
  List<String> areaList = [""];

  void makeListsEmpty() {
    areaIdList = [];
    cityIdList = [];
    cityList = [];
    areaList = [""];
    emit(MakeListsEmptySuccessState());
  }

  void getAllCitiesForRegister() {
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    DioHelper.getData(url: GET_CITIES_DATA_OUT, authorization: "")
        .then((value) {
      allCities = AllCities.fromJson(value.data);
      log("area names List = ${allCities!.toMap().toString()}");
      for (int index = 0; index < value.data["province"].length; index++) {
        cityList.add(value.data["province"][index]["name"]);
        cityIdList.add(value.data["province"][index]["id"]);
        cityModel = CityModel(
            itsAreas: value.data["province"][index]["areas"],
            id: value.data["province"][index]["id"],
            name: value.data["province"][index]["name"],
            price: value.data["province"][index]["price"]);
        log(cityList.toString());
        log(value.data["province"][index]["areas"].length.toString());
        // for (int areaIndex = 0;
        // areaIndex < value.data["province"][index]["areas"].length;
        // areaIndex++) {
        //   areaIdList
        //       .add(value.data["province"][index]["areas"][areaIndex]["id"]);
        // }
      }
      log("area names List = ${areaIdList.toString()}");
      log("city Ids List = ${cityIdList.toString()}");
      log("city names List = ${cityList.toString()}");
      //log("${value.data["province"].length}");
      emit(GetCitiesDataSuccess());
    });
  }

  void getSpecificAreasForRegister(choice) {
    log("city names list = ${cityList.toString()}");
    log("city model list = ${allCities!.province.toString()}");
    for (int index = 0; index < cityList.length; index++) {
      for (int areaIndex = 0;
          areaIndex < allCities!.province![index]["areas"].length;
          areaIndex++) {
        log("areaIndex = ${areaIndex.toString()}");
        log("index of city list = ${cityList[index]}");
        log(" city list now is  = ${cityList[index]} and choice now is ${choice.toString()}");
        if (cityList[index] == choice.toString()) {
          areaList.add(allCities!.province![index]["areas"][areaIndex]["name"]);
          areaIdList.add(allCities!.province![index]["areas"][areaIndex]["id"]);
          log("areaaaaaaaaaaa ideeeeeees = ${areaIdList.toString()}");
          log("areaaaaaaaaaaa naaames = ${areaList.toString()}");
          log("city name now = ${cityModel!.name.toString()}");
        }
      }
    }
    log(areaList.toString());
    log(areaIdList.toString());
    emit(GetCitiesDataSuccess());
  }

  dynamic selectedCity;
  bool isCitySelected = false;

  var selectedArea;
  bool isAreaSelected = false;
  int? areaIdNow;

  void selectFromCityChoices(choice) {
    selectedCity = choice;
    updateCityController.text = choice.toString();
    isCitySelected = !isCitySelected;
    areaList = [""];
    selectedArea = "";
    getSpecificAreasForRegister(choice);
    emit(SelectChoiceSuccessState());
  }

  void selectFromAreaChoices(choice) {
    selectedArea = choice;
    updateAreaController.text = choice.toString();
    isAreaSelected = !isAreaSelected;
    int localIndex = areaList.indexOf(choice.toString()) - 1;
    log("area id index now = ${localIndex.toString()}");
    log("area id list = ${areaIdList.toString()}");
    areaIdNow = areaIdList[localIndex];
    log("area id name now = ${areaIdNow.toString()}");
    emit(SelectChoiceSuccessState());
  }

  ClientModel? clientModel;

  void getClientProfileData() {
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log("${SaveValueInKey.accessToken}");
    emit(GetProfileClientLoadingState());
    DioHelper.getData(
      url: PROFILE,
      authorization: "Bearer ${SaveValueInKey.accessToken}",
    ).then((value) {
      log("Succeeeeeeeeeeeeeeeeeeeeeeeeees cliiiiiiiiiiient");
      clientModel = ClientModel.fromJson(value.data);
      log("${clientModel!.name}");
      log("${clientModel!.id}");
      updatePhoneController.text = clientModel!.phoneNumber!;
      updateNameController.text = clientModel!.name!;
      updateEmailController.text = clientModel!.email!;
      updateCityController.text = clientModel!.city!;
      updateAddressController.text = clientModel!.address!;
      //image = clientModel!.profileImage!;
      SaveValueInKey.userId = clientModel!.id!;
      emit(GetProfileClientSuccessState(clientModel!));
    }).catchError((error) {
      log("erroooooooooooooooooooooooooooor cliiiiiiiiiiient");
      log(error.toString());
      emit(GetProfileClientErrorState(error.toString()));
    });
  }

  void updateClientProfileData() {
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log("${SaveValueInKey.accessToken}");
    log("${UPDATE_PROFILE_CLIENT}${clientModel!.id.toString()}");
    log("Bearer ${SaveValueInKey.accessToken}");
    emit(UpdateProfileClientLoadingState());
    DioHelper.postData(
        accessToken: "",
        token: "",
        url: "$UPDATE_PROFILE_CLIENT${clientModel!.id.toString()}",
        authorization: "Bearer ${SaveValueInKey.accessToken}",
        data: {
          "name": updateNameController.text,
          "email": updateEmailController.text,
          "phone": updatePhoneController.text,
          "city": updateCityController.text,
          "address": updateAddressController.text,
          //"photo": profileImage,
        }).then((value) {
      log("update Success");
      getClientProfileData();
      resetFalse();
      emit(UpdateProfileClientSuccessState());
    }).catchError((error) {
      log("update erroooor");
      log(error.toString());
      emit(UpdateProfileClientErrorState(error));
    });
  }

  File? profileImage;
  String fileName = "";

  Future selectFile() async {
    fileName = profileImage != null ? basename(profileImage!.path) : "";
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result == null) {
      return;
    } else {
      final path = result.files.single.path;
      profileImage = File(path!);
      log("$profileImage");
      log("$profileImage");
      emit(GetImageSuccessState());
    }
  }

  void getCompanyCityAndAreaProfile() {
    emit(GetCompanyCityAndAreaProfileLoadingState());
    DioHelper.getData(url: GET_CITIES_DATA_OUT, authorization: "")
        .then((value) {
      log("data = ${value.data["province"][0]["areas"].toString()}");
      for (int index = 0; index < value.data["province"].length; index++) {
        for (int areaIndex = 0;
            areaIndex < value.data["province"][index]["areas"].length;
            areaIndex++) {
          if (value.data["province"][index]["areas"][areaIndex]["id"] ==
              SaveValueInKey.companyAreaId) {
            updateAreaController.text =
                value.data["province"][index]["areas"][areaIndex]["name"];
            updateCityController.text = value.data["province"][index]["name"];
            log("city = ${updateCityController.text} and area = ${updateAreaController.text}");
          }
        }
      }
      emit(GetCompanyCityAndAreaProfileSuccessState());
    }).catchError((error) {
      log("error = ${error.toString()}");
      emit(GetCompanyCityAndAreaProfileErrorState(error.toString()));
    });
  }


  /// for shipment on all app ////

  ShipmentsDetailsModel? shipmentModel;
  ShipmentsDetailsModelForAllApp? shipmentsDetailsModel;
  AllShipmentsData? allShipmentsData;
  List allShipmentsList = [];
  List shipmentsWithReturnList = [];
  List collectAll = [];
  List rowSendIdList = [];
  List rowSendDateList = [];
  List rowSendReturnList = [];
  List rowSendProductList = [];
  List rowSendShippingList = [];
  List rowSendStatueNameList = [];

  void getAllShipmentsData() {
    emit(GetAllShipmentsDataLoadingState());
    SaveValueInKey.userId = SharedCashHelper.getValue(key: "userId");
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    shipmentsWithReturnList = [];
     collectAll = [];
     rowSendIdList = [];
     rowSendDateList = [];
     rowSendReturnList = [];
     rowSendProductList = [];
     rowSendShippingList = [];
     rowSendStatueNameList = [];
    DioHelper.getData(
        url: ALL_SHIPMENTS_RETURN,
        authorization: "Bearer ${SaveValueInKey.accessToken}")
        .then((value) {
      for (int index = 0;
      index < value.data["shipment"].length;
      index++) {
        shipmentsDetailsModel = ShipmentsDetailsModelForAllApp.fromJson(value.data["shipment"][index]);
        log("shipment index case = ${shipmentsDetailsModel!.shipmentStatueName.toString()}");
        log("shipment index ship price = ${shipmentsDetailsModel!.shippingPrice.toString()}");
        shipmentsWithReturnList.add(shipmentsDetailsModel!.toMap());
        rowSendIdList.add(shipmentsDetailsModel!.shipmentId);
        rowSendDateList.add(DateFormat("y/MM/dd").format(DateTime.parse(shipmentsDetailsModel!.updateDate!)));
        rowSendProductList.add(shipmentsDetailsModel!.productPrice);
        rowSendReturnList.add(shipmentsDetailsModel!.returnPrice);
        rowSendShippingList.add(shipmentsDetailsModel!.shipmentStatueId == 9 || shipmentsDetailsModel!.shipmentStatueId == 11 ? shipmentsDetailsModel!.shippingPrice! * -1 :shipmentsDetailsModel!.shippingPrice);
        rowSendStatueNameList.add(shipmentsDetailsModel!.shipmentStatueName);
      }
      log("shipments with return cases = ${shipmentsWithReturnList.toString()}");
      collectAll.add(rowSendIdList);
      collectAll.add(rowSendDateList);
      collectAll.add(rowSendProductList);
      collectAll.add(rowSendReturnList);
      collectAll.add(rowSendShippingList);
      collectAll.add(rowSendStatueNameList);
      getAllShipmentsWithNoStatues();
      emit(GetAllShipmentsDataSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetAllShipmentsDataErrorState(error.toString()));
    });
  }

  void getAllShipmentsWithNoStatues() {
    emit(GetAllShipmentsDataWithOutCasesLoadingState());
    SaveValueInKey.userId = SharedCashHelper.getValue(key: "userId");
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    allShipmentsList = [];
    DioHelper.getData(
        url: ALL_SHIPMENTS,
        authorization: "Bearer ${SaveValueInKey.accessToken}")
        .then((value) {
      for (int index = 0;
      index < value.data["shipment"]["data"].length;
      index++) {
        shipmentModel = ShipmentsDetailsModel.fromJson(value.data["shipment"]["data"][index]);
        allShipmentsList.add(shipmentModel!.toMap());
      }
      log("allShipmentsList = ${allShipmentsList.toString()}");
      emit(GetAllShipmentsDataWithOutCasesSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetAllShipmentsDataWithOutCasesErrorState(error.toString()));
    });
  }

  List bouncePartShipmentsList = [];
  List bounceCompletePayShippingList = [];
  List bounceCompleteNotPayShippingList = [];

  void getShipmentsWithStatueBouncePart(){
    for(int index = 0 ; index < shipmentsWithReturnList.length ; index++){
      log("id of sp now= ${shipmentsWithReturnList[0]["id"].toString()}");
      if(shipmentsWithReturnList[index]["shipmentstatu"]["id"] == 8 || shipmentsWithReturnList[index]["shipmentstatu"]["id"] == 9){
        for(int allIndex = 0 ; allIndex < allShipmentsList.length; allIndex ++ )
          {
            log("id of sp now= ${shipmentsWithReturnList[index]["id"].toString()}");
            log("id of all Shipments List now = ${allShipmentsList[allIndex].toString()}");
            if(shipmentsWithReturnList[index]["id"] == allShipmentsList[allIndex]["id"]){
              bouncePartShipmentsList.add(allShipmentsList[allIndex]);
            }
          }
      }
    }
    log("bounce Part Shipments List = ${bouncePartShipmentsList.toString()}");
    emit(GetShipmentsWithStatueBouncePart());
  }
  void getShipmentsWithStatueBounceCompletePay(){
    for(int index = 0 ; index < shipmentsWithReturnList.length ; index++){
      log("id of sp now= ${shipmentsWithReturnList[0]["id"].toString()}");
      if(shipmentsWithReturnList[index]["shipmentstatu"]["id"] == 10){
        for(int allIndex = 0 ; allIndex < allShipmentsList.length; allIndex ++ )
          {
            log("id of sp now= ${shipmentsWithReturnList[index]["id"].toString()}");
            log("id of all Shipments List now = ${allShipmentsList[allIndex].toString()}");
            if(shipmentsWithReturnList[index]["id"] == allShipmentsList[allIndex]["id"]){
              bounceCompletePayShippingList.add(allShipmentsList[allIndex]);
            }
          }
      }
    }
    log("bounce Part Shipments List = ${bouncePartShipmentsList.toString()}");
    emit(GetShipmentsWithStatueBounceCompletePay());
  }
  void getShipmentsWithStatueBounceCompleteNotPay(){
    for(int index = 0 ; index < shipmentsWithReturnList.length ; index++){
      log("id of sp now= ${shipmentsWithReturnList[0]["id"].toString()}");
      if(shipmentsWithReturnList[index]["shipmentstatu"]["id"] == 11){
        for(int allIndex = 0 ; allIndex < allShipmentsList.length; allIndex ++ )
          {
            log("id of sp now= ${shipmentsWithReturnList[index]["id"].toString()}");
            log("id of all Shipments List now = ${allShipmentsList[allIndex].toString()}");
            if(shipmentsWithReturnList[index]["id"] == allShipmentsList[allIndex]["id"]){
              bounceCompleteNotPayShippingList.add(allShipmentsList[allIndex]);
            }
          }
      }
    }
    log("bounce Part Shipments List = ${bouncePartShipmentsList.toString()}");
    emit(GetShipmentsWithStatueBounceCompleteNotPay());
  }
}

