import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/offers/bloc/states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/storage_model.dart';

class OfferCubitClass extends Cubit<OfferStates> {
  OfferCubitClass() : super(OfferInitState());

  static OfferCubitClass get(context) => BlocProvider.of(context);

  List offerNameList = [];
  List offerIdList = [];
  List offerList = [];
  List<bool> isChecked = [];
  OfferModel ? offerModel;

  void getAllOffers(){
    offerNameList = [];
    offerIdList = [];
    emit(GetOffersSystemsLoadingState());
    try{
      DioHelper.getData(url: OFFERS, authorization: "Bearer ${SaveValueInKey.accessToken}").then((value) {
        log(value.data.toString());
        for(int index = 0 ; index < value.data["offer"].length ;index ++){
          offerModel = OfferModel.fromJson(value.data["offer"][index]);
          offerNameList.add(offerModel!.title);
          offerIdList.add(offerModel!.id);
          isChecked.add(false);
        }
        log("length of list = ${offerNameList.length.toString()}");
        emit(GetOffersSystemsSuccessState());
      });
    }
    on DioError catch(error){
      log(error.toString());
      emit(GetOffersSystemsErrorState(error.toString()));
    }
  }

  OfferModel ? offerModelToSend;
  AllEnrollOffers ? allEnrollOffers;
  List enrollOffers = [];
  void enrollNow({required List offersId,required int index}){
    log(offersId[index].toString());
    offerModelToSend =OfferModel(id: offersId[index]);
    log("id of model = ${offerModelToSend!.id.toString()}");
    enrollOffers.add(offerModelToSend!.toMap());
    allEnrollOffers= AllEnrollOffers(offers: enrollOffers);
    log("AllEnrollOffers = ${allEnrollOffers!.offers.toString()}");
    emit(EnrollOfferLoadingState());
    try{
      DioHelper.postData(url: ENROLL_OFFERS,
        token: "",
        accessToken: "",
        authorization: "Bearer ${SaveValueInKey.accessToken}",
        data: allEnrollOffers!.toMap(),);
      log(allEnrollOffers!.toMap().toString());
      isChecked[index] = true;
      emit(EnrollOfferSuccessState());
    }
    on DioError catch(error){
      log(error.toString());
      emit(EnrollOfferErrorState(error.toString()));
    }

  }
}
