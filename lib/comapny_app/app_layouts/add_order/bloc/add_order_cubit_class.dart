import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/add_order/bloc/states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';

class AddOrderCubitClass extends Cubit<AddOrderStates> {
  AddOrderCubitClass() : super(AddOrderInitialState());

  static AddOrderCubitClass get(context) => BlocProvider.of(context);

  // add order screen // pickUpScreen
  TextEditingController productNumber = TextEditingController();
  TextEditingController orderContain = TextEditingController();
  // add order screen // PugetScreen
  TextEditingController notes = TextEditingController();

  List<String> orderName = [
    "بيك أب",
    "حساب",
    "مرتجعات",
    "تعديل على الشحنة",
    "الخامات والاستوكات",
    "طلبات أخري",
  ];

  dynamic orderSelected;
  bool isKindSelected = false;

  void selectKind(choice) {
    orderSelected = choice;
    isKindSelected = !isKindSelected;
    emit(SelectChoiceSuccessState());
  }

  dynamic transportSelected;
  bool isTransportSelected = false;

  void selectTransport(choice) {
    transportSelected = choice;
    isTransportSelected = !isTransportSelected;
    getTransportId(choice);
    emit(SelectChoiceSuccessState());
  }

  List transportNames = [];
  List transportIds = [];
  int ? transportIdNow;
  void getTransportsData() async {
     transportNames = [];
     transportIds = [];
    emit(GetTransportsDataLoadingState());
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log(SaveValueInKey.accessToken.toString());
    try {
      Response response = await  DioHelper.getData(
        url: ALL_TRANSPORT,
        authorization: "Bearer ${SaveValueInKey.accessToken}",
      );
      for(int index =0; index < response.data["transport_type"].length ; index ++ ){
        transportNames.add(response.data["transport_type"][index]["type"]);
        transportIds.add(response.data["transport_type"][index]["id"]);
      }
      log(transportNames.toString());
      emit(GetTransportsDataSuccessState());
    } on DioError catch (error) {
      log(error.response.toString());
      emit(GetTransportsDataErrorState(error.toString()));
    }
  }
  void getTransportId(transportNameSelected){
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    for(int index =0; index < transportIds.length ; index ++){
      if(transportNames[index] == transportNameSelected.toString()){
        int tempIndex = transportNames.indexOf(transportNameSelected);
        transportIdNow = transportIds[tempIndex];
        log("transportIdNow = ${transportIdNow}");
        emit(GetTransportId());
      }
    }

    DioHelper.getData(
        url: ALL_TRANSPORT,
        authorization: SaveValueInKey.accessToken,
      ).then((value) {
        for(int index =0; index < value.data["transport_type"].length ; index ++ ){
          transportNames.add(value.data["transport_type"][index]["type"]);
          transportIds.add(value.data["transport_type"][index]["id"]);
        }
      });

  }

  void createPickUpOrder() {
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    emit(CreatePickUpOrderLoadingState());
    try {
      var response = DioHelper.postData(
        url: PICK_UP,
        token: "",
        accessToken: "",
        authorization: "Bearer ${SaveValueInKey.accessToken}",
        data: {
          "qty":productNumber.text,
          "transport_type_id":transportIdNow,
          "notes":orderContain.text,
        },
      );
      emit(CreatePickUpOrderSuccessState());
    } on DioError catch (error) {
      log(error.toString());
      emit(CreatePickUpOrderErrorState(error.toString()));
    }
  }
}
