import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/states.dart';
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/modules/user_client_model.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class AppCubitClass extends Cubit<AppStates> {
  AppCubitClass() : super(InitialAppState());

  static AppCubitClass get(context) => BlocProvider.of(context);

  TextEditingController updatePhoneController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateCityController = TextEditingController();
  TextEditingController updateAddressController = TextEditingController();

  void resetControllers() {
    updatePhoneController = TextEditingController();
    updateEmailController = TextEditingController();
    updateNameController = TextEditingController();
    updateCityController = TextEditingController();
    updateAddressController = TextEditingController();
    emit(ResetAllControllers());
  }

  bool enableUpdateNameCompany = false;

  void enableUpdateNameCompanyFun() {
    enableUpdateNameCompany = true;
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdateEmailCompany = false;

  void enableUpdateEmailCompanyFunc() {
    enableUpdateEmailCompany = true;
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdatePhoneCompany = false;

  void enableUpdatePhoneCompanyFunc() {
    enableUpdatePhoneCompany = true;
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdateCityCompany = false;

  void enableUpdateCityCompanyFunc() {
    enableUpdateCityCompany = true;
    emit(EnableUpdateSuccessState());
  }

  bool enableUpdateAddressCompany = false;

  void enableUpdateAddressCompanyFunc() {
    enableUpdateAddressCompany = true;
    emit(EnableUpdateSuccessState());
  }

  void resetFalse() {
    enableUpdateNameCompany = false;
    enableUpdateEmailCompany = false;
    enableUpdatePhoneCompany = false;
    enableUpdateCityCompany = false;
    enableUpdateAddressCompany = false;
    emit(ResetFalseSuccessState());
  }
  bool checkIfOneTrue() {
    if (enableUpdateNameCompany == true ||
        enableUpdatePhoneCompany == true ||
        enableUpdateCityCompany == true ||
        enableUpdateAddressCompany == true ||
        enableUpdateEmailCompany == true) {
      return true;
    } else {
      return false;
    }
  }


  CompanyModel? companyModel;

  void getCompanyProfileData() {
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log("user type ${SaveValueInKey.userType}");
    emit(GetProfileCompanyLoadingState());
    DioHelper.getData(
      url: PROFILE,
      authorization: "Bearer ${SaveValueInKey.accessToken}",
    ).then((value) {
      log("Succeeeeeeeeeeeeeeeeeeeeeeeeees");
      companyModel = CompanyModel.fromJson(value.data);
      log("${companyModel!.name}");
      log("${companyModel!.id}");
      updatePhoneController.text = companyModel!.phoneNumber!;
      updateNameController.text = companyModel!.name!;
      updateEmailController.text = companyModel!.email!;
      updateCityController.text = companyModel!.city!;
      updateAddressController.text = companyModel!.address!;
      //image = companyModel!.profileImage! ;
      //profileImage = clientModel!.profileImage!;
      SaveValueInKey.companyId = companyModel!.id!;
      SaveValueInKey.userId = companyModel!.userId!;
      emit(GetProfileCompanySuccessState(companyModel!));
    }).catchError((error) {
      log("erroooooooooooooooooooooooooooor");
      log(error.toString());
      emit(GetProfileCompanyErrorState(error));
    });
  }

  File ? image;
  String imageName  = "";

  getImageGallery() async {
    final imageFile = ( await ImagePicker().pickImage(source: ImageSource.gallery));
    if (imageFile != null) {
      image = File(imageFile.path);
      log(image.toString());
      // clientModel!.id = SaveValueInKey.companyId;
      // log("clientModel Id = ${clientModel!.id.toString()}");
      await selectImage();
      emit(GetImageSuccessState());
    } else {
      log('Error In Picking The Note Image');
    }
    //imageName = image != null ? basename(image!.path) : "";
  }

  getImageCamera() async {
    var imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    image = imageFile as File;
    imageName = image != null ? basename(image!.path) : "";
    log(image.toString());
    emit(GetImageSuccessState());
  }

  Future<void> selectImage() async{
    var stream = File(image!.path).readAsBytes().asStream();
    var length = await image!.length();
    String fileName = image!.path.split('/').last;
    log("clientModel Id = ${SaveValueInKey.companyId.toString()}");
    http.MultipartFile multipartFile = http.MultipartFile(
      "photo",
      stream,
      length,
      filename: fileName,
    );
    var uri = Uri.parse("https://wasela.innovations-eg.com/$UPDATE_PROFILE_CLIENT${SaveValueInKey.companyId}");
    var request = http.MultipartRequest("POST", uri);
    request.files.add(multipartFile);
    var response = await request.send();

    // listen for response
    response.stream.transform(utf8.decoder).listen((value){
      log("file name = ${fileName.toString()}");
      log(response.statusCode.toString());
      // final body = json.decode(value);
      if (response.statusCode == 200 ) {
        log("tmaaaaaaaaaam");
        log(value.toString());
      }
      // if (response.statusCode == 500 ) {
      //   log(value.toString());
      // }
    });
  }

  void updateCompanyProfileData() {
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log("${SaveValueInKey.accessToken}");
    log("$UPDATE_PROFILE_COMPANY${companyModel!.id.toString()}");
    log("Bearer ${SaveValueInKey.accessToken}");
    emit(UpdateProfileCompanyLoadingState());
    DioHelper.postData(
        accessToken: "",
        token: "",
        url: "$UPDATE_PROFILE_COMPANY${companyModel!.id.toString()}",
        authorization: "Bearer ${SaveValueInKey.accessToken}",
        data: {
          "name": updateNameController.text,
          "email": updateEmailController.text,
          "phone": updatePhoneController.text,
          "city": updateCityController.text,
          "address": updateAddressController.text,
          //"photo": image,
        }).then((value) {
      log("update Success");
      getCompanyProfileData();
      resetFalse();
      emit(UpdateProfileCompanySuccessState());
    }).catchError((error) {
      log("update erroooor");
      log(error.toString());
      emit(UpdateProfileCompanyErrorState(error));
    });
  }

  ClientModel? clientModel;

  void getClientProfileData() {
    //SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log("${SaveValueInKey.accessToken}");
    emit(GetProfileClientLoadingState());
    DioHelper.getData(
      url: PROFILE,
      authorization: "Bearer ${SaveValueInKey.accessToken}",
    ).then((value) {
      log("Succeeeeeeeeeeeeeeeeeeeeeeeeees cliiiiiiiiiiient");
      clientModel = ClientModel.fromJson(value.data);
      log("${clientModel!.name}");
      log("${clientModel!.id}");
      updatePhoneController.text = clientModel!.phoneNumber!;
      updateNameController.text = clientModel!.name!;
      updateEmailController.text = clientModel!.email!;
      updateCityController.text = clientModel!.city!;
      updateAddressController.text = clientModel!.address!;
      //profileImage = clientModel!.profileImage!;
      SaveValueInKey.userId = clientModel!.id!;
      emit(GetProfileClientSuccessState(clientModel!));
    }).catchError((error) {
      log("erroooooooooooooooooooooooooooor cliiiiiiiiiiient");
      log(error.toString());
      emit(GetProfileClientErrorState(error));
    });
  }

  void updateClientProfileData() {
    SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
    log("${SaveValueInKey.accessToken}");
    log("${UPDATE_PROFILE_CLIENT}${clientModel!.id.toString()}");
    log("Bearer ${SaveValueInKey.accessToken}");
    emit(UpdateProfileClientLoadingState());
    DioHelper.postData(
        accessToken: "",
        token: "",
        url: "$UPDATE_PROFILE_CLIENT${clientModel!.id.toString()}",
        authorization: "Bearer ${SaveValueInKey.accessToken}",
        data: {
          "name": updateNameController.text,
          "email": updateEmailController.text,
          "phone": updatePhoneController.text,
          "city": updateCityController.text,
          "address": updateAddressController.text,
          "photo": profileImage,
        }).then((value) {
      log("update Success");
      getClientProfileData();
      resetFalse();
      emit(UpdateProfileClientSuccessState());
    }).catchError((error) {
      log("update erroooor");
      log(error.toString());
      emit(UpdateProfileClientErrorState(error));
    });
  }

  File? profileImage;
  String fileName = "";

  Future selectFile() async {
    fileName = profileImage != null ? basename(profileImage!.path) : "";
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result == null) {
      return;
    } else {
      final path = result.files.single.path;
      profileImage = File(path!);
      log("$profileImage");
      log("$profileImage");
      emit(GetImageSuccessState());
    }
  }


}
