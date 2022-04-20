import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/trade_store/bloc/states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/storage_model.dart';

class TradeStoreSystemCubitClass extends Cubit<TradeStoreSystemStates> {
  TradeStoreSystemCubitClass() : super(TradeStoreSystemInitState());

  static TradeStoreSystemCubitClass get(context) => BlocProvider.of(context);

  List<bool> isChecked = [];
  List storeNameList = [];
  List storeIdList = [];
  List storeDescribeList = [];
  StorageModel? storageModel;

  void getAllStorageSystems() {
    storeNameList = [];
    storeIdList = [];
    emit(GetStorageSystemsLoadingState());
    try {
      DioHelper.getData(
              url: STORAGE_SYSTEMS,
              authorization: "Bearer ${SaveValueInKey.accessToken}")
          .then((value) {
        log(value.data.toString());
        for (int index = 0;
            index < value.data["storage_system"].length;
            index++) {
          storageModel =
              StorageModel.fromJson(value.data["storage_system"][index]);
          storeNameList.add(storageModel!.title);
          storeIdList.add(storageModel!.id);
          storeDescribeList.add(storageModel!.description);
          isChecked.add(false);
        }
        log(storeNameList.toString());
        emit(GetStorageSystemsSuccessState());
      });
    } on DioError catch (error) {
      log(error.toString());
      emit(GetStorageSystemsErrorState(error.toString()));
    }
  }

  StorageModel? storageModelToSend;
  AllEnrollOStorage? allEnrollOStorage;
  List enrollStorages = [];

  void enrollNow({required int index}) {
    log(storeIdList[index].toString());
    storageModelToSend = StorageModel(id: storeIdList[index]);
    log("id of model = ${storageModelToSend!.id.toString()}");
    enrollStorages.add(storageModelToSend!.toMap());
    allEnrollOStorage = AllEnrollOStorage(storages: enrollStorages);
    log("AllEnrollOStorage = ${allEnrollOStorage!.storages.toString()}");
    emit(EnrollStorageLoadingState());
    try {
      DioHelper.postData(
        url: ENROLL_STORAGE,
        token: "",
        accessToken: "",
        authorization: "Bearer ${SaveValueInKey.accessToken}",
        data: allEnrollOStorage!.toMap(),
      );
      log(allEnrollOStorage!.toMap().toString());
      isChecked[index] = true;
      emit(EnrollStorageSuccessState());
    } on DioError catch (error) {
      log(error.toString());
      emit(EnrollStorageErrorState(error.toString()));
    }
  }
}
