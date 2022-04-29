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


  List offerEnrolledNameList = [];
  List offerEnrolledIdList = [];

  void getOffers() {
    offerNameList = [];
    offerIdList = [];
    offerEnrolledNameList = [];
    offerEnrolledIdList = [];
    emit(GetOffersSystemsLoadingState());
    try {
      DioHelper.getData(
          url: OFFERS,
          authorization: "Bearer ${SaveValueInKey.accessToken}")
          .then((value) {
        DioHelper.getData(
            url: OFFERS_ENROLLED,
            authorization: "Bearer ${SaveValueInKey.accessToken}").then((valueEnrolled) {
          if(valueEnrolled.data["offers"].length > 0){
            for(int index = 0 ; index < value.data["offer"].length ;index ++){
              offerModel = OfferModel.fromJson(value.data["offer"][index]);
              offerNameList.add(offerModel!.title);
              offerIdList.add(offerModel!.id);
              isChecked.add(false);
            }
            for (int enrolledIndex = 0;
            enrolledIndex < valueEnrolled.data["offers"].length;
            enrolledIndex++) {
              offerEnrolledNameList.add(valueEnrolled.data["offers"][enrolledIndex]["title"]);
              offerEnrolledIdList.add(valueEnrolled.data["offers"][enrolledIndex]["id"]);
              for(int index = 0 ; index < offerIdList.length;index++){
                log("list of storage system id looping = ${offerIdList.toString()}");
                if(offerIdList[index]==offerEnrolledIdList[enrolledIndex]){
                  log(" id of data now is ${valueEnrolled.data["offers"][enrolledIndex]["id"]}");
                  log("offers id value now is ${offerIdList[index]}");
                  offerIdList.removeAt(index);
                  offerNameList.removeAt(index);
                  isChecked[index] = true;
                  log("list of offers id in condition = ${offerIdList.toString()}");
                }
              }
            }
          }
          else{
            for(int index = 0 ; index < value.data["offer"].length ;index ++){
              offerModel = OfferModel.fromJson(value.data["offer"][index]);
              offerNameList.add(offerModel!.title);
              offerIdList.add(offerModel!.id);
              isChecked.add(false);
            }
          }
          log("list of offers system = ${offerNameList.toString()}");
          log("list of offers system ids last = ${offerIdList.toString()}");
          emit(GetOffersSystemsSuccessState());
        });
      });
    } on DioError catch (error) {
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
