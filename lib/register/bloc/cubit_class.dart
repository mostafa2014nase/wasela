import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  TextEditingController optionalPhoneForCompanyController =
      TextEditingController();
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
    SaveValueInKey.userType = "company";
    SharedCashHelper.setValue(key: "company", value: 0).then((value) {
      emit(MakeItCompanySuccessState());
    });
  }

  void makeNotCompany() {
    SaveValueInKey.userType = "client";
    SharedCashHelper.setValue(key: "user_type", value: "client").then((value) {
      emit(MakeItNotCompanySuccessState());
    });
  }

  String errorCompanyMessage = "";

  void registerCompany() async{
    emit(RegisterCompanyLoadingState());
    try {
      var response = await DioHelper.postData(
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
      );
      SaveValueInKey.accessToken = response.data["access_token"];
      SaveValueInKey.userType = response.data["user"]["user_type"];
      log("user_type = ${response.data["user"]["user_type"]}");
      SharedCashHelper.setValue(
          key: "accessToken", value: SaveValueInKey.accessToken)
          .then((value) {
        SharedCashHelper.setValue(
            key: "user_type", value: SaveValueInKey.userType)
            .then((value) {
          log(SaveValueInKey.accessToken.toString());
          log(SaveValueInKey.userType.toString());
          emit(RegisterCompanySuccessState());
        }).catchError((error) {
          log("error in caching user_type ${error.toString()}");
        });
      });
      log(response.data.toString());
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        final res = jsonDecode(e.response!.data);
        log(res['email'].toString());
        if(res['email'].toString() == "[The email has already been taken.]")
        {
          log("firsssssssssssst steeeeeeeeeeep");
          errorCompanyMessage = "الايميل مسجل بالفعل";
        }
        else if(res['phone_number'].toString() == "[The phone number has already been taken.]"){
          errorCompanyMessage = "رقم الموبايل مسجل بالفعل";
        }
      } else {
        log(e.response!.data);
      }
      emit(RegisterCompanyErrorState(e.toString()));
    }
  }

  String errorClientMessage = "";

  void registerClient(String phone) async{
    emit(RegisterClientLoadingState());
    try {
      var response = await DioHelper.postData(
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
      );
      SaveValueInKey.accessToken = response.data["access_token"];
      SaveValueInKey.companyId = response.data["access_token"];
      SaveValueInKey.userId = response.data["user"]["user_data"]["user_id"];
      SaveValueInKey.companyId = response.data["user"]["user_data"]["id"];
      log("user_type = ${response.data["user"]["user_type"]}");
      SharedCashHelper.setValue(
          key: "accessToken", value: SaveValueInKey.accessToken)
          .then((value) {
        SharedCashHelper.setValue(
            key: "companyId", value: SaveValueInKey.companyId).then((value) {
          SharedCashHelper.setValue(
              key: "userId", value: SaveValueInKey.userId).then((value){
            print(SaveValueInKey.accessToken.toString());
            emit(RegisterClientSuccessState());
          });
        });
      });
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        final res = jsonDecode(e.response!.data);
        log(res['email'].toString());
        if(res['email'].toString() == "[The email has already been taken.]")
        {
          log("firsssssssssssst steeeeeeeeeeep");
          errorClientMessage = "الايميل مسجل بالفعل";
        }
        else if(res['phone_number'].toString() == "[The phone number has already been taken.]"){
          errorClientMessage = "رقم الموبايل مسجل بالفعل";
        }
      } else {
        log(e.response!.data);
      }
      emit(RegisterClientErrorState(e.toString()));
    }
  }
}
