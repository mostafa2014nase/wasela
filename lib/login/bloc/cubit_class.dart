import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
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

  UserDataModel? userDataModel;
  List  propertiesOFCompany = [];

  void login() {
    //SharedCashHelper.removeValue(key: "companyKey");
    emit(LoginLoadingState());
    FirebaseMessaging.instance.getToken().then((token) async {
      SaveValueInKey.firebaseToken = token.toString();
      log(SaveValueInKey.firebaseToken.toString());
      try {
        Response response = await DioHelper.postData(
          authorization: "",
          accessToken: '',
          token: SaveValueInKey.firebaseToken,
          url: LOGIN,
          data: {
            "phone_number": phoneController.text,
            "password": passwordController.text,
          },
        );
        SaveValueInKey.accessToken = response.data["access_token"];
        SaveValueInKey.userType = response.data["user"]["user_type"];
        SaveValueInKey.userId = response.data["user"]["user_data"]["user_id"];
        SaveValueInKey.companyId = response.data["user"]["id"];
        log(SaveValueInKey.userType.toString());
        SharedCashHelper.setValue(
                key: "accessToken", value: SaveValueInKey.accessToken)
            .then((value) {
          log(SaveValueInKey.accessToken.toString());
          SharedCashHelper.setValue(
                  key: "user_type", value: SaveValueInKey.userType)
              .then((value) {
            SharedCashHelper.setValue(
                    key: "companyId", value: SaveValueInKey.companyId)
                .then((value) {
              SharedCashHelper.setValue(
                      key: "userId", value: SaveValueInKey.userId)
                  .then((value) {
                    if(SharedCashHelper.getValue(key: "companyKey") != null){
                      List  tempList = SharedCashHelper.getValue(key: "companyKey");
                       propertiesOFCompany = tempList.map((item) => jsonDecode(item)).toList();
                      for(int index = 0 ;index < propertiesOFCompany.length ;index++){
                        if(response.data["user"]["id"] != propertiesOFCompany[index]["companyId"])
                          {
                            Map tempAddList = {
                              "companyId": response.data["user"]["id"],
                                "watsAppCount": 0,
                                "phoneCount": 0,
                                "smsCount": 0,
                             };
                            propertiesOFCompany.add(tempAddList);
                            List <String> tempList = propertiesOFCompany.map((item) => jsonEncode(item)).toList();
                            SharedCashHelper.setValue(key: "companyKey", value: tempList).then((value) {
                              log("data of company = ${SharedCashHelper.getValue(key: "companyKey").toString()}");
                            });
                          }
                      }
                    }
                    else{
                      log(SharedCashHelper.getValue(key: "companyKey").toString());
                      propertiesOFCompany=[{
                        "companyId": response.data["user"]["id"],
                        "watsAppCount": 0,
                        "phoneCount": 0,
                        "smsCount": 0,
                      }];
                       List <String> tempList = propertiesOFCompany.map((item) => jsonEncode(item)).toList();
                      SharedCashHelper.setValue(key: "companyKey", value: tempList).then((value) {
                        log("data of company of else = ${SharedCashHelper.getValue(key: "companyKey").toString()}");
                      });
                    }
                    emit(LoginSuccessState());
                    resetAll();
              });
            });
          }).catchError((error) {
            log(error.toString());
          });
        });
      } on DioError catch (e) {
        log(e.response!.statusCode.toString());
        log(e.response!.data.toString());
        if (e.response!.statusCode == 422) {
          if (e.response!.data["errNum"] == "0") {
            errorMessage = "لا يوجد حساب مسجل بهذا الرقم";
          } else if (e.response!.data["errNum"] == "1") {
            errorMessage = "كلمة السر غير صحيحة";
          }
          emit(ShowErrorInSnackBar());
        } else {
          emit(LoginErrorState(e.toString()));
        }
      }
    });
  }

  TextEditingController phoneForgetController = TextEditingController();
  TextEditingController passwordForgetController = TextEditingController();
  TextEditingController rePasswordForgetController = TextEditingController();
  String forgetMsg = "";

  void checkPhone() async {
    emit(CheckPhoneLoadingState());
    try {
      var responses = await DioHelper.postData(
          url: CHECK_PHONE_FORGET_PASSWORD,
          token: "",
          accessToken: "",
          authorization: "",
          data: {
            "phone_number": phoneForgetController.text,
          });
      log(responses.data.toString());
      emit(CheckPhoneSuccessState());
    }on DioError catch (error) {
      if (error.response!.statusCode == 422) {
        log(error.response!.data.toString());
        if (error.response!.data["Not Found PhoneNumber"] == "") {
          forgetMsg = "خطأ .. هذا الرقم غير مسجل فى قاعدة البيانات";
        }
        emit(ShowErrorInSnackBar());
      } else {
        log("error data = ${error.response!.statusCode}");
        emit(CheckPhoneErrorState(error.toString()));
      }
      emit(CheckPhoneErrorState(error.toString()));
    }
  }

  void forgetPassword() {
    emit(ForgetPasswordLoadingState());
    log(phoneForgetController.text);
    DioHelper.postData(
        url: FORGET_PASSWORD,
        token: "",
        accessToken: "",
        authorization: "",
        data: {
          "phone_number": phoneForgetController.text,
          "password": passwordForgetController.text,
          "password_confirmation": rePasswordForgetController.text,
        }).then((value) {
      if (value.data == "successfully") {
        forgetMsg =
            "تم تغيير كلمة السر بنجاج , برجاء استخدام كلمة السر الجديدة عند تسجيل الدخول";
        log(value.data.toString());
        emit(ForgetPasswordSuccessState());
      }
      log(value.data.toString());
    }).catchError((error) {
      log(error.toString());
      emit(ForgetPasswordErrorState(error));
    });
  }
}
