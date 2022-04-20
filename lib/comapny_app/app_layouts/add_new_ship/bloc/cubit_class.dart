import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

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

  List<String> areaList = [""];

  var selectedArea;
  bool isAreaSelected = false;

  void selectFromAreaChoices(choice) {
    selectedArea = choice;
    isAreaSelected = !isAreaSelected;
    int localIndex = areaList.indexOf(choice.toString()) - 1;
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
    DioHelper.getData(
            url: GET_CITIES_DATA,
            authorization: "Bearer ${SaveValueInKey.accessToken}")
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
      }
      log("city Ids List = ${cityIdList.toString()}");
      log("city names List = ${cityList.toString()}");
      //log("${value.data["province"].length}");
      emit(GetCitiesDataSuccess());
    });
  }

  void getSpecificAreas(choice) {
    areaIdList=[];
    for (int index = 0; index < cityList.length; index++) {
      for (int areaIndex = 0;
          areaIndex < allCities!.province![index]["areas"].length;
          areaIndex++) {
        if (cityList[index] == choice.toString()) {
          areaList.add(allCities!.province![index]["areas"][areaIndex]["name"]);
          areaIdList.add(allCities!.province![index]["areas"][areaIndex]["id"]);
          log("city name now = ${cityModel!.name.toString()}");
        }
      }
    }
    log("areaaaaaaaaaaa naaames = ${areaList.toString()}");
    log("areaaaaaaaaaaa ideeeeees = ${areaIdList.toString()}");
    emit(GetCitiesDataSuccess());
  }

  List<String> serviceTypes = [];
  List serviceIds = [];
  int? serviceIdNow;

  dynamic selectedService;
  bool isServiceSelected = false;

  void selectFromServiceChoices(choice) {
    selectedService = choice;
    isServiceSelected = !isServiceSelected;
    int localIndex = serviceTypes.indexOf(choice.toString());
    serviceIdNow = serviceIds[localIndex];
    emit(SelectChoiceSuccessState());
  }

  void getServiceType() {
    DioHelper.getData(
            url: GET_SERVICE_TYPES_DATA,
            authorization: "Bearer ${SaveValueInKey.accessToken}")
        .then((value) {
      for (int index = 0; index < value.data["service_type"].length; index++) {
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
  String showAddShipMsg = "";

  void collectShipmentsOrder() {
    convertDateToString();
    createShipmentModel = CreateShipmentModel(
      deliveryDate: stringDate,
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
    showAddShipMsg = "تم حفظ بيانات الشحنة";
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
    stringDate = "";
    emit(ResetAreasSuccessState());
  }

  int? areaIdNow;
  String completeShowMsg = "";

  void createShipments() async {
    emit(CreateNewShipmentOrderLoadingState());
    convertDateToString();
    log(areaIdList.toString());
    log("areaIdNow = ${areaIdNow.toString()}");
    createShipmentModel = CreateShipmentModel(
      deliveryDate: stringDate,
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
    log("the list = ${listOfShipmentsOrder.toString()}");
    createShipment = CreateShipment(shipmentData: listOfShipmentsOrder);
    listOfShipmentsOrder = [];
    SaveValueInKey.userId = SharedCashHelper.getValue(key: "userId");
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    try {
      Response response = await DioHelper.postData(
        url: CREATE_SHIPMENT,
        token: "",
        accessToken: "",
        authorization: "Bearer ${SaveValueInKey.accessToken}",
        data: createShipment!.toMap(),
      );
      log("${response.data.toString()}");
      log("successsssssss create");
      emit(CreateNewShipmentOrderSuccessState());
    } on DioError catch (e) {
      log(e.response!.statusCode.toString());
      log(e.response!.data.toString());
      if (e.response!.statusCode == 422) {
        log("data of response kkkkkkkkkkkkkkkk");
        if (e.response!.data["data_client.0.area_id"] != null) {
          log("area id msg not null");
          if (e.response!.data["data_client.0.service_type_id"] != null) {
            log("area id nuuuuuuuull");
            completeShowMsg =
                "برجاء اختيار المنطفة التابعة لها المرسل اليه ونوع خدمة الشحن ";
            emit(ShowErrorMsgInSnackBar());
          } else {
            completeShowMsg = "برجاء اختيار المدينة والمنطفة التابعة لها";
            emit(ShowErrorMsgInSnackBar());
          }
        } else if (e.response!.data["data_client.0.service_type_id"] != null) {
          completeShowMsg = "برجاء اختيار نوع خدمة الشحن اولا";
          emit(ShowErrorMsgInSnackBar());
        } else if (e.response!.data["data_client.0.phone"] != null) {
          completeShowMsg = "رقم موبايل المرسل اليه مسجل مسبقا الرجاء المراجعة";
          emit(ShowErrorMsgRedInSnackBar());
        }
      } else {
        emit(CreateNewShipmentOrderErrorState(e.toString()));
      }
    }
  }

  var kindSelected;
  bool isKindSelected = false;

  File? file;
  String fileName = "";

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.any);
    if (result != null){
      final path = result.files.single.path;
      file = File(path!);
      fileName = file != null ? basename(file!.path) : 'لم يتم اختيار اى ملف';
      emit(GetFileSuccessState());
    }
  }
  void sendExcelFile() async {
    emit(SendFileLoadingState());
    var uri = Uri.parse(
        "https://wasela.innovations-eg.com/$SEND_FILE${SaveValueInKey.companyId}");
    var request = http.MultipartRequest("POST", uri);
    request.headers
        .addAll({'Authorization': "Bearer ${SaveValueInKey.accessToken}"});
    if (file != null) {
      log("file = ${file.toString()}");
      var stream = File(file!.path).readAsBytes().asStream();
      var length = await file!.length();
      String fileName = file!.path.split('/').last;
      log("file path = ${fileName.toString()}");
      http.MultipartFile multipartFile = http.MultipartFile(
        "file",
        stream,
        length,
        filename: fileName,
      );
      request.files.add(multipartFile);
    }
    var response = await request.send();
    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      log("file name = ${fileName.toString()}");
      log(response.statusCode.toString());
      // final body = json.decode(value);
      if (response.statusCode == 200) {
        log("send file Success");
        emit(SendFileSuccessState());
      }
      else{
        emit(SendFileErrorState());
      }
        });
  }

  DateTime? date;
  String stringDate = "";

  void convertDateToString(){
    stringDate = DateFormat("y/MM/dd").format(date!);
    emit(ConvertDateToString());
  }

  void getDate({required DateTime myDate}) {
    date = myDate;
    convertDateToString();
    emit(GetDateAndShowIt());
  }
}
