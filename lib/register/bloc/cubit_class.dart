import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:wasela/register/bloc/states.dart';
import '../../helper_methods/constants/end_points_urls_api.dart';

class RegisterCubitClass extends Cubit<RegisterStates> {
  RegisterCubitClass() : super(RegisterStatesInitState());

  static RegisterCubitClass get(context) => BlocProvider.of(context);
// phone for two modules
  TextEditingController phoneController = TextEditingController();
// client data
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
// company data
  TextEditingController nameCompanyController = TextEditingController();
  TextEditingController phoneForCompanyController = TextEditingController();
  TextEditingController optionalPhoneForCompanyController = TextEditingController();
  TextEditingController emailCompanyController = TextEditingController();
  TextEditingController passwordCompanyController = TextEditingController();
  TextEditingController rePasswordCompanyController = TextEditingController();

  void resetAll() {
    // client clear
    phoneController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    // company clear
    nameCompanyController = TextEditingController();
    phoneForCompanyController = TextEditingController();
    optionalPhoneForCompanyController = TextEditingController();
    emailCompanyController = TextEditingController();
    passwordCompanyController = TextEditingController();
    rePasswordCompanyController = TextEditingController();
    emit(ResetControllersSuccessState());
  }

  bool isPassword = true;

  void makeItReadAble() {
    isPassword = !isPassword;
    emit(SwapSeeAndNotSuccessState());
  }

  void makeCompany() {
    isCompany = 0;
    SharedCashHelper.setValue(key: "isCompany", value: 0).then((value) {
      emit(MakeItCompanySuccessState());
    });
  }

  void makeNotCompany() {
    isCompany = 1;
    SharedCashHelper.setValue(key: "isCompany", value: 1).then((value) {
      emit(MakeItNotCompanySuccessState());
    });
  }

  void registerCompany() {
    emit(RegisterCompanyLoadingState());
    DioHelper.postData(
      authorization: "",
      accessToken: '',
      token: '',
      url: REGISTER_COMPANY,
      data: {
        "name": nameCompanyController.text,
        "phone_number": phoneForCompanyController.text,
        "password": passwordCompanyController.text,
        "password_confirmation": rePasswordCompanyController.text,
        "email": emailCompanyController.text,
      },
    ).then((value) {
      SaveValueInKey.accessToken = value.data["access_token"];
      log("user_type = ${value.data["user"]["user_type"]}");
      SharedCashHelper.setValue(
              key: "accessToken", value: SaveValueInKey.accessToken)
          .then((value) {
        print(SaveValueInKey.accessToken.toString());
        emit(RegisterCompanySuccessState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(RegisterCompanyErrorState(error.toString()));
    });
  }


  void registerClient(String phone) {
    emit(RegisterClientLoadingState());
    DioHelper.postData(
      authorization: "",
      accessToken: '',
      token: '',
      url: REGISTER,
      data: {
        "name": nameController.text,
        "phone_number": phone,
        "password": passwordController.text,
        "password_confirmation": rePasswordController.text,
        "email": emailController.text,
      },
    ).then((value) {
      SaveValueInKey.accessToken = value.data["access_token"];
      log("user_type = ${value.data["user"]["user_type"]}");
      SharedCashHelper.setValue(
              key: "accessToken", value: SaveValueInKey.accessToken)
          .then((value) {
        print(SaveValueInKey.accessToken.toString());
        emit(RegisterClientSuccessState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(RegisterClientErrorState(error.toString()));
    });
  }
}
