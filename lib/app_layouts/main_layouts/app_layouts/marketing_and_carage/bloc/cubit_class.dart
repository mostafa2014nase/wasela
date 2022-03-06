import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/states.dart';

import '../../../../../translations/localeKeys.g.dart';

class MarketingCubitClass extends Cubit<MarketingStates> {
  MarketingCubitClass() : super(InitialMarketingState());

  static MarketingCubitClass get(context) => BlocProvider.of(context);

  List gridIcons = [
    "Assets/images/Resturant.svg",
    "Assets/images/fashion.svg",
    "Assets/images/online-shopping.svg",
    "Assets/images/gift.svg",
  ];
  List gridTexts = [
    LocaleKeys.marketingCategories2.tr(),
    LocaleKeys.marketingCategories1.tr(),
    LocaleKeys.marketingCategories4.tr(),
    LocaleKeys.marketingCategories3.tr(),
  ];

  bool isClicked = false;
  void goToDetailedCategory (index){
  }


  int quantity = 1;
  void increasQuantity() {
    quantity++;
    emit(IncreaseQuantityState());
  }

  void decreaseQuantity() {
      quantity--;
      emit(DecreaseQuantityState());

  }
  int cardItems = 0;
  void increasCardItems() {
    cardItems++;
    emit(IncreaseCardItemsState());
  }

}
