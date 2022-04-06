import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/massege_model.dart';
import 'package:wasela/helper_methods/modules/shipment_and_customer_models.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';

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

  int index = 0;

  void toggleTab(int receivedIndex) {
    index = receivedIndex;
    emit(PerformToggleTabsSuccessState());
  }

  bool shippingIsEmpty = false;
  int showShipmentsListLength = 0;
  ShipmentsDetailsModel ? shipmentsDetailsModel;
  AllShipmentsData ? allShipmentsData;
  List tempList = [];


  void getAllShipmentsData(){
    emit(GetAllShipmentsDataLoadingState());
    SaveValueInKey.userId = SharedCashHelper.getValue(key: "userId");
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log(SaveValueInKey.userId.toString());
    log(SaveValueInKey.accessToken.toString());
    log("$ALL_SHIPMENTS${SaveValueInKey.userId}");
    DioHelper.getData(url: "$ALL_SHIPMENTS${SaveValueInKey.userId}", authorization: "Bearer ${SaveValueInKey.accessToken}").then((value) {
      showShipmentsListLength = value.data["shipment"]["data"].length;
      log("shipments data length = ${showShipmentsListLength.toString()}");
      for(int index = 0; index < value.data["shipment"]["data"].length ;index++)
        {
          shipmentsDetailsModel = ShipmentsDetailsModel.fromJson(value.data["shipment"]["data"][index]);
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
    }).catchError((error){
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
}
