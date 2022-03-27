import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/drawer/settings/bloc/states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';

class DrawerCubitClass extends Cubit<DrawerStates> {
  DrawerCubitClass() : super(DrawerStatesInitState());

  static DrawerCubitClass get(context) => BlocProvider.of(context);

  // for contact us screen
  TextEditingController completeName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();

  // for change password screen
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reNewPasswordController = TextEditingController();

  bool isPassword = true;

  void makeItReadAble() {
    isPassword = !isPassword;
    emit(SwapSeeAndNotSuccessState());
  }

  String responseMessage = "";
  void changePassword() {
    emit(ChangePasswordLoadingState());
    responseMessage= "";
    SaveValueInKey.accessToken = SharedCashHelper.getValue(
      key: "accessToken", );
    DioHelper.postData(
      authorization: "Bearer ${SaveValueInKey.accessToken}",
      accessToken: "",
      token: '',
      url: CHANGE_PASSWORD,
      data: {
        "old_password": currentPasswordController.text,
        "password": newPasswordController.text,
        "password_confirmation": reNewPasswordController.text,
      },
    ).then((value) {
      log("response data = ${value.data}");
      if(value.data.toString() == "change password successfully"){
        responseMessage = "تم تغيير كلمة المرور بنجاح";
        resetAll();
      }
      else{
        responseMessage = "كلمة المرور الحالية غير صحيحة";
      }
      emit(ChangePasswordSuccessState());

    }).catchError((error) {
      print(error.toString());
      log("${SaveValueInKey.accessToken}");
      emit(ChangePasswordErrorState(error.toString()));
    });
  }


  void resetAll() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    reNewPasswordController = TextEditingController();
    emit(ResetControllersSuccessState());
  }
// for contact us screen
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
