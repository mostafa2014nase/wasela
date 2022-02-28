import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/charge/bloc/states.dart';

class ChargeCubitClass extends Cubit<ChargeStates> {
  ChargeCubitClass() : super(ChargeStatesInitState());

  static ChargeCubitClass get(context) => BlocProvider.of(context);

  int index = 0;

  void toggleTab(int receivedIndex) {
    index = receivedIndex;
    emit(PerformToggleTabsSuccessState());
  }
}
