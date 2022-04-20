import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/cities_and_their_areas.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/massege_model.dart';
import 'package:wasela/helper_methods/modules/shipment_and_customer_models.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:url_launcher/url_launcher.dart';

class ShipForCompanyAppCubitClass extends Cubit<ShipStates> {
  ShipForCompanyAppCubitClass() : super(ShipInitState());

  static ShipForCompanyAppCubitClass get(context) => BlocProvider.of(context);
  TextEditingController notes = TextEditingController();
  TextEditingController complain = TextEditingController();

  List<bool> isDetailed = [];

  void detailedClicked(int index) {
    isDetailed[index] = !isDetailed[index];
    emit(ShowDetailsMenu());
  }

  void resetFalse(int index) {
    isDetailed[index] = false;
    emit(HideDetailsMenu());
  }

  int index = 0;

  void toggleTab(int receivedIndex) {
    index = receivedIndex;
    emit(PerformToggleTabsSuccessState());
  }

  bool shippingIsEmpty = false;
  int showShipmentsListLength = 0;
  ShipmentsDetailsModel? shipmentsDetailsModel;
  AllShipmentsData? allShipmentsData;
  List tempList = [];

  void getAllShipmentsData() {
    emit(GetAllShipmentsDataLoadingState());
    SaveValueInKey.userId = SharedCashHelper.getValue(key: "userId");
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log(SaveValueInKey.userId.toString());
    log(SaveValueInKey.accessToken.toString());
    log("$ALL_SHIPMENTS${SaveValueInKey.userId}");
    tempList = [];
    DioHelper.getData(
            url: ALL_SHIPMENTS,
            authorization: "Bearer ${SaveValueInKey.accessToken}")
        .then((value) {
      showShipmentsListLength = value.data["shipment"]["data"].length;
      log("shipments data length = ${showShipmentsListLength.toString()}");
      for (int index = 0;
          index < value.data["shipment"]["data"].length;
          index++) {
        shipmentsDetailsModel = ShipmentsDetailsModel.fromJson(
            value.data["shipment"]["data"][index]);
        log(shipmentsDetailsModel!.clientName.toString());
        //allShipmentsData?.dataList!.add(shipmentsDetailsModel!.toMap());
        tempList.add(shipmentsDetailsModel!.toMap());
        isDetailed.add(false);
      }
      allShipmentsData = AllShipmentsData(dataList: tempList);
      //allShipmentsData = AllShipmentsData.fromJson(value.data);
      //allShipmentsData!.map((data) => AllShipmentsData.fromJson(data)).toList();
      //shipmentsDetailsModel = ShipmentsDetailsModel.fromJson(value.data["shipment"]["data"][0]);
      log(allShipmentsData!.dataList.toString());
      emit(GetAllShipmentsDataSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetAllShipmentsDataErrorState(error.toString()));
    });
  }

  void getUserToken() {
    FirebaseFirestore.instance.collection("users").doc().get().then((value) {
      log(value.toString());
    });
  }

