import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/calculate_charge/calculate_charge_screen.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/charge/charge_screen.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/home/home_screen.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/our_places/our_places_screen.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/add_new_ship_screen.dart';
import 'package:wasela/comapny_app/app_layouts/add_order/add_order_screen.dart';
import 'package:wasela/comapny_app/app_layouts/calculations/calculations_screen.dart';
import 'package:wasela/comapny_app/app_layouts/home/home_screen.dart';
import 'package:wasela/comapny_app/app_layouts/injunction/injunctions_screen.dart';
import 'package:wasela/comapny_app/app_layouts/ship/charge_screen.dart';
import 'package:wasela/comapny_app/app_layouts/trade_store/trade_store_screen.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/custome_icons.dart';
import 'package:wasela/profile/user_account_screen.dart';
import 'package:wasela/translations/localeKeys.g.dart';

import 'main_nav_states.dart';

class MainNavCubitClass extends Cubit<MainNavStates> {
  MainNavCubitClass() : super(InitialMainNavState());

  static MainNavCubitClass get(context) => BlocProvider.of(context);

  List<Widget> screensForClientApp = [
    const HomeScreen(),
    CalculateChargeScreen(),
    const ChargeScreen(),
    PranchesMapAndMenue(),
     UserAccountScreen(),
  ];

  String svgGenerate(int index) {
    return "wallet";
  }

  String addressGenerate(int index) {
    return "محفظتى";
  }

  List<String> titles = [
    LocaleKeys.bottomNavItemsName1.tr(),
    //LocaleKeys.bottomNavItemsName2.tr(),
    LocaleKeys.bottomNavItemsName3.tr(),
    LocaleKeys.bottomNavItemsName4.tr(),
    LocaleKeys.bottomNavItemsName5.tr(),
    LocaleKeys.bottomNavItemsName6.tr(),
  ];

  List<IconData> iconsList = [
    Icons.home,
    Icons.calculate,
    Icons.wallet_giftcard_sharp,
    Icons.hotel,
    Icons.person,
  ];
  List<PersistentBottomNavBarItem> navigationBarItems = [
    PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: (LocaleKeys.bottomNavItemsName1.tr()),
        activeColorPrimary: yellowColor,
        inactiveColorPrimary: textGreyTwoColor,
        inactiveColorSecondary: textGreyTwoColor),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.calculate),
        title: (LocaleKeys.bottomNavItemsName3.tr()),
        activeColorPrimary: yellowColor,
        inactiveColorPrimary: textGreyTwoColor,
        inactiveColorSecondary: textGreyTwoColor),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.wallet_giftcard_sharp),
        title: (LocaleKeys.bottomNavItemsName4.tr()),
        activeColorPrimary: yellowColor,
        inactiveColorPrimary: textGreyTwoColor,
        inactiveColorSecondary: textGreyTwoColor),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.hotel),
        title: (LocaleKeys.bottomNavItemsName5.tr()),
        activeColorPrimary: yellowColor,
        inactiveColorPrimary: textGreyTwoColor,
        inactiveColorSecondary: textGreyTwoColor),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: (LocaleKeys.bottomNavItemsName6.tr()),
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

  // for company app

  List<Widget> screensForCompanyApp = [
    const HomeScreenForCompanyApp(),
    ShipScreenForCompanyApp(),
    InjunctionsScreenForCompanyApp(),
    AddNewShipForCompanyApp(),
    AddOrder(),
    TradeStoreSystem(),
    CalculationsScreenForCompanyApp(),
  ];
  List titlesForCompanyApp = [
    LocaleKeys.bottomNavItemsName1.tr(),
  "شحناتي",
  "المرتجعات",
  "اضافة شحنة جديدة",
  "اضافة طلب",
  "نظام التخزين للتجار",
  "الحسابات",
  ];
  List svgForCompanyApp = [
  "home",
  "MyShipping",
  "noun-pick-up-4160044",
  "noun-shipping-3484992",
  "noun-customer-demand-3437164",
  "noun-inventory-3377901",
  "noun-offer-1055801",
  ];

  List<BottomNavigationBarItem> navigationBarItemsForCompanyApp = const [
    BottomNavigationBarItem(
        label: ("الرئيسية"),
      icon: Icon(CustomIcons.home,size: 27.0,),
        ),
    BottomNavigationBarItem(
        label: ("شحناتي"),
      icon: Icon(ShipIcon.myshipping,size: 32.0,),
        ),
    BottomNavigationBarItem(
      label: "المرتجعات",
      icon: Icon(CustomIcons.noun_pick_up_4160044,size: 32.0,),
    ),
     BottomNavigationBarItem(
      label: "اضافة شحنة جديدة",
      icon: Icon(CustomIcons.noun_shipping_3484992,size: 40.0,),
    ),
    BottomNavigationBarItem(
      label: "اضافة طلب",
      icon: Icon(CustomIcons.noun_customer_demand_3437164,size: 45.0,),
    ),
    BottomNavigationBarItem(
      label: "نظام التخزين للتجار",
      icon: Icon(CustomIcons.noun_inventory_3377901,size: 35.0,),
    ),
    BottomNavigationBarItem(
      label: "الحسابات",
      icon: Icon(CustomIcons.noun_accounting_4679331,size: 34.0,),
    ),
  ];

  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  int indexForCompanyApp = 0;

  changeBarItemForCompanyApp(barIndex) {
    emit(NavBarLoadingState());
    indexForCompanyApp = barIndex;
    emit(NavBarSuccessState());
  }

  updateBarIndexNavigation(int changedIndex) {
    emit(NavBarIndexChangedLoadingState());
    persistentTabController.jumpToTab(changedIndex);
    emit(NavBarIndexChangedSuccessState());
  }

  List drawerSvgPics = [
    "cash-back",
    "feedbackkk",
    "settings (3)",
  ];
  List drawerTexts = [
    LocaleKeys.promoCodeDrawer.tr(),
    LocaleKeys.evaluateDrawer.tr(),
    LocaleKeys.settingsDrawer.tr(),
  ];

  List drawerSvgPicsCompany = [
    "feedbackkk",
    "settings(3)",
    "Contact_US_2",
    "Offer",
  ];
  List drawerCompanyTexts = [
    LocaleKeys.evaluateDrawer.tr(),
    LocaleKeys.settingsDrawer.tr(),
    "تواصل معنا",
    "العروض",
    //"تعديل بياناتي",
  ];

  void getFirebaseToken() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      emit(GetTokenAppSuccessState());
    });
  }

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
