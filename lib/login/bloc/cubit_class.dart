import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';

import 'package:wasela/login/bloc/states.dart';
import '../../helper_methods/constants/end_points_urls_api.dart';
import '../../helper_methods/sharedpref/shared_preference.dart';

class LoginCubitClass extends Cubit<LoginStates> {
  LoginCubitClass() : super(LoginInitState());

  static LoginCubitClass get(context) => BlocProvider.of(context);

   TextEditingController phoneController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

  //
  // void resetAll() {
  //   phoneController = TextEditingController();
  //   nameController = TextEditingController();
  //   emailController = TextEditingController();
  //   passwordController = TextEditingController();
  //   rePasswordController = TextEditingController();
  //   emit(ResetControllersSuccessState());
  // }
  bool isPassword = true;
  void makeItReadAble (){
    isPassword = !isPassword;
    emit(SwapSeeAndNotSuccessState());
  }

  bool remember = false;

  void makeRemember(){
    remember = true;
    emit(RememberSuccessState());
  }
  void makeNotRemember(){
    remember = false;
    emit(NotRememberSuccessState());
  }

  void login() {
    emit(LoginLoadingState());
    FirebaseMessaging.instance.getToken().then((token) {
      SaveValueInKey.firebaseToken = token.toString();
      log(SaveValueInKey.firebaseToken.toString());
      DioHelper.postData(
        accessToken: '',
        token: "$token",
        url: LOGIN,
        data: {
          "phone_number": phoneController.text,
          "password": passwordController.text,
        },
      ).then((value) {
        SaveValueInKey.accessToken = value.data["access_token"];
        log("is company = ${value.data["user"]["user_data"]["is_company"]}");
        SharedCashHelper.setValue(key: "accessToken", value: SaveValueInKey.accessToken).then((value) {
          print(SaveValueInKey.accessToken.toString());
          emit(LoginSuccessState());
        });
      }).catchError((error) {
        print(error.toString());
        emit(LoginErrorState(error.toString()));
      });
      });
  }
}
