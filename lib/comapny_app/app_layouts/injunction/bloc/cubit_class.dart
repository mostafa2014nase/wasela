import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/injunction/bloc/states.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class InjunctionsAppCubitClass extends Cubit<InjunctionsStates> {
  InjunctionsAppCubitClass() : super(InjunctionsInitState());

  static InjunctionsAppCubitClass get(context) => BlocProvider.of(context);
  TextEditingController longController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String longHintWords = LocaleKeys.calculateScreenTab3Hint1.tr();
  String widthHintWords = LocaleKeys.calculateScreenTab3Hint2.tr();
  String weightHintWords = LocaleKeys.calculateScreenTab3Hint3.tr();
  String heightHintWords = LocaleKeys.calculateScreenTab3Hint4.tr();

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
    LocaleKeys.cm.tr(),
    LocaleKeys.meter.tr(),
  ];
  List<String> menu1List = [
    LocaleKeys.weight1.tr(),
    LocaleKeys.weight2.tr(),
  ];

  var lengthSelected;
  bool selected = false;

  void selectLengthChoice(choice) {
    lengthSelected = choice;
    selected = !selected;
    emit(SelectChoiceSuccessCalculateState());
  }

  List<String> shippingKindMenu = [
    "أثاث",
    "ادوية",
    "ملابس",
  ];

  var shipSelected;

  void selectShipKindChoice(choice) {
    shipSelected = choice;
    //selected = !selected;
    emit(SelectChoiceSuccessCalculateState());
  }

  var widthSelected;

  void selectWidthChoice(choice) {
    widthSelected = choice;
    selected = !selected;
    emit(SelectChoiceSuccessCalculateState());
  }

  var heightSelected;

  void selectHeightChoice(choice) {
    heightSelected = choice;
    selected = !selected;
    emit(SelectChoiceSuccessCalculateState());
  }

  var weightSelected;

  void selectWeightChoice(choice) {
    weightSelected = choice;
    selected = !selected;
    emit(SelectChoiceSuccessCalculateState());
  }

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
    emit(SelectChoiceSuccessCalculateState());
  }

  var selectedPosition;
  bool isPositionSelected = false;

  void selectFromPositionChoices(choice) {
    selectedPosition = choice;
    isPositionSelected = !isPositionSelected;
    emit(SelectChoiceSuccessCalculateState());
  }

  TextEditingController completeName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();

  bool fawry = false;
  bool vodCash = false;
  bool visa = false;
  bool mandoob = false;
  bool cashPay = true;

  void payFawry() {
    fawry = true;
    vodCash = false;
    visa = false;
    mandoob = false;
    cashPay = false;
    emit(PerformSwitchFawrySuccessCalculateState());
  }

  void payVodCash() {
    fawry = false;
    vodCash = true;
    visa = false;
    mandoob = false;
    cashPay = false;
    emit(PerformSwitchVodCashSuccessCalculateState());
  }

  void payVisa() {
    fawry = false;
    vodCash = false;
    visa = true;
    mandoob = false;
    cashPay = false;
    emit(PerformSwitchVisaSuccessCalculateState());
  }

  void payMandoob() {
    fawry = false;
    vodCash = false;
    visa = false;
    mandoob = true;
    cashPay = false;
    emit(PerformSwitchMandoobSuccessCalculateState());
  }

  void payCashPay() {
    fawry = false;
    vodCash = false;
    visa = false;
    mandoob = false;
    cashPay = true;
    emit(PerformSwitchCashSuccessCalculateState());
  }
}
