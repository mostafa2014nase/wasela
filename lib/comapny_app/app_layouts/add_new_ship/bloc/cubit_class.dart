import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/states.dart';
import 'package:path/path.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/cities_and_their_areas.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/create_shipment.dart';
import 'package:wasela/helper_methods/modules/shipment_and_customer_models.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';

class AddNewShipCubitClass extends Cubit<AddNewShipStates> {
  AddNewShipCubitClass() : super(AddNewShipInitialState());

  static AddNewShipCubitClass get(context) => BlocProvider.of(context);

  TextEditingController receiverName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController mobile2 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cost = TextEditingController();

  TextEditingController customerCode = TextEditingController();
  TextEditingController shipmentName = TextEditingController();
  TextEditingController shipmentCost = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController count = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController notes = TextEditingController();

  List<String> cityList = [];

  dynamic selectedCity;
  bool isCitySelected = false;

  void selectFromCityChoices(choice) {
    selectedCity = choice;
    isCitySelected = !isCitySelected;
    areaList = [""];
    selectedArea = "";
    getSpecificAreas(choice);
    emit(SelectChoiceSuccessState());
  }

  void resetAllAreas() {
    areaList = [""];
    emit(ResetAreasSuccessState());
  }

  List<String> areaList = [""];

  var selectedArea;
  bool isAreaSelected = false;

  void selectFromAreaChoices(choice) {
    selectedArea = choice;
    isAreaSelected = !isAreaSelected;
    int localIndex = areaList.indexOf(choice.toString())-1;
    areaIdNow = areaIdList[localIndex];
    log("area id name now = ${areaIdNow.toString()}");
    emit(SelectChoiceSuccessState());
  }

  // ship data screen

  AllCities? allCities;

  CityModel? cityModel;

  AreaModel? areaModel;
  List areaIdList = [];
  List cityIdList = [];

  void getAllCitiesAndTheirAreas() {
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    DioHelper.getData(url: GET_CITIES_DATA, authorization: "Bearer ${SaveValueInKey.accessToken}").then((value){
      allCities = AllCities.fromJson(value.data);
      log("area names List = ${allCities!.toMap().toString()}");
      for (int index = 0; index < value.data["province"].length; index++) {
        cityList.add(value.data["province"][index]["name"]);
        cityIdList.add(value.data["province"][index]["id"]);
        cityModel = CityModel(itsAreas: value.data["province"][index]["areas"], id: value.data["province"][index]["id"],name: value.data["province"][index]["name"],price:value.data["province"][index]["price"] );
        log(cityList.toString());
        log(value.data["province"][index]["areas"].length.toString());
        for (int areaIndex = 0;
            areaIndex < value.data["province"][index]["areas"].length;
            areaIndex++) {
          areaIdList
              .add(value.data["province"][index]["areas"][areaIndex]["id"]);
        }
      }
      log("area names List = ${areaIdList.toString()}");
      log("city Ids List = ${cityIdList.toString()}");
      log("city names List = ${cityList.toString()}");
      //log("${value.data["province"].length}");
      emit(GetCitiesDataSuccess());
    });
  }

