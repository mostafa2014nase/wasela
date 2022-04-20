import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/cities_and_their_areas.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:wasela/register/bloc/states.dart';
import '../../helper_methods/constants/end_points_urls_api.dart';

class RegisterCubitClass extends Cubit<RegisterStates> {
  RegisterCubitClass() : super(RegisterStatesInitState());

  static RegisterCubitClass get(context) => BlocProvider.of(context);

// phone for two modules
  TextEditingController phoneController = TextEditingController();

// client data
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

// company data
  TextEditingController nameCompanyController = TextEditingController();
  TextEditingController phoneForCompanyController = TextEditingController();
  TextEditingController optionalPhoneForCompanyController =
      TextEditingController();
  TextEditingController emailCompanyController = TextEditingController();
  TextEditingController passwordCompanyController = TextEditingController();
  TextEditingController rePasswordCompanyController = TextEditingController();

  void resetAll() {
    // client clear
    phoneController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    // company clear
    nameCompanyController = TextEditingController();
    phoneForCompanyController = TextEditingController();
    optionalPhoneForCompanyController = TextEditingController();
    emailCompanyController = TextEditingController();
    passwordCompanyController = TextEditingController();
    rePasswordCompanyController = TextEditingController();
    emit(ResetControllersSuccessState());
  }

  bool isPassword = true;

  void makeItReadAble() {
    isPassword = !isPassword;
    emit(SwapSeeAndNotSuccessState());
  }

  void makeCompany() {
    SaveValueInKey.userType = "company";
    SharedCashHelper.setValue(key: "company", value: 0).then((value) {
      emit(MakeItCompanySuccessState());
    });
  }

  void makeNotCompany() {
    SaveValueInKey.userType = "client";
    SharedCashHelper.setValue(key: "user_type", value: "client").then((value) {
      emit(MakeItNotCompanySuccessState());
    });
  }

  String errorCompanyMessage = "";

  void registerCompany() async {
    emit(RegisterCompanyLoadingState());
    try {
      var response = await DioHelper.postData(
        authorization: "",
        accessToken: '',
        token: '',
        url: REGISTER_COMPANY,
        data: {
          "name": nameCompanyController.text,
          "phone_number": phoneForCompanyController.text,
          "password": passwordCompanyController.text,
          "password_confirmation": rePasswordCompanyController.text,
          "email": emailCompanyController.text,
          "area_id": areaIdNow,
        },
      );
      SaveValueInKey.companyAreaId = areaIdNow;
      SaveValueInKey.accessToken = response.data["access_token"];
      SaveValueInKey.userType = response.data["user"]["user_type"];
      log("user_type = ${response.data["user"]["user_type"]}");
      SharedCashHelper.setValue(
              key: "accessToken", value: SaveValueInKey.accessToken)
          .then((value) {
        SharedCashHelper.setValue(
                key: "user_type", value: SaveValueInKey.userType)
            .then((value) {
          SharedCashHelper.setValue(
              key: "areaId", value: areaIdNow).then((value){
            log(SaveValueInKey.accessToken.toString());
            log(SaveValueInKey.userType.toString());
            emit(RegisterCompanySuccessState());
          });
        }).catchError((error) {
          log("error in caching user_type ${error.toString()}");
        });
      });
      log(response.data.toString());
    } on DioError catch (e) {
      if (e.response!.statusCode == 422) {
        //final res = jsonDecode(e.response!.data);
        log(e.response!.data['errors']['email'].toString());
        log(e.response!.data['errors']['phone_number'].toString());
        if (e.response!.data['errors']['email'].toString() ==
            "[The email has already been taken.]") {
          log("firsssssssssssst steeeeeeeeeeep");
          errorCompanyMessage = "الايميل مسجل بالفعل";
          emit(RegisterCompanyErrorState(e.toString()));
        } else if (e.response!.data['errors']['phone_number'].toString() ==
            "[The phone number has already been taken.]") {
          errorCompanyMessage = "رقم الموبايل مسجل بالفعل";
          emit(RegisterCompanyErrorState(e.toString()));
        } else if (e.response!.data['errors']['area_id'].toString() ==
            "[The area id field is required.]") {
          errorCompanyMessage =
              "خطأ .. برجاء اختيار المدينة والمنطقة التابع لها";
          emit(RegisterCompanyErrorState(e.toString()));
        }
      } else {
        log(e.response!.data.toString());
        emit(RegisterCompanyErrorState(e.toString()));
      }
    }
  }

  String errorClientMessage = "";

