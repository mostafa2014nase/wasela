import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/helper_methods/modules/massege_model.dart';

class ShipForCompanyAppCubitClass extends Cubit<ShipStates> {
  ShipForCompanyAppCubitClass() : super(ShipInitState());

  static ShipForCompanyAppCubitClass get(context) => BlocProvider.of(context);
  TextEditingController notes = TextEditingController();
  TextEditingController complain = TextEditingController();

  int index = 0;

  void toggleTab(int receivedIndex) {
    index = receivedIndex;
    emit(PerformToggleTabsSuccessState());
  }

  bool shippingIsEmpty = false;

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
