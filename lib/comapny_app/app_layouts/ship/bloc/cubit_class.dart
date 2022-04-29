import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/modules/cities_and_their_areas.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/massege_model.dart';
import 'package:wasela/helper_methods/modules/shipment_and_customer_models.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasela/translations/localeKeys.g.dart';

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
  List<bool> isDetailedSent = [];

  void detailedClickedSent(int index) {
    isDetailedSent[index] = !isDetailedSent[index];
    emit(ShowDetailsMenu());
  }
  List<bool> isDetailedEnded = [];

  void detailedClickedEnded(int index) {
    isDetailedEnded[index] = !isDetailedEnded[index];
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
  List sentList = [];
  List endedList = [];

  void getAllShipmentsData() {
    emit(GetAllShipmentsDataLoadingState());
    SaveValueInKey.userId = SharedCashHelper.getValue(key: "userId");
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log(SaveValueInKey.userId.toString());
    log(SaveValueInKey.accessToken.toString());
    tempList = [];
    sentList = [];
    endedList = [];
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
        log(value.data["shipment"]["data"][index].toString());
        if( shipmentsDetailsModel!.shipmentStatueId! > 1 &&  shipmentsDetailsModel!.shipmentStatueId!  < 7)
          {
            sentList.add(shipmentsDetailsModel!.toMap());
            isDetailedSent.add(false);
          }
        else if(shipmentsDetailsModel!.shipmentStatueId! == 1){
          tempList.add(shipmentsDetailsModel!.toMap());
          isDetailed.add(false);
        }
        else{
          endedList.add(shipmentsDetailsModel!.toMap());
          isDetailedEnded.add(false);
        }
      }
      allShipmentsData = AllShipmentsData(dataList: tempList);
      //allShipmentsData = AllShipmentsData.fromJson(value.data);
      //allShipmentsData!.map((data) => AllShipmentsData.fromJson(data)).toList();
      //shipmentsDetailsModel = ShipmentsDetailsModel.fromJson(value.data["shipment"]["data"][0]);
      log(allShipmentsData!.dataList.toString());
      log("current = ${tempList.toString()}");
      log("sent = ${sentList.toString()}");
      log("ended = ${endedList.toString()}");
      emit(GetAllShipmentsDataSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetAllShipmentsDataErrorState(error.toString()));
    });
  }

  List statusNameList = [];
  List statusIdList = [];

  // void getAllShipmentsDataWithStatus(num id) {
  //    statusNameList = [];
  //    statusIdList = [];
  //   emit(GetAllShipmentsDataWithStatusLoadingState());
  //   SaveValueInKey.userId = SharedCashHelper.getValue(key: "userId");
  //   SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
  //   DioHelper.getData(
  //       url: ALL_SHIPMENTS_RETURN,
  //       authorization: "Bearer ${SaveValueInKey.accessToken}")
  //       .then((value) {
  //     for (int index = 0;
  //     index < value.data["shipment"].length;
  //     index++) {
  //       if( id == value.data["shipment"][index]["id"]){
  //         log("id sent = $id");
  //         log("id compare = ${value.data["shipment"][index]["id"]}");
  //         log("name of it's statue = ${value.data["shipment"][index]["shipmentstatu"]["name"]}");
  //         statusNameList.add(value.data["shipment"][index]["shipmentstatu"]["name"]);
  //         statusIdList.add(value.data["shipment"][index]["shipmentstatu"]["id"]);
  //       }
  //     }
  //     log("status Name List = ${statusNameList.toString()}");
  //     log("status id List = ${statusIdList.toString()}");
  //
  //     emit(GetAllShipmentsDataWithStatusSuccessState());
  //   }).catchError((error) {
  //     log(error.toString());
  //     emit(GetAllShipmentsDataWithStatusErrorState(error.toString()));
  //   });
  // }

  Widget controlStepper(num status){
      if(status == 1 ){
        return Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
          children: [
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps3
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps3
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps4
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps5
                  .tr(),
            ),
          ],
        );
      }
      if(status == 2 ||  status == 3){
        return Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
          children: [
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps3
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps4
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps5
                  .tr(),
            ),
          ],
        );
      }
      if(status == 4 ){
        return Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
          children: [
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps4
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps5
                  .tr(),
            ),
          ],
        );
      }
      if(status == 5 ||  status == 6){
        return Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
          children: [
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps5
                  .tr(),
            ),
          ],
        );
      }
      if(status == 7 ){
        return Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
          children: [
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
          ],
        );
      }
      else {
        return Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
          children: [
            DoneCircularAvatar(
              underText: LocaleKeys
                  .shippingQueSteps1
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps3
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps3
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps4
                  .tr(),
            ),
            NotYetYellowContainer(
              underText: LocaleKeys
                  .shippingQueSteps5
                  .tr(),
            ),
          ],
        );
      }



  }

  void getUserToken() {
    FirebaseFirestore.instance.collection("users").doc().get().then((value) {
      log(value.toString());
    });
  }

  TextEditingController messageController = TextEditingController();
  void sendMessage({
    required String sender,
    required String receiver,
    required Timestamp date,
  }) {
    MessageModel model = MessageModel(
      text: messageController.text,
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

  bool messageControllerIsEmpty = true;
  void checkControllerIsEmpty(){
    if(messageController.text.isEmpty)
      {
        messageControllerIsEmpty= true;
        emit(ControllerISEmpty());
      }
    else
      {
        messageControllerIsEmpty= false;
        emit(ControllerISNotEmpty());

      }
  }
  void resetWrittenMsg(){
    messageController = TextEditingController();
    checkControllerIsEmpty();
    emit(ResetMsgController());
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
        .orderBy("dateTime")
        .snapshots()
        .listen((event) {
      messages = [];
      for (var element in event.docs) {
        log(element.data().toString());
        messages.add(MessageModel.fromJson(element.data()));
      }
      emit(GetAllMessages());
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
            .contains(keyName) ||
            value.data["shipment"]["data"][index]["client"]["phone"]
                .toString()
                .contains(keyName)) &&
            (DateTime.parse(value.data["shipment"]["data"][index]["created_at"])
                .isBefore(toDate!) || DateTime
                .parse(value.data["shipment"]["data"][index]["created_at"])
                .day == toDate!.day) &&
            (DateTime.parse(value.data["shipment"]["data"][index]["created_at"]
            )
                .isAfter(fromDate!)) || DateTime
            .parse(value.data["shipment"]["data"][index]["created_at"]
        )
            .day == fromDate!.day) {
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
    if (searchController.text.isNotEmpty || stringFromDate != "" ||
        stringToDate != "") {
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

  List propertiesOFCompany = [];

  int ? companyId;
  int clickedWatsAppCount = 0;
  int clickedPhoneCount = 0;
  int clickedSmsCount = 0;


  void openWatsApp({required String phone,}) async {
    companyId = SharedCashHelper.getValue(key: "companyId");
    log(companyId.toString());
    List temp = SharedCashHelper.getValue(key: "companyKey");
    propertiesOFCompany = temp.map((item) => jsonDecode(item)).toList();
    log(temp.toString());
    log(propertiesOFCompany.toString());
    for (int index = 0; index < propertiesOFCompany.length; index++) {
      log(companyId.toString());
      if (companyId == propertiesOFCompany[index]["companyId"]) {
        log(companyId.toString());
        propertiesOFCompany[index]["watsAppCount"]++;
        clickedWatsAppCount = propertiesOFCompany[index]["watsAppCount"];
        log(propertiesOFCompany[index]["watsAppCount"].toString());
        // clickedPhoneCount = propertiesOFCompany[index]["phoneCount"];
        // clickedSmsCount = propertiesOFCompany[index]["smsCount"];
      }
    }
    temp = propertiesOFCompany.map((item) => jsonEncode(item)).toList();
    SharedCashHelper.setValue(key: "companyKey", value: temp).then((
        value) {
      log("properties OF Company = ${SharedCashHelper.getValue(
          key: "companyKey").toString()}");
      SharedCashHelper.setValue(key: "watsAppCount", value: clickedWatsAppCount).then((value) async{
        log(phone);
        log(Platform.isIOS.toString());
        String url() {
          if (Platform.isIOS) {
            return "whatsapp://wa.me/+2$phone";
          } else {
            return "whatsapp://send?phone=+2$phone";
          }
        }
        bool result = await canLaunch(url());
        if (result) {
          await launch(url());
          emit(OpenWhatsAppSuccessState());
        } else {
          watsAppErrorMsg = "whatsApp is not downloaded";
          emit(OpenWhatsAppErrorState());
        }
      });

    });
  }

  void callPhone({required String phone}) async {
    companyId = SharedCashHelper.getValue(key: "companyId");
    log(companyId.toString());
    List temp = SharedCashHelper.getValue(key: "companyKey");
    propertiesOFCompany = temp.map((item) => jsonDecode(item)).toList();
    log(temp.toString());
    log(propertiesOFCompany.toString());
    for (int index = 0; index < propertiesOFCompany.length; index++) {
      log(companyId.toString());
      if (companyId == propertiesOFCompany[index]["companyId"]) {
        log(companyId.toString());
        propertiesOFCompany[index]["phoneCount"]++;
        clickedPhoneCount = propertiesOFCompany[index]["phoneCount"];
        log(propertiesOFCompany[index]["phoneCount"].toString());
        // clickedPhoneCount = propertiesOFCompany[index]["phoneCount"];
        // clickedSmsCount = propertiesOFCompany[index]["smsCount"];
      }
    }
    temp = propertiesOFCompany.map((item) => jsonEncode(item)).toList();
    SharedCashHelper.setValue(key: "companyKey", value: temp).then((
        value) async {
      log("properties OF Company = ${SharedCashHelper.getValue(
          key: "companyKey").toString()}");
      SharedCashHelper.setValue(key: "phoneCount", value: clickedPhoneCount).then((value) async{
        log(phone);
        log(Platform.isIOS.toString());
        String url = "tel:${phone}";
        bool result = await canLaunch(url);
        if (result) {
          await launch(url);
          emit(CallPhoneSuccessState());
        } else {
          watsAppErrorMsg = "whatsApp is not downloaded";
          emit(CallPhoneErrorState());
        }
      });

    });
  }

  void sendSms({required String phone}) async {
    companyId = SharedCashHelper.getValue(key: "companyId");
    log(companyId.toString());
    List temp = SharedCashHelper.getValue(key: "companyKey");
    propertiesOFCompany = temp.map((item) => jsonDecode(item)).toList();
    log(temp.toString());
    log(propertiesOFCompany.toString());
    for (int index = 0; index < propertiesOFCompany.length; index++) {
      log(companyId.toString());
      if (companyId == propertiesOFCompany[index]["companyId"]) {
        log(companyId.toString());
        propertiesOFCompany[index]["smsCount"]++;
        clickedSmsCount = propertiesOFCompany[index]["smsCount"];
        log(propertiesOFCompany[index]["smsCount"].toString());
        // clickedPhoneCount = propertiesOFCompany[index]["phoneCount"];
        // clickedSmsCount = propertiesOFCompany[index]["smsCount"];
      }
    }
    temp = propertiesOFCompany.map((item) => jsonEncode(item)).toList();
    SharedCashHelper.setValue(key: "companyKey", value: temp).then((
        value) async {
      log("properties OF Company = ${SharedCashHelper.getValue(
          key: "companyKey").toString()}");
      SharedCashHelper.setValue(key: "smsCount", value: clickedSmsCount).then((value) async{
        log(phone);
        log(Platform.isIOS.toString());
        String url = "sms:${phone}";
        bool result = await canLaunch(url);
        if (result) {
          await launch(url);
          emit(SendSmsSuccessState());
        } else {
          watsAppErrorMsg = "whatsApp is not downloaded";
          emit(SendSmsErrorState());
        }
      });

    });
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
      customerCode.text =
      editShipmentModel!.customerCode == null ? " " : "${editShipmentModel!
          .customerCode}";
      shipmentName.text = editShipmentModel!.nameShipment!;
      weight.text = "${editShipmentModel!.weight!}";
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
      weight: weight.text.contains("-")
          ? int.tryParse(weight.text)! * (-1)
          : int.tryParse(weight.text),
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

  String cityHint = "";
  String areaHint = "";

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

  String serviceHint = "";

  void getCustomerServiceType() {
    emit(GetCustomerCityAndAreaLoadingState());
    DioHelper.getData(
        url: GET_SERVICE_TYPES_DATA,
        authorization: "Bearer ${SaveValueInKey.accessToken}")
        .then((value) {
      for (int index = 0; index < value.data["service_type"].length; index++) {
        if (value.data["service_type"][index]["id"] ==
            SaveValueInKey.customerServiceTypeId) {
          serviceHint = value.data["service_type"][index]["type"];
          log("service type =${value.data["service_type"][index]["type"]}");
        }
      }
      log("service type =${serviceHint.toString()}");
      emit(GetServiceTypeSuccessState());
    });
  }

  void resetDropDownData() {
    cityList = [];
    areaList = [""];
    areaIdList = [];
    cityIdList = [];
    serviceTypes = [];
    serviceIds = [];
    serviceHint = "";
    cityHint = "";
    areaHint = "";
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

  ///////////////////// for detect location /////////////////////////

  ///////////////////// for refresh /////////////////////////
  RefreshController refreshController =
  RefreshController(initialRefresh: false);
  void refresh() async{
  // monitor network fetch
  await Future.delayed(const Duration(milliseconds: 1000));
  getAllShipmentsData();
  refreshController.refreshCompleted();
  emit(RefreshAllShipments());
}

  void onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }

}