  void registerClient(String phone) async {
    emit(RegisterClientLoadingState());
    try {
      var response = await DioHelper.postData(
        authorization: "",
        accessToken: '',
        token: '',
        url: REGISTER,
        data: {
          "name": nameController.text,
          "phone_number": phone,
          "password": passwordController.text,
          "password_confirmation": rePasswordController.text,
          "email": emailController.text,
        },
      );
      SaveValueInKey.accessToken = response.data["access_token"];
      SaveValueInKey.companyId = response.data["access_token"];
      SaveValueInKey.userId = response.data["user"]["user_data"]["user_id"];
      SaveValueInKey.companyId = response.data["user"]["user_data"]["id"];
      log("user_type = ${response.data["user"]["user_type"]}");
      SharedCashHelper.setValue(
              key: "accessToken", value: SaveValueInKey.accessToken)
          .then((value) {
        SharedCashHelper.setValue(
                key: "companyId", value: SaveValueInKey.companyId)
            .then((value) {
          SharedCashHelper.setValue(key: "userId", value: SaveValueInKey.userId)
              .then((value) {
            print(SaveValueInKey.accessToken.toString());
            emit(RegisterClientSuccessState());
          });
        });
      });
    } on DioError catch (e) {
      if (e.response!.statusCode == 422) {
        //final res = jsonDecode(e.response!.data);
        log(e.response!.data['errors']['email'].toString());
        log(e.response!.data['errors']['phone_number'].toString());
        if (e.response!.data['errors']['email'].toString() ==
            "[The email has already been taken.]") {
          log("firsssssssssssst steeeeeeeeeeep");
          errorCompanyMessage = "الايميل مسجل بالفعل";
          emit(RegisterCompanyErrorState(e.toString()));
        } else if (e.response!.data['errors']['phone_number'].toString() ==
            "[The phone number has already been taken.]") {
          errorCompanyMessage = "رقم الموبايل مسجل بالفعل";
          emit(RegisterCompanyErrorState(e.toString()));
        }
      } else {
        log(e.response!.data.toString());
        emit(RegisterCompanyErrorState(e.toString()));
      }
    }
  }

  AllCities? allCities;
  CityModel? cityModel;
  AreaModel? areaModel;
  List areaIdList = [];
  List cityIdList = [];
  List<String> cityList = [];
  List<String> areaList = [""];

  void getAllCitiesForRegister() {
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    DioHelper.getData(
            url: GET_CITIES_DATA_OUT,
            authorization: "")
        .then((value) {
      allCities = AllCities.fromJson(value.data);
      log("area names List = ${allCities!.toMap().toString()}");
      for (int index = 0; index < value.data["province"].length; index++) {
        cityList.add(value.data["province"][index]["name"]);
        cityIdList.add(value.data["province"][index]["id"]);
        cityModel = CityModel(
            itsAreas: value.data["province"][index]["areas"],
            id: value.data["province"][index]["id"],
            name: value.data["province"][index]["name"],
            price: value.data["province"][index]["price"]);
        log(cityList.toString());
        log(value.data["province"][index]["areas"].length.toString());
      }
      log("area names List = ${areaIdList.toString()}");
      log("city Ids List = ${cityIdList.toString()}");
      log("city names List = ${cityList.toString()}");
      //log("${value.data["province"].length}");
      emit(GetCitiesDataSuccess());
    });
  }

  void getSpecificAreasForRegister(choice) {
    log("city names list = ${cityList.toString()}");
    log("city model list = ${allCities!.province.toString()}");
    for (int index = 0; index < cityList.length; index++) {
      for (int areaIndex = 0;
          areaIndex < allCities!.province![index]["areas"].length;
          areaIndex++) {
        log("areaIndex = ${areaIndex.toString()}");
        log("index of city list = ${cityList[index]}");
        log(" city list now is  = ${cityList[index]} and choice now is ${choice.toString()}");
        if (cityList[index] == choice.toString()) {
          areaList.add(allCities!.province![index]["areas"][areaIndex]["name"]);
          areaIdList.add(allCities!.province![index]["areas"][areaIndex]["id"]);
          log("areaaaaaaaaaaa naaames = ${areaList.toString()}");
          log("city name now = ${cityModel!.name.toString()}");
        }
      }
    }
    log("area list nooooooow = ${areaList.toString()}");
    log(areaIdList.toString());
    emit(GetCitiesDataSuccess());
  }

  dynamic selectedCity;
  bool isCitySelected = false;

  var selectedArea;
  bool isAreaSelected = false;
  int? areaIdNow;

  void selectFromCityChoices(choice) {
    selectedCity = choice;
    isCitySelected = !isCitySelected;
    areaList = [""];
    selectedArea = "";
    getSpecificAreasForRegister(choice);
    emit(SelectChoiceSuccessState());
  }

  void selectFromAreaChoices(choice) {
    selectedArea = choice;
    isAreaSelected = !isAreaSelected;
    int localIndex = areaList.indexOf(choice.toString()) - 1;
    areaIdNow = areaIdList[localIndex];
    log("area id name now = ${areaIdNow.toString()}");
    emit(SelectChoiceSuccessState());
  }
}