  void sendMessage({
    required String sender,
    required String receiver,
    required String text,
    required DateTime date,
  }) {
    MessageModel model = MessageModel(
      text: text,
      dateTime: date,
      receiverId: receiver,
      senderId: sender,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(sender)
        .collection("chats")
        .doc(receiver)
        .collection("messages")
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState(error));
      log(error.toString());
    });
    FirebaseFirestore.instance
        .collection("users")
        .doc(receiver)
        .collection("chats")
        .doc(sender)
        .collection("messages")
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState(error));
      log(error.toString());
    });
  }

  List<MessageModel> messages = [];

  void getAllMessages({
    required String sender,
    required String receiver,
  }) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(sender)
        .collection("chats")
        .doc(receiver)
        .collection("messages")
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
    });
  }

  String emptyListMsg = "";

  void getAllMatchedShipmentsData(String keyName) {
    emit(GetAllMatchedShipmentsDataLoadingState());
    SaveValueInKey.userId = SharedCashHelper.getValue(key: "userId");
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    DioHelper.getData(
            url: ALL_SHIPMENTS,
            authorization: "Bearer ${SaveValueInKey.accessToken}")
        .then((value) {
      showShipmentsListLength = value.data["shipment"]["data"].length;
      log("shipments data length = ${showShipmentsListLength.toString()}");
      tempList = [];
      for (int index = 0;
          index < value.data["shipment"]["data"].length;
          index++) {
        log(value.data["shipment"]["data"][index]["client"]["name"]);
        if ((value.data["shipment"]["data"][index]["client"]["name"]
            .toString()
            .contains(keyName) || value.data["shipment"]["data"][index]["client"]["phone"]
            .toString()
            .contains(keyName)) && (DateTime.parse(value.data["shipment"]["data"][index]["created_at"]).isBefore(toDate!) || DateTime.parse(value.data["shipment"]["data"][index]["created_at"]).day == toDate!.day) &&
            ( DateTime.parse(value.data["shipment"]["data"][index]["created_at"]
            )
                .isAfter(fromDate!)) || DateTime.parse(value.data["shipment"]["data"][index]["created_at"]
        ).day == fromDate!.day) {
          shipmentsDetailsModel = ShipmentsDetailsModel.fromJson(
              value.data["shipment"]["data"][index]);
          tempList.add(shipmentsDetailsModel!.toMap());
          isDetailed.add(false);
        }
        // search with boooleeest l 47n

        // if (value.data["shipment"]["data"][index]["client"]["phone"]
        //     .toString()
        //     ==keyName.toString()) {
        //   shipmentsDetailsModel = ShipmentsDetailsModel.fromJson(
        //       value.data["shipment"]["data"][index]);
        //   tempList.add(shipmentsDetailsModel!.toMap());
        //   isDetailed.add(false);
        //   isExist = true;
        // }
      }
      allShipmentsData = AllShipmentsData(dataList: tempList);
      log(allShipmentsData!.dataList.toString());
      log(tempList.toString());
      emit(GetAllMatchedShipmentsDataSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetAllMatchedShipmentsDataErrorState(error.toString()));
    });
  }

  TextEditingController searchController = TextEditingController();

  void findAllMatchShipments() {
    if (searchController.text.isNotEmpty || stringFromDate != "" || stringToDate != "") {
      tempList = [];
      getAllMatchedShipmentsData(searchController.text);
    } else {
      tempList = [];
      getAllShipmentsData();
    }
  }

  bool exist = true;
  String watsAppErrorMsg = "";

  void checkIfWordExist() {
    for (int index = 0; index < tempList.length; index++) {
      if (tempList[index]["client"]["name"]
          .toString()
          .contains(searchController.text)) {
        exist = true;
        findAllMatchShipments();
      } else {
        exist = false;
      }
    }
  }

  void openWatsApp({required String phone}) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/";
      } else {
        return "whatsapp://send?phone=$phone";
      }
    }

    if (await canLaunch(url())) {
      launch(url());
      emit(OpenWhatsAppSuccessState());
    } else {
      watsAppErrorMsg = "whatsApp is not downloaded";
      emit(OpenWhatsAppErrorState());
    }
  }

  DateTime? fromDate;
  DateTime? toDate;
  String stringFromDate = "";
  String stringToDate = "";

  void resetFromDate() {
    stringFromDate = "";
    searchController = TextEditingController();
    emit(ResetFromDateAndString());
  }

  void resetToDate() {
    stringToDate = "";
    emit(ResetToDateAndString());
  }

  void getFromDate({required DateTime myDate}) {
    fromDate = myDate;
    convertFromDateToString();
    emit(GetFromDateAndShowIt());
  }

  void getToDate({required DateTime myDate}) {
    toDate = myDate;
    convertToDateToString();
    emit(GetToDateAndShowIt());
  }

  void convertFromDateToString() {
    stringFromDate = DateFormat("y/MM/dd").format(fromDate!);
    emit(ConvertDateToString());
  }
  void convertToDateToString() {
    stringToDate = DateFormat("y/MM/dd").format(toDate!);
    emit(ConvertDateToString());
  }

  ////////////////////////////// for update Shipment ////////////////////////////////

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
  TextEditingController mainNotes = TextEditingController();

  int ? shipmentId;
  EditShipmentModel? editShipmentModel;

  void getSpecificShipmentData({required shipmentId}) async {
    emit(GetSpecificShipmentDataLoadingState());
    try {
      Response response = await DioHelper.postData(
        url: "$SHOW_SHIPMENT$shipmentId",
        token: "",
        accessToken: "",
        authorization: "Bearer ${SaveValueInKey.accessToken}",
        data: {},
      );
      editShipmentModel = EditShipmentModel.fromJson(response.data["shipment"]);

      log(editShipmentModel!.shippingPrice.toString());
      log(editShipmentModel!.name.toString());
      log(editShipmentModel!.shipmentId.toString());
      log(editShipmentModel!.areaId.toString());

      shipmentId = editShipmentModel!.shipmentId;
      SaveValueInKey.shipmentId = editShipmentModel!.shipmentId;
      SaveValueInKey.customerAreaId = editShipmentModel!.areaId;
      SaveValueInKey.customerServiceTypeId = editShipmentModel!.serviceTypeId;
      log("shipment will be sent = ${SaveValueInKey.shipmentId}");
      log("customerServiceTypeId = ${SaveValueInKey.customerServiceTypeId}");
       receiverName.text = editShipmentModel!.name!;
       address.text = editShipmentModel!.address!;
       mobile.text = editShipmentModel!.phone!;
       mobile2.text = editShipmentModel!.phone_2!;
       email.text = editShipmentModel!.email!;
       cost.text = "${editShipmentModel!.shippingPrice!}";
       customerCode.text =editShipmentModel!.customerCode == null? " ":"${editShipmentModel!.customerCode}";
       shipmentName.text = editShipmentModel!.nameShipment!;
       weight.text = editShipmentModel!.weight!;
       size.text = editShipmentModel!.size!;
       count.text = "${editShipmentModel!.count!}";
       description.text = editShipmentModel!.description ?? "";
       mainNotes.text = editShipmentModel!.notes ?? "";
      getCustomerCityAndArea();
      getCustomerServiceType();
      emit(GetSpecificShipmentDataSuccessState());
    } on DioError catch (error) {
      log(error.toString());
      emit(GetSpecificShipmentDataErrorState(error.toString()));
    }
  }

  void editShipment({required shipmentIdSent}) async {
    log("shipment will be sent here = ${SaveValueInKey.shipmentId}");
    log("sender id here = ${SaveValueInKey.userId}");
    emit(EditShipmentOrderLoadingState());
    log(areaIdList.toString());
    log("areaIdNow = ${areaIdNow.toString()}");
    editShipmentModel = EditShipmentModel(
      deliveryDate: stringDeliveryDate,
      phone: mobile.text,
      address: address.text,
      areaId: areaIdNow ?? SaveValueInKey.customerAreaId,
      email: email.text,
      phone_2: mobile2.text,
      companyId: SaveValueInKey.userId,
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
      notes: mainNotes.text,
      customerCode: customerCode.text.contains("-")
          ? int.tryParse(customerCode.text)! * (-1)
          : int.tryParse(customerCode.text),
    );
    SaveValueInKey.userId = SharedCashHelper.getValue(key: "userId");
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    try {
      Response response = await DioHelper.postData(
        url: "${EDIT_SHIPMENT}${SaveValueInKey.shipmentId}",
        token: "",
        accessToken: "",
        authorization: "Bearer ${SaveValueInKey.accessToken}",
        data: editShipmentModel!.toMap(),
      );
      log(response.data.toString());
      log("success edit");
      emit(EditShipmentOrderSuccessState());
    } on DioError catch (e) {
      log(e.response!.statusCode.toString());
      log(e.response!.data.toString());
      if (e.response!.statusCode == 422) {
        if (e.response!.data["data_client.0.area_id"] != null) {
          log("area id msg not null");
          if (e.response!.data["data_client.0.service_type_id"] != null) {
            completeShowMsg =
            "برجاء اختيار المنطفة التابعة لها المرسل اليه ونوع خدمة الشحن ";
            emit(ShowErrorEditMsgInSnackBar());
          } else {
            completeShowMsg = "برجاء اختيار المدينة والمنطفة التابعة لها";
            emit(ShowErrorEditMsgInSnackBar());
          }
        } else if (e.response!.data["data_client.0.service_type_id"] != null) {
          completeShowMsg = "برجاء اختيار نوع خدمة الشحن اولا";
          emit(ShowErrorEditMsgInSnackBar());
        } else if (e.response!.data["data_client.0.phone"] != null) {
          completeShowMsg = "رقم موبايل المرسل اليه مسجل مسبقا الرجاء المراجعة";
          emit(ShowErrorEditMsgRedInSnackBar());
        }
      } else {
        emit(EditShipmentOrderErrorState(e.toString()));
      }
    }
  }

  List<String> cityList = [];

  dynamic selectedCity;
  bool isCitySelected = false;

  void selectFromCityChoices(choice) {
    selectedCity = choice;
    isCitySelected = !isCitySelected;
    areaList = [""];
    selectedArea = "";
    getSpecificAreas(choice);
    emit(SelectChoiceEditSuccessState());
  }

  List<String> areaList = [""];

  dynamic selectedArea;
  bool isAreaSelected = false;

  void selectFromAreaChoices(choice) {
    selectedArea = choice;
    isAreaSelected = !isAreaSelected;
    int localIndex = areaList.indexOf(choice.toString()) - 1;
    areaIdNow = areaIdList[localIndex];
    log("area id name now = ${areaIdNow.toString()}");
    emit(SelectChoiceEditSuccessState());
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
    areaIdList = [];
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
  String  cityHint = "";
  String areaHint= "";
  void getCustomerCityAndArea() {
    emit(GetCustomerCityAndAreaLoadingState());
    DioHelper.getData(url: GET_CITIES_DATA_OUT, authorization: "")
        .then((value) {
      log("data = ${value.data["province"][0]["areas"].toString()}");
      for (int index = 0; index < value.data["province"].length; index++) {
        for (int areaIndex = 0;
        areaIndex < value.data["province"][index]["areas"].length;
        areaIndex++) {
          if (value.data["province"][index]["areas"][areaIndex]["id"] ==
              SaveValueInKey.customerAreaId) {
            areaHint =
            value.data["province"][index]["areas"][areaIndex]["name"];
            cityHint = value.data["province"][index]["name"];
            log("city = $selectedCity and area = $selectedArea");
          }
        }
      }
      emit(GetCustomerCityAndAreaSuccessState());
    }).catchError((error) {
      log("error = ${error.toString()}");
      emit(GetCustomerCityAndAreaErrorState(error.toString()));
    });
  }
  String  serviceHint= "";
  void getCustomerServiceType() {
    emit(GetCustomerCityAndAreaLoadingState());
    DioHelper.getData(
        url: GET_SERVICE_TYPES_DATA,
        authorization: "Bearer ${SaveValueInKey.accessToken}")
        .then((value) {
      for (int index = 0; index < value.data["service_type"].length; index++) {
        if(value.data["service_type"][index]["id"]==SaveValueInKey.customerServiceTypeId)
          {
            serviceHint = value.data["service_type"][index]["type"];
            log("service type =${value.data["service_type"][index]["type"]}");
          }
      }
      log("service type =${serviceHint.toString()}");
      emit(GetServiceTypeSuccessState());
    });
  }

  void resetDropDownData(){
    cityList = [];
    areaList = [""];
     areaIdList = [];
     cityIdList = [];
    serviceTypes = [];
    serviceIds = [];
    serviceHint= "";
    cityHint = "";
    areaHint= "";
    emit(ResetDropDownData());
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
    emit(SelectChoiceEditSuccessState());
  }

  void getServiceType(int falseIndex) {
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
      resetFalse(falseIndex);
      emit(GetServiceListSuccessState());
    });
  }


  String showAddShipMsg = "";

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
    stringDeliveryDate = "";
    emit(ResetAreasEditSuccessState());
  }

  int? areaIdNow;
  String completeShowMsg = "";



  DateTime? deliveryDate;
  String stringDeliveryDate = "";

  void convertDeliveryDateToString() {
    stringDeliveryDate = DateFormat("y/MM/dd").format(deliveryDate!);
    emit(ConvertDateToString());
  }

  void getDeliveryDate({required DateTime myDate}) {
    deliveryDate = myDate;
    convertDeliveryDateToString();
    emit(GetDateAndShowIt());
  }
}
