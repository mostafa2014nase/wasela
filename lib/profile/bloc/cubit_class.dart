import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
