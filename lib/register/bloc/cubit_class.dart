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

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  TextEditingController phoneForCompanyController = TextEditingController();
  TextEditingController optionalPhoneForCompanyController =
      TextEditingController();

  void resetAll() {
    phoneController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
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

  void register(String phone) {
    emit(RegisterWithPhonesLoadingState());
    DioHelper.postData(
      accessToken: '',
      token: '',
      url: REGISTER,
      data: {
        "name": nameController.text,
        "phone_number": phone,
        "password": passwordController.text,
        "password_confirmation": rePasswordController.text,
        "email": emailController.text,
        "is_company": isCompany,
      },
    ).then((value) {
      SaveValueInKey.accessToken = value.data["access_token"];
      log("is company = ${value.data["user"]["user_data"]["is_company"]}");
      SharedCashHelper.setValue(
              key: "accessToken", value: SaveValueInKey.accessToken)
          .then((value) {
        print(SaveValueInKey.accessToken.toString());
        emit(RegisterWithPhonesSuccessState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(RegisterWithPhonesErrorState(error.toString()));
    });
  }
}
