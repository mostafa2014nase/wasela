import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/states.dart';

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
    "أغذية",
    "ملابس ",
    "شنط",
    "هدايا",
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
