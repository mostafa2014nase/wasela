import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/drawer/settings/bloc/states.dart';

class DrawerCubitClass extends Cubit<DrawerStates> {
  DrawerCubitClass() : super(DrawerStatesInitState());

  static DrawerCubitClass get(context) => BlocProvider.of(context);

  // for contact us screen
  TextEditingController completeName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();

  bool isCall = true;

  void swapToEmailAnswer() {
    isCall = false;
    completeName = TextEditingController();
    email = TextEditingController();
    message = TextEditingController();
    emit(SwapToEmailAnswerSuccessState());
  }

  void swapToCallAnswer() {
    isCall = true;
    completeName = TextEditingController();
    phoneNumber = TextEditingController();
    email = TextEditingController();
    message = TextEditingController();
    emit(SwapToCallAnswerSuccessState());
  }
}
