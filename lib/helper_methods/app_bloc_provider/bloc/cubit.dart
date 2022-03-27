import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/user_client_model.dart';

class AppCubitClass extends Cubit<AppStates> {
  AppCubitClass() : super(InitialAppState());

  static AppCubitClass get(context) => BlocProvider.of(context);

  TextEditingController updatePhoneController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();
  TextEditingController updateNameController = TextEditingController();

  bool enableUpdateNameCompany = false;

  void enableUpdateNameCompanyFun() {
    enableUpdateNameCompany = true;
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdateEmailCompany = false;

  void enableUpdateEmailCompanyFunc() {
    enableUpdateEmailCompany = true;
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdatePhoneCompany = false;

  void enableUpdatePhoneCompanyFunc() {
    enableUpdatePhoneCompany = true;
    emit(EnableUpdateSuccessState());
  }

  void resetFalse() {
    enableUpdateNameCompany = false;
    enableUpdateEmailCompany = false;
    enableUpdatePhoneCompany = false;
    emit(ResetFalseSuccessState());
  }

  bool checkIfOneTrue() {
    if (enableUpdateNameCompany == true ||
        enableUpdatePhoneCompany == true ||
        enableUpdatePhoneCompany == true) {
      return true;
    }
    else{
      return false;
    }
  }

  CompanyModel? companyModel;

  void getCompanyProfileData() {
    //SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log("${SaveValueInKey.accessToken}");
    emit(GetProfileCompanyLoadingState());
    DioHelper.getData(
      url: PROFILE,
      authorization: "Bearer ${SaveValueInKey.accessToken}",
    ).then((value) {
      log("Succeeeeeeeeeeeeeeeeeeeeeeeeees");
      companyModel = CompanyModel.fromJson(value.data);
      log("${companyModel!.name}");
      updatePhoneController.text = companyModel!.phoneNumber!;
      updateNameController.text = companyModel!.name!;
      updateEmailController.text = companyModel!.email!;
      SaveValueInKey.userId = companyModel!.id!;
      emit(GetProfileCompanySuccessState(companyModel!));
    }).catchError((error) {
      log("erroooooooooooooooooooooooooooor");
      log(error.toString());
      emit(GetProfileCompanyErrorState(error));
    });
  }
}
