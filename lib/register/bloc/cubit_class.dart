import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/register/bloc/states.dart';

class RegisterCubitClass extends Cubit<RegisterStates> {
  RegisterCubitClass() : super(RegisterStatesInitState());

  static RegisterCubitClass get(context) => BlocProvider.of(context);

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  void resetAll(){
     phoneController = TextEditingController();
     nameController = TextEditingController();
     emailController = TextEditingController();
     passwordController = TextEditingController();
     rePasswordController = TextEditingController();
     emit(ResetControllersSuccessState());
  }

}
