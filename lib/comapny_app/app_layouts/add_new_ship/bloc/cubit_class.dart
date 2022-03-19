import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/states.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class AddNewShipCubitClass extends Cubit<AddNewShipStates> {
  AddNewShipCubitClass() : super(AddNewShipInitialState());

  static AddNewShipCubitClass get(context) => BlocProvider.of(context);

  TextEditingController receiverName = TextEditingController();
  TextEditingController cost = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController mobile2 = TextEditingController();
  TextEditingController email = TextEditingController();

  List<String> cityList = [
    "الدقى",
    "المعادى",
    "جسر السويس",
    "حلوان",
    "مصر الجديدة",
    "مدينة نصر",
  ];

  var selectedCity;
  bool isCitySelected = false;

  void selectFromCityChoices(choice) {
    selectedCity = choice;
    isCitySelected = !isCitySelected;
    emit(SelectChoiceSuccessState());
  }

  var selectedArea;
  bool isAreaSelected = false;

  void selectFromAreaChoices(choice) {
    selectedArea = choice;
    isAreaSelected = !isAreaSelected;
    emit(SelectChoiceSuccessState());
  }

  // ship data screen

  TextEditingController productName = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController notes = TextEditingController();

  List<String> processKind = [
    "اثاث",
    "ملابس",
  ];

  var kindSelected;
  bool isKindSelected = false;

  void selectKind(choice) {
    kindSelected = choice;
    isKindSelected = !isKindSelected;
    emit(SelectChoiceSuccessState());
  }

  // complete progress
  bool isDataSent = false;

  void makeDataSent() {
    isDataSent = true;
    emit(DataSentSuccessState());
  }  void makeDataNotSent() {
    isDataSent = false;
    emit(DataSentSuccessState());
  }
}
