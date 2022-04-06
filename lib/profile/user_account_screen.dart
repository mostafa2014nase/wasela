import 'dart:developer';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/notifications/notifications_screen.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/cubit.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/mainscreen/main_nav_screen.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class UserAccountScreen extends StatelessWidget {
  UserAccountScreen({Key? key}) : super(key: key);
  var formUpdateValid = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitClass, AppStates>(
      listener: (context, state) {
        if (state is UpdateProfileCompanySuccessState || state is UpdateProfileClientSuccessState) {
          showToast(context, "تم تعديل البينات بنجاح", ToastStates.success);
        }
      },
      builder: (context, state) {
        var cubit = AppCubitClass.get(context);
        return Scaffold(
          backgroundColor: greyColor,
          appBar: AppBar(
            toolbarHeight: 140,
            backgroundColor: purpleColor,
            centerTitle: true,
            foregroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  cubit.resetFalse();
                  if (SaveValueInKey.userType == "client") {
                    persistentTabController.jumpToTab(0);
                  } else {
                    backToPrevious(context);
                  }
                },
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 10.0),
                child: IconButton(
                    onPressed: () {
                      navigateAndBack(context,
                          layout: NotificationsForCompanyApp());
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      size: 40,
                    )),
              ),
            ],
            title: Column(
              children: [
                SvgPicture.asset(
                  "Assets/images/user Support.svg",
                  width: 50.0,
                  height: 50.0,
                  color: Colors.white,
                ),
                Text(
                  LocaleKeys.bottomNavItemsName6.tr(),
                  style: TextStyle(fontSize: 25, height: 1.0),
                ),
              ],
            ),
          ),
          body: Form(
            key: formUpdateValid,
            child: WillPopScope(
              onWillPop: () async {
                cubit.resetFalse();
                return true;
              },
              child: SaveValueInKey.userType == "client"
                  ? ConditionalBuilder(
                      condition: cubit.clientModel != null,
                      builder: (context) {
                        return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  SizedBox(
                                    height: 170,
                                    width: double.infinity,
                                    child: Image.network(
                                     // "https://png.pngtree.com/thumb_back/fh260/back_our/20190622/ourmid/pngtree-g20-summit-simple-business-background-image_232743.jpg",
                                      "https://ak.picdn.net/shutterstock/videos/1014534347/thumb/6.jpg?ip=x480",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: purpleColor,
                                        radius: 70,
                                        child: Image.network(
                                            "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: CircleAvatar(
                                          backgroundColor: yellowColor,
                                          radius: 20,
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 80.0,
                                              child: Text(
                                                "الأسم",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  155,
                                              height: 60,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: TextFormField(
                                                enabled: cubit.enableUpdateNameCompany,
                                                keyboardType: TextInputType.text,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Name must be not empty";
                                                  }
                                                  return null;
                                                },
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                                cursorHeight: 30.0,
                                                controller:
                                                    cubit.updateNameController,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              const BorderRadius.horizontal(
                                                            right: Radius.circular(
                                                                    10.0),
                                                            left: Radius.circular(
                                                                    10.0),
                                                          ),
                                                          borderSide: BorderSide(
                                                              color: cubit.enableUpdateEmailCompany ==
                                                                      false
                                                                  ? Colors.black
                                                                  : purpleColor,
                                                              width: 1.2)),
                                                  border: const OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit
                                                    .enableUpdateNameCompanyFun();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 30,
                                                height: 30,
                                                child:const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 80,
                                              child: Text(
                                                "رقم الموبايل",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  155,
                                              height: 60,
                                              decoration:const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: TextFormField(
                                                enabled: cubit
                                                    .enableUpdatePhoneCompany,
                                                keyboardType:
                                                    TextInputType.phone,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "phone number must be not empty";
                                                  }
                                                  if (value.length != 11 ||
                                                      value.startsWith("01") ==
                                                          false) {
                                                    return "wrong phone number";
                                                  }
                                                  if (value.contains(" ")) {
                                                    return "number must not has spaces";
                                                  }
                                                  if (value.contains(",")) {
                                                    return "number must not has any character";
                                                  }
                                                  return null;
                                                },
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                                cursorHeight: 30.0,
                                                controller:
                                                    cubit.updatePhoneController,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                          const BorderRadius
                                                                  .horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    10.0),
                                                            left:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          borderSide: BorderSide(
                                                              color: cubit.enableUpdateEmailCompany ==
                                                                      false
                                                                  ? Colors.black
                                                                  : purpleColor,
                                                              width: 1.2)),
                                                  border:const OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit
                                                    .enableUpdatePhoneCompanyFunc();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 30,
                                                height: 30,
                                                child:const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 80.0,
                                              child: Text(
                                                "الايميل",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  155,
                                              height: 60,
                                              decoration:const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: TextFormField(
                                                enabled: cubit
                                                    .enableUpdateEmailCompany,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "email address must be not empty";
                                                  }
                                                  if (value.contains("@") ==
                                                          false ||
                                                      value.contains(".com") ==
                                                          false) {
                                                    return "email address is not valid one";
                                                  }
                                                  return null;
                                                },
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                                cursorHeight: 30.0,
                                                controller:
                                                    cubit.updateEmailController,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                          const BorderRadius
                                                                  .horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    10.0),
                                                            left:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          borderSide: BorderSide(
                                                              color: cubit.enableUpdateEmailCompany ==
                                                                      false
                                                                  ? Colors.black
                                                                  : purpleColor,
                                                              width: 1.2)),
                                                  border:const OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit
                                                    .enableUpdateEmailCompanyFunc();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 30,
                                                height: 30,
                                                child:const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 80.0,
                                              child: Text(
                                                "المدينة",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                                  155,
                                              height: 60,
                                              decoration:const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: TextFormField(
                                                enabled: cubit
                                                    .enableUpdateCityCompany,
                                                keyboardType:
                                                TextInputType.text,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "this field must be not empty";
                                                  }
                                                  return null;
                                                },
                                                textAlignVertical:
                                                TextAlignVertical.center,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                                cursorHeight: 30.0,
                                                controller:
                                                cubit.updateCityController,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                      const BorderRadius
                                                          .horizontal(
                                                        right:
                                                        Radius.circular(
                                                            10.0),
                                                        left:
                                                        Radius.circular(
                                                            10.0),
                                                      ),
                                                      borderSide: BorderSide(
                                                          color: cubit.enableUpdateCityCompany ==
                                                              false
                                                              ? Colors.black
                                                              : purpleColor,
                                                          width: 1.2)),
                                                  border:const OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit
                                                    .enableUpdateCityCompanyFunc();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 30,
                                                height: 30,
                                                child:const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 80.0,
                                              child: Text(
                                                "العنوان",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                                  155,
                                              height: 60,
                                              decoration:const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: TextFormField(
                                                enabled: cubit
                                                    .enableUpdateAddressCompany,
                                                keyboardType:
                                                TextInputType.text,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "this field must be not empty";
                                                  }
                                                  return null;
                                                },
                                                textAlignVertical:
                                                TextAlignVertical.center,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                                cursorHeight: 30.0,
                                                controller: cubit
                                                    .updateAddressController,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                      const BorderRadius
                                                          .horizontal(
                                                        right:
                                                        Radius.circular(
                                                            10.0),
                                                        left:
                                                        Radius.circular(
                                                            10.0),
                                                      ),
                                                      borderSide: BorderSide(
                                                          color: cubit.enableUpdateAddressCompany ==
                                                              false
                                                              ? Colors.black
                                                              : purpleColor,
                                                          width: 1.2)),
                                                  border:const OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit
                                                    .enableUpdateAddressCompanyFunc();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 30,
                                                height: 30,
                                                child:const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      cubit.checkIfOneTrue()
                                          ? ConditionalBuilder(
                                          condition: state
                                          is! UpdateProfileClientLoadingState,
                                          builder: (context) {
                                            return ButtonCustomDesign(
                                                width: 200.0,
                                                text:const Text(
                                                  "تأكيد التعديل",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                inkwellFunc: () {
                                                  // post and get (update profile data)
                                                  if (formUpdateValid
                                                      .currentState!
                                                      .validate()) {
                                                    cubit
                                                        .updateClientProfileData();
                                                  }
                                                },
                                                containerColor:
                                                purpleColor);
                                          },
                                          fallback: (context) {
                                            return const Center(
                                              child:
                                              CircularProgressIndicator(),
                                            );
                                          })
                                          :const Text(""),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      fallback: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )
                  : ConditionalBuilder(
                      condition: cubit.companyModel != null,
                      builder: (context) {
                        return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 70.0),
                                    height: 170,
                                    width: double.infinity,
                                    child: Image.network(
                                      "https://png.pngtree.com/thumb_back/fh260/back_our/20190622/ourmid/pngtree-g20-summit-simple-business-background-image_232743.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                    // child: Image.asset(
                                    //     "Assets/images/backgroundImage.jbg",
                                    //     fit: BoxFit.cover,
                                    //   ),
                                  ),
                                  Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 70,
                                        child: Image.network(
                                          // state is UpdateProfileCompanySuccessState && cubit.image != null?
                                          // cubit.image!.path:
                                          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await cubit.getImageGallery();
                                          if(state is GetImageSuccessState){
                                            log("${cubit.image}");
                                          }

                                          // cubit.updateCompanyProfileData();
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: yellowColor,
                                          radius: 20,
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 80.0,
                                              child: Text(
                                                "أسم شركتك",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  155,
                                              height: 60,
                                              decoration:const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: TextFormField(
                                                enabled: cubit
                                                    .enableUpdateNameCompany,
                                                keyboardType:
                                                    TextInputType.text,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Name must be not empty";
                                                  }
                                                  return null;
                                                },
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                                cursorHeight: 30.0,
                                                controller:
                                                    cubit.updateNameController,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                          const BorderRadius
                                                                  .horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    10.0),
                                                            left:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          borderSide: BorderSide(
                                                              color: cubit.enableUpdateEmailCompany ==
                                                                      false
                                                                  ? Colors.black
                                                                  : purpleColor,
                                                              width: 1.2)),
                                                  border:const OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit
                                                    .enableUpdateNameCompanyFun();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 30,
                                                height: 30,
                                                child:const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 80,
                                              child: Text(
                                                "رقم الموبايل",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  155,
                                              height: 60,
                                              decoration:const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: TextFormField(
                                                enabled: cubit
                                                    .enableUpdatePhoneCompany,
                                                keyboardType:
                                                    TextInputType.phone,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "phone number must be not empty";
                                                  }
                                                  if (value.length != 11 ||
                                                      value.startsWith("01") ==
                                                          false) {
                                                    return "wrong phone number";
                                                  }
                                                  if (value.contains(" ")) {
                                                    return "number must not has spaces";
                                                  }
                                                  if (value.contains(",")) {
                                                    return "number must not has any character";
                                                  }
                                                  return null;
                                                },
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                                cursorHeight: 30.0,
                                                controller:
                                                    cubit.updatePhoneController,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                          const  BorderRadius
                                                                  .horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    10.0),
                                                            left:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          borderSide: BorderSide(
                                                              color: cubit.enableUpdateEmailCompany ==
                                                                      false
                                                                  ? Colors.black
                                                                  : purpleColor,
                                                              width: 1.2)),
                                                  border:const OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit
                                                    .enableUpdatePhoneCompanyFunc();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 30,
                                                height: 30,
                                                child:const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 80.0,
                                              child: Text(
                                                "الايميل",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  155,
                                              height: 60,
                                              decoration:const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: TextFormField(
                                                enabled: cubit
                                                    .enableUpdateEmailCompany,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "email address must be not empty";
                                                  }
                                                  if (value.contains("@") ==
                                                          false ||
                                                      value.contains(".com") ==
                                                          false) {
                                                    return "email address is not valid one";
                                                  }
                                                  return null;
                                                },
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                                cursorHeight: 30.0,
                                                controller:
                                                    cubit.updateEmailController,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                          const BorderRadius
                                                                  .horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    10.0),
                                                            left:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          borderSide: BorderSide(
                                                              color: cubit.enableUpdateEmailCompany ==
                                                                      false
                                                                  ? Colors.black
                                                                  : purpleColor,
                                                              width: 1.2)),
                                                  border:const OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit
                                                    .enableUpdateEmailCompanyFunc();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 30,
                                                height: 30,
                                                child:const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 80.0,
                                              child: Text(
                                                "المدينة",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  155,
                                              height: 60,
                                              decoration:const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: TextFormField(
                                                enabled: cubit
                                                    .enableUpdateCityCompany,
                                                keyboardType:
                                                    TextInputType.text,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "this field must be not empty";
                                                  }
                                                  return null;
                                                },
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                                cursorHeight: 30.0,
                                                controller:
                                                    cubit.updateCityController,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                          const BorderRadius
                                                                  .horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    10.0),
                                                            left:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          borderSide: BorderSide(
                                                              color: cubit.enableUpdateCityCompany ==
                                                                      false
                                                                  ? Colors.black
                                                                  : purpleColor,
                                                              width: 1.2)),
                                                  border:const OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit
                                                    .enableUpdateCityCompanyFunc();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 30,
                                                height: 30,
                                                child:const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 80.0,
                                              child: Text(
                                                "العنوان",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  155,
                                              height: 60,
                                              decoration:const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: TextFormField(
                                                enabled: cubit
                                                    .enableUpdateAddressCompany,
                                                keyboardType:
                                                    TextInputType.text,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "this field must be not empty";
                                                  }
                                                  return null;
                                                },
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                ),
                                                cursorHeight: 30.0,
                                                controller: cubit
                                                    .updateAddressController,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                          const BorderRadius
                                                                  .horizontal(
                                                            right:
                                                                Radius.circular(
                                                                    10.0),
                                                            left:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          borderSide: BorderSide(
                                                              color: cubit.enableUpdateAddressCompany ==
                                                                      false
                                                                  ? Colors.black
                                                                  : purpleColor,
                                                              width: 1.2)),
                                                  border:const OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit
                                                    .enableUpdateAddressCompanyFunc();
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                width: 30,
                                                height: 30,
                                                child:const Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      cubit.checkIfOneTrue()
                                          ? ConditionalBuilder(
                                              condition: state
                                                  is! UpdateProfileClientLoadingState,
                                              builder: (context) {
                                                return ButtonCustomDesign(
                                                    width: 200.0,
                                                    text:const Text(
                                                      "تأكيد التعديل",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    inkwellFunc: () {
                                                      // post and get (update profile data)
                                                      if (formUpdateValid
                                                          .currentState!
                                                          .validate()) {
                                                        cubit.updateCompanyProfileData();
                                                      }
                                                    },
                                                    containerColor:
                                                        purpleColor);
                                              },
                                              fallback: (context) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              })
                                          :const Text(""),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      fallback: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
