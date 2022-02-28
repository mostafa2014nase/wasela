import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/home/home_bloc/home_states.dart';

class HomeCubitClass extends Cubit<HomeStates> {
  HomeCubitClass() : super(HomeInitialState());

  static HomeCubitClass get(context) => BlocProvider.of(context);

  List<IconData> drawerIcons = [
    Icons.info_outline_rounded,
    Icons.phone,
    Icons.celebration,
    Icons.computer,
    Icons.logout,
  ];
  List<String> drawerTexts = [
    "Informations",
    "Contact us",
    "Points system",
    "Developer info",
    "Logout",
  ];
  int index = 0;

  void drawerTranaction(context, drawerIndex) {
    index = drawerIndex;
    emit(DrawerTransaction());
  }
}
