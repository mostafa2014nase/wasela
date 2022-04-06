import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/user_client_model.dart';
import 'package:wasela/login/bloc/states.dart';
import '../../helper_methods/constants/end_points_urls_api.dart';
import '../../helper_methods/sharedpref/shared_preference.dart';

class LoginCubitClass extends Cubit<LoginStates> {
  LoginCubitClass() : super(LoginInitState());

  static LoginCubitClass get(context) => BlocProvider.of(context);

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void resetAll() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    emit(ResetControllersSuccessState());
  }

  bool isPassword = true;

  void makeItReadAble() {
    isPassword = !isPassword;
    emit(SwapSeeAndNotSuccessState());
  }

  bool remember = false;

  void makeRemember() {
    remember = true;
    emit(RememberSuccessState());
  }

  void makeNotRemember() {
    remember = false;
    emit(NotRememberSuccessState());
  }

  String errorMessage = "";
  bool isError = false;

  UserDataModel ? userDataModel;
  void login() {
    emit(LoginLoadingState());
    FirebaseMessaging.instance.getToken().then((token) async {
      SaveValueInKey.firebaseToken = token.toString();
      log(SaveValueInKey.firebaseToken.toString());
      DioHelper.postData(
        authorization: "",
        accessToken: '',
        token: SaveValueInKey.firebaseToken,
        url: LOGIN,
        data: {
          "phone_number": phoneController.text,
          "password": passwordController.text,
        },
      ).then((value) {
        userDataModel = UserDataModel.fromJson(value.data);
        log("phone number  =  ${userDataModel!.phone.toString()}");
        if (value.data["errNum"] == null) {
          SaveValueInKey.accessToken = value.data["access_token"];
          SaveValueInKey.userType = value.data["user"]["user_type"];
          SaveValueInKey.userId = value.data["user"]["user_data"]["user_id"];
          SaveValueInKey.companyId = value.data["user"]["user_data"]["id"];
          log(SaveValueInKey.userType.toString());
          SharedCashHelper.setValue(
                  key: "accessToken", value: SaveValueInKey.accessToken)
              .then((value) {
            log(SaveValueInKey.accessToken.toString());
            SharedCashHelper.setValue(key: "user_type", value: SaveValueInKey.userType).then((value) {
              SharedCashHelper.setValue(
                  key: "companyId", value: SaveValueInKey.companyId).then((value) {
                SharedCashHelper.setValue(
                    key: "userId", value: SaveValueInKey.userId).then((value) {
                  emit(LoginSuccessState());
                  resetAll();
                });
                });
            }).catchError((error){
              log(error.toString());
            });
          });
        } else {
          if (value.data["errNum"] == "0") {
            errorMessage = "لا يوجد حساب مسجل بهذا الرقم";
          } else if (value.data["errNum"] == "1") {
            errorMessage = "كلمة السر غير صحيحة";
          }
          emit(ShowErrorInSnackBar());
        }
      }).catchError((error) {
        log(error.toString());
        emit(LoginErrorState(error.toString()));
      });
    });
  }


  TextEditingController phoneForgetController = TextEditingController();
  TextEditingController passwordForgetController = TextEditingController();
  TextEditingController rePasswordForgetController = TextEditingController();
  String  forgetMsg  = "";

  void checkPhone(){
    emit(CheckPhoneLoadingState());
    DioHelper.postData(url: CHECK_PHONE_FORGET_PASSWORD, token: "", accessToken: "", authorization: "", data: {
      "phone_number": phoneForgetController,
    }).then((value) {
      log("success data = ${value.data}");
      emit(CheckPhoneSuccessState());
    }).catchError((error){
      log("error data = ${error.data}");
      emit(CheckPhoneErrorState(error));
    });
  }

  void forgetPassword(){
    emit(ForgetPasswordLoadingState());
    log(phoneForgetController.text);
    DioHelper.postData(url: FORGET_PASSWORD, token: "", accessToken: "", authorization: "", data: {
      "phone_number" : phoneForgetController.text,
      "password" : passwordForgetController.text,
      "password_confirmation" : rePasswordForgetController.text,
    }).then((value) {
      if(value.data == "successfully"){
        forgetMsg = "تم تغيير كلمة السر بنجاج , برجاء استخدام كلمة السر الجديدة عند تسجيل الدخول";
        log(value.data.toString());
        emit(ForgetPasswordSuccessState());
      }
      log(value.data.toString());

    }).catchError((error){
      log(error.toString());
      emit(ForgetPasswordErrorState(error));
    });
  }
}
