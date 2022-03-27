import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/user_client_model.dart';
import 'package:wasela/profile/bloc/states.dart';

class ProfileCubitClass extends Cubit<ProfileStates> {
  ProfileCubitClass() : super(ProfileStatesInitState());

  static ProfileCubitClass get(context) => BlocProvider.of(context);

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
}