  void getSpecificAreas(choice) {
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
          log("areaaaaaaaaaaa naaames = ${areaList.toString()}");
          log("city name now = ${cityModel!.name.toString()}");

        }
      }
    }
    log(areaList.toString());
    log(areaIdList.toString());
    emit(GetCitiesDataSuccess());
  }


  List<String> serviceTypes = [];
  List serviceIds = [];
  int ? serviceIdNow ;
  dynamic selectedService;
  bool isServiceSelected = false;

  void selectFromServiceChoices(choice) {
    selectedService = choice;
    isServiceSelected = !isServiceSelected;
    int localIndex = serviceTypes.indexOf(choice.toString());
    serviceIdNow = serviceIds[localIndex];
    emit(SelectChoiceSuccessState());
  }
  void getServiceType(){
    DioHelper.getData(url: GET_SERVICE_TYPES_DATA, authorization: "Bearer ${SaveValueInKey.accessToken}").then((value){
      for (int index = 0; index < value.data["service_type"].length; index++){
        serviceTypes.add(value.data["service_type"][index]["type"]);
        serviceIds.add(value.data["service_type"][index]["id"]);
      }
      log("service type list = ${serviceTypes.toString()}");
      log("service Ids list =${serviceIds.toString()}");
      emit(GetServiceListSuccessState());
    });
  }

  List listOfShipmentsOrder = [];

  CustomerModel? customerModel;
  ShipsDataModel? shipsDataModel;
  CreateShipment? createShipment;
  CreateShipmentModel? createShipmentModel;

  void collectShipmentsOrder() {
    // tempListOfShipmentsOrder = [];
    // customerModel = CustomerModel(
    //   phone: mobile.text,
    //   address: address.text,
    //   email: email.text,
    //   phone_2: mobile2.text,
    //   companyId: SaveValueInKey.companyId,
    //   customerId: 1,
    //   googleLocation: "",
    //   name: receiverName.text,
    //   photo: File(fileName),
    // );
    //
    // listOfShipmentsOrder.add(customerModel!.toMap());
    //
    // shipsDataModel = ShipsDataModel(
    //   nameShipment: shipmentName.text,
    //   description: description.text,
    //   shippingPrice: double.tryParse(shipmentCost.text),
    //   weight: weight.text.contains("-")
    //       ? double.tryParse(weight.text)! * (-1)
    //       : double.tryParse(weight.text),
    //   size: size.text.contains("-")
    //       ? double.tryParse(size.text)! * (-1)
    //       : double.tryParse(size.text),
    //   count: count.text.contains("-")
    //       ? int.tryParse(count.text)! * (-1)
    //       : int.tryParse(count.text),
    //   notes: notes.text,
    //   companyId: SaveValueInKey.companyId,
    //   customerCode: customerCode.text.contains("-")
    //       ? int.tryParse(customerCode.text)! * (-1)
    //       : int.tryParse(customerCode.text),
    //
    // );
    // listOfShipmentsOrder.add(shipsDataModel!.toMap());
    // var hh = listOfShipmentsOrder.toSet();
    // tempListOfShipmentsOrder.add(hh);
    createShipmentModel = CreateShipmentModel(
      phone: mobile.text,
      address: address.text,
      areaId: areaIdNow,
      email: email.text,
      phone_2: mobile2.text,
      companyId: SaveValueInKey.companyId,
      customerId: 1,
      googleLocation: "",
      name: receiverName.text,
      photo: File(fileName),
      nameShipment: shipmentName.text,
      description: description.text,
      shippingPrice: double.tryParse(shipmentCost.text),
      weight: weight.text,
      size: size.text,
      count: count.text.contains("-")
          ? int.tryParse(count.text)! * (-1)
          : int.tryParse(count.text),
      notes: notes.text,
      customerCode: customerCode.text.contains("-")
          ? int.tryParse(customerCode.text)! * (-1)
          : int.tryParse(customerCode.text),
    );
    listOfShipmentsOrder.add(createShipmentModel!.toMap());
    createShipment = CreateShipment(shipmentData: listOfShipmentsOrder);
    log("there is list heeeeeeeeeeeeeeere for all orders = ${listOfShipmentsOrder.toString()}");
    emit(CollectShipmentsOrderSuccessState());
  }

  void resetAllData() {
    receiverName = TextEditingController();
    address = TextEditingController();
    mobile = TextEditingController();
    mobile2 = TextEditingController();
    email = TextEditingController();
    cost = TextEditingController();

    customerCode = TextEditingController();
    shipmentName = TextEditingController();
    shipmentCost = TextEditingController();
    weight = TextEditingController();
    size = TextEditingController();
    count = TextEditingController();
    description = TextEditingController();
    notes = TextEditingController();

    emit(ResetAreasSuccessState());
  }

  int ? areaIdNow;

  void createShipments() async {
    log(areaIdList.toString());
    log("areaIdNow = ${areaIdNow.toString()}");
    createShipmentModel = CreateShipmentModel(
      phone: mobile.text,
      address: address.text,
      areaId: areaIdNow,
      email: email.text,
      phone_2: mobile2.text,
      companyId: SaveValueInKey.companyId,
      customerId: 1,
      name: receiverName.text,
      serviceTypeId: serviceIdNow,
      //photo: File(fileName),
      nameShipment: shipmentName.text,
      description: description.text,
      shippingPrice: double.tryParse(cost.text),
      weight: weight.text,
      size: size.text,
      count: count.text.contains("-")
          ? int.tryParse(count.text)! * (-1)
          : int.tryParse(count.text),
      notes: notes.text,
      customerCode: customerCode.text.contains("-")
          ? int.tryParse(customerCode.text)! * (-1)
          : int.tryParse(customerCode.text),
    );
    listOfShipmentsOrder.add(createShipmentModel!.toMap());
    log("model = ${createShipmentModel!.toMap().toString()}");
    log("the list = ${listOfShipmentsOrder.toString()}");
    createShipment = CreateShipment(shipmentData: listOfShipmentsOrder);
    listOfShipmentsOrder = [];
    log("there is modeeeeeeeeel for all orders = ${createShipment!.toMap().toString()}");
    SaveValueInKey.userId= SharedCashHelper.getValue(key: "userId");
    SaveValueInKey.accessToken= SharedCashHelper.getValue(key: "accessToken");
    log("usreId stoooooooooop = ${SaveValueInKey.userId.toString()}");
    log(" Access Token = ${SaveValueInKey.accessToken.toString()}");
    emit(CreateNewShipmentOrderLoadingState());
    try{
      Response response =  await DioHelper.postData(
        url: "$CREATE_SHIPMENT${SaveValueInKey.userId}",
        token: "",
        accessToken: "",
        authorization: "Bearer ${SaveValueInKey.accessToken}",
        data: createShipment!.toMap(),
      );
      log(response.data.toString());
      log("successsssssss create");
      emit(CreateNewShipmentOrderSuccessState());
    }
    on DioError catch (e){
      log(e.response!.statusCode.toString());
      log(e.response!.data.toString());
      if (e.response!.statusCode == 422) {
        final res = jsonDecode(e.response!.data.toString());
        log("dataaaaaaaaaaa of response = ${res.toString()}");
        emit(CreateNewShipmentOrderErrorState(e.toString()));
      }
      emit(CreateNewShipmentOrderErrorState(e.toString()));
    }
  }

  var kindSelected;
  bool isKindSelected = false;

  void selectKind(choice) {
    kindSelected = choice;
    isKindSelected = !isKindSelected;
    emit(SelectChoiceSuccessState());
  }

  // complete progress
  //bool isDataSent = false;

  void makeDataSent() {
    emit(DataSentSuccessState());
  }

  void loadingFun() {
    emit(DataSentLoadingState());
  }

  File? file;
  String fileName = "";

  Future selectFile() async {
    fileName = file != null ? basename(file!.path) : 'لم يتم اختيار اى ملف';
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (result == null) return;
    final path = result.files.single.path;
    file = File(path!);
    emit(GetFileSuccessState());
  }
}
