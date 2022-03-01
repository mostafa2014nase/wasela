import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/calculate_charge_screen.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/charge/charge_screen.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/my_account/user_account_screen.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/our_places/our_places_screen.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/wallet/wallet_screen.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';

import '../../app_layouts/home/home_screen.dart';
import 'main_nav_states.dart';

class MainNavCubitClass extends Cubit<MainNavStates> {
  MainNavCubitClass() : super(InitialMainNavState());

  static MainNavCubitClass get(context) => BlocProvider.of(context);

  List<Widget> Screens = [
    HomeScreen(),
    WalletScreen(),
    CalculateChargeScreen(),
    ChargeScreen(),
    PranchesMapAndMenue(),
    UserAccountScreen(),
  ];

  String svgGenerate( int index) {
    return "wallet";
  }

  String addressGenerate( int index) {
    return "محفظتى";
  }

  List<String> titles = [
    "الرئيسية",
    "ﻣﺤﻔﻈﺘﻲ",
    "ﺃﺣﺴﺐ ﺷﺤﻨﺘﻚ",
    "ﺷﺤﻨﺘﻚ",
    "ﻓﺮﻭﻋﻨﺎ",
    "ﺣﺴﺎﺑﻲ"
  ];

  List<IconData> iconsList = [
    Icons.home,
    Icons.wallet_giftcard,
    Icons.calculate,
    Icons.wallet_giftcard_sharp,
    Icons.hotel,
    Icons.person,
  ];
  List<PersistentBottomNavBarItem> navigationBarItems = [
    PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("الرئيسية"),
        activeColorPrimary: yellowColor,
        inactiveColorPrimary: textGreyTwoColor,
        inactiveColorSecondary: textGreyTwoColor),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.wallet_giftcard),
        title: ("ﻣﺤﻔﻈﺘﻲ"),
        activeColorPrimary: yellowColor,
        inactiveColorPrimary: textGreyTwoColor,
        inactiveColorSecondary: textGreyTwoColor),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.calculate),
        title: ("ﺃﺣﺴﺐ ﺷﺤﻨﺘﻚ"),
        activeColorPrimary: yellowColor,
        inactiveColorPrimary: textGreyTwoColor,
        inactiveColorSecondary: textGreyTwoColor),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.wallet_giftcard_sharp),
        title: ("ﺷﺤﻨﺘﻚ"),
        activeColorPrimary: yellowColor,
        inactiveColorPrimary: textGreyTwoColor,
        inactiveColorSecondary: textGreyTwoColor),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.hotel),
        title: ("ﻓﺮﻭﻋﻨﺎ"),
        activeColorPrimary: yellowColor,
        inactiveColorPrimary: textGreyTwoColor,
        inactiveColorSecondary: textGreyTwoColor),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("ﺣﺴﺎﺑﻲ"),
        activeColorPrimary: yellowColor,
        inactiveColorPrimary: textGreyTwoColor,
        inactiveColorSecondary: textGreyTwoColor),
  ];
  PersistentTabController persistentTabController = PersistentTabController();

  int index = 0;

  changeBarItem(barIndex) {
    emit(NavBarLoadingState());
    index = barIndex;
    emit(NavBarSuccessState());
  }

  updateBarIndexNavigation(int changedIndex) {
    emit(NavBarIndexChangedLoadingState());
    persistentTabController.jumpToTab(changedIndex);
    emit(NavBarIndexChangedSuccessState());
  }

  List drawerSvgPics = [
    "wallet",
    "cash-back",
    "gift",
    "feedbackkk",
    "settings (3)",
  ];
  List drawerTexts = [
    "محفظتى",
    "كاش باك",
    "نقط وهدايا",
    "تقييمك",
    "الأعدادات",
  ];

//   UserModel? model;
//
//   void getUserData() {
//     emit(GetUserDataLoadingState());
//     FirebaseFirestore.instance.collection("users").doc(uId).get().then((value) {
//       model = UserModel.fromJson(value.data()!);
//       emit(GetUserDataSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(GetUserDataErrorState(error));
//     });
//   }
//
//   bool? modelIsEmpty;
//
//   void falseMethod() {
//     modelIsEmpty = false;
//     emit(MakeFalseState());
//   }
//
//   void trueMethod() {
//     modelIsEmpty = true;
//     emit(MakeTrueState());
//   }
}
