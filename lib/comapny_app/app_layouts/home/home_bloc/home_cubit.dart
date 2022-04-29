import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/home/home_bloc/home_states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';

class HomeCubitClassForCompany extends Cubit<HomeStatesForCompany> {
  HomeCubitClassForCompany() : super(HomeForCompanyInitialState());

  static HomeCubitClassForCompany get(context) => BlocProvider.of(context);

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
  
  num ? cod;
  num ? balance ;
  void getHomeData (){
    emit(GetCodAndBalanceLoadingState());
    try{
      DioHelper.getData(
          url: COD_AND_BALANCE,
          authorization: "Bearer ${SaveValueInKey.accessToken}").then((value) {
            log("hooooooooooooooome daaaaaaaaaaaataaaaaaaaaaaaaa ${value.data.toString()}");
            cod = value.data["company_account"]["cod"];
            balance = value.data["company_account"]["balance_due"];
            log("cod =  ${cod.toString()}");
            log("balance =  ${balance.toString()}");
            emit(GetCodAndBalanceSuccessState());
      });
    }
    on DioError catch (error){
      log(error.toString());
      emit(GetCodAndBalanceErrorState(error.toString()));
    }
  }

  double ? returns;
  double ? underCollection;
  double ? pickUpHasBeenReceived;
  double ? success;
  double ? failed;
  void getHomeChartData (){
    emit(GetChartDataLoadingState());
    try{
      DioHelper.getData(
          url: GET_CHART_DATA,
          authorization: "Bearer ${SaveValueInKey.accessToken}").then((value) {
            log("hooooooooooooooome daaaaaaaaaaaataaaaaaaaaaaaaa chaaaaaart ${value.data.toString()}");
            int returnsInt = value.data["data"]["return_shipment"];
            int underCollectionInt = value.data["data"]["under_collection"];
            int pickUpHasBeenReceivedInt = value.data["data"]["Pick_up_has_been_received"];
            int failedInt = value.data["data"]["Delivery_failed"];
            int successInt = value.data["data"]["successful_delivery"];
            returns = returnsInt*1.0;
            underCollection = underCollectionInt*1.0;
            pickUpHasBeenReceived = pickUpHasBeenReceivedInt*1.0;
            failed = failedInt*1.0;
            success = successInt*1.0;
            log("returns ${returns.toString()}");
            log("underCollection ${underCollection.toString()}");
            log("pickUpHasBeenReceived ${pickUpHasBeenReceived.toString()}");
            log("failed ${failed.toString()}");
            log("success ${success.toString()}");
            emit(GetChartDataSuccessState());
      });
    }
    on DioError catch (error){
      log(error.toString());
      emit(GetChartDataErrorState(error.toString()));
    }
  }
}
