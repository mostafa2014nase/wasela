import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/our_places/bloc/states.dart';

class OurBranchesCubitClass extends Cubit<OurBranchesStates> {
  OurBranchesCubitClass() : super(OurBranchesInitState());

  static OurBranchesCubitClass get(context) => BlocProvider.of(context);

  bool map = true;

  void toggleMap() {
    map = true;
    emit(PerformToggleMenuSuccessState());
  }

  void toggleMenu() {
    map = false;
    emit(PerformToggleMenuSuccessState());
  }
}
