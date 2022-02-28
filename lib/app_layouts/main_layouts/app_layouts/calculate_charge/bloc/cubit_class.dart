import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/states.dart';

class CalculateChargingCubitClass extends Cubit<CalculateChargingStates> {
  CalculateChargingCubitClass() : super(CalculateChargingInitState());

  static CalculateChargingCubitClass get(context) => BlocProvider.of(context);
  TextEditingController longController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String longHintWords = "أدخل الطول ";
  String widthHintWords = "أدخل العرض ";
  String weightHintWords = "أدخل الوزن ";

  bool no = true;

  void performYes() {
    no = false;
    emit(YesOrNoChangedSuccessCalculateState());
  }

  void performNo() {
    no = true;
    emit(YesOrNoChangedSuccessCalculateState());
  }

  bool right = true;

  void toggleRight() {
    right = true;
    emit(PerformToggleSuccessCalculateState());
  }

  void toggleLeft() {
    right = false;
    emit(PerformToggleSuccessCalculateState());
  }

  bool map = true;

  void toggleMap() {
    map = true;
    emit(PerformToggleMenuSuccessCalculateState());
  }

  void toggleMenu() {
    map = false;
    emit(PerformToggleMenuSuccessCalculateState());
  }

  bool leftChoice = false;
  bool middleChoice = false;
  bool rightChoice = true;

  void chooseLeft() {
    rightChoice = false;
    middleChoice = false;
    leftChoice = true;
    emit(ToggleScreensSuccessCalculateState());
  }

  void chooseRight() {
    rightChoice = true;
    middleChoice = false;
    leftChoice = false;
    emit(ToggleScreensSuccessCalculateState());
  }

  void chooseMiddle() {
    rightChoice = false;
    middleChoice = true;
    leftChoice = false;
    emit(ToggleScreensSuccessCalculateState());
  }

  List<String> menuList = [
    "cm",
    "m",
  ];

  var lengthSelected;
  bool selected = false;

  void selectLenghthChoice(choice) {
    lengthSelected = choice;
    selected = !selected;
    emit(SelectChoiceSuccessCalculateState());
  }

  var widthSelected;

  void selectWidthChoice(choice) {
    widthSelected = choice;
    selected = !selected;
    emit(SelectChoiceSuccessCalculateState());
  }

  var weightSelected;

  void selectWeightChoice(choice) {
    weightSelected = choice;
    selected = !selected;
    emit(SelectChoiceSuccessCalculateState());
  }
}
