import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/register/bloc/cubit_class.dart';
import 'package:wasela/register/bloc/states.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import '../mainscreen/main_nav_screen.dart';
import '../helper_methods/functions/functions_needed.dart';

class CompleteRegisterData extends StatelessWidget {
  final TextEditingController phoneController;

  CompleteRegisterData({Key? key, required this.phoneController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SaveValueInKey.userType == "client"
        ? CompleteRegisterDataForClient(
            phoneController: phoneController,
          )
        : CompleteRegisterDataForCompany(phoneController: phoneController);
  }
}

class CompleteRegisterDataForClient extends StatelessWidget {
  final TextEditingController phoneController;
  var formValidClient = GlobalKey<FormState>();

  CompleteRegisterDataForClient({Key? key, required this.phoneController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubitClass, RegisterStates>(
      listener: (context, state) {
        print(state.toString());
        if (state is RegisterClientSuccessState) {
          navigateAndFinish(context, layout: MainNavScreen());
        } else if (state is RegisterClientErrorState) {
          showToast(context, RegisterCubitClass.get(context).errorClientMessage,
              ToastStates.error);
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubitClass.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Form(
                key: formValidClient,
                child: Column(
                  children: [
                    Image.asset(
                      'Assets/images/07.png',
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.registerScreen1.tr(),
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "name must be not empty";
                                }
                                return null;
                              },
                              controller: cubit.nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint1.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "email address must be not empty";
                                }
                                if (value.contains("@") == false ||
                                    value.contains(".com") == false) {
                                  return "email address is not valid one";
                                }
                                return null;
                              },
                              controller: cubit.emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint2.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              obscureText: cubit.isPassword ? true : false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "password must be not empty";
                                }
                                if (value.length < 8) {
                                  return "password must be 8 at least characters";
                                }
                                return null;
                              },
                              controller: cubit.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  child: Icon(!cubit.isPassword
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye),
                                  onTap: () {
                                    cubit.makeItReadAble();
                                  },
                                ),
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint3.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              obscureText: cubit.isPassword ? true : false,
                              validator: (value) {
                                if (cubit.passwordController.text !=
                                    cubit.rePasswordController.text) {
                                  return "password must be the same";
                                }
                                return null;
                              },
                              controller: cubit.rePasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  child: Icon(!cubit.isPassword
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye),
                                  onTap: () {
                                    cubit.makeItReadAble();
                                  },
                                ),
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint4.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                      condition: state is! RegisterClientLoadingState,
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      builder: (context) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                        child: ButtonCustomDesign(
                          text: Text(
                            LocaleKeys.registerScreen1.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          inkwellFunc: () {
                            if (formValidClient.currentState!.validate()) {
                              cubit.registerClient(phoneController.text);
                            }
                          },
                          containerColor: purpleColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CompleteRegisterDataForCompany extends StatelessWidget {
  final TextEditingController phoneController;
  var formValidCompany = GlobalKey<FormState>();

  CompleteRegisterDataForCompany({Key? key, required this.phoneController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubitClass, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterCompanySuccessState) {
          navigateAndFinish(context, layout: MainNavScreen());
        } else if (state is RegisterCompanyErrorState) {
          showToast(
              context,
              RegisterCubitClass.get(context).errorCompanyMessage,
              ToastStates.error);
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubitClass.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Form(
                key: formValidCompany,
                child: Column(
                  children: [
                    Image.asset(
                      'Assets/images/07.png',
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.registerScreen1Company.tr(),
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "name must be not empty";
                                }
                                return null;
                              },
                              controller: cubit.nameCompanyController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: LocaleKeys
                                    .registerScreenNameHintCompany
                                    .tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "email address must be not empty";
                                }
                                if (value.contains("@") == false ||
                                    value.contains(".com") == false) {
                                  return "email address is not valid one";
                                }
                                return null;
                              },
                              controller: cubit.emailCompanyController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint2.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "phone must be not empty";
                                }
                                if (value.length != 11) {
                                  return "phone number is not correct";
                                }
                                if (value != phoneController.text) {
                                  return "phone number is not the same";
                                }
                                return null;
                              },
                              controller: cubit.phoneForCompanyController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: LocaleKeys.phoneHint1.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty == false) {
                                  if (value.length != 11) {
                                    return "phone number is not correct";
                                  }
                                  if (value == cubit.phoneController.text) {
                                    return "phone number must be different or leave it empty";
                                  }
                                }
                                return null;
                              },
                              controller:
                                  cubit.optionalPhoneForCompanyController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: LocaleKeys.phoneHint2.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              obscureText: cubit.isPassword ? true : false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "password must be not empty";
                                }
                                if (value.length < 8) {
                                  return "password must be 8 at least characters";
                                }
                                return null;
                              },
                              controller: cubit.passwordCompanyController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  child: Icon(!cubit.isPassword
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye),
                                  onTap: () {
                                    cubit.makeItReadAble();
                                  },
                                ),
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint3.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              obscureText: cubit.isPassword ? true : false,
                              validator: (value) {
                                if (cubit.rePasswordCompanyController.text !=
                                    cubit.passwordCompanyController.text) {
                                  return "password must be the same";
                                }
                                return null;
                              },
                              controller: cubit.rePasswordCompanyController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  child: Icon(!cubit.isPassword
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye),
                                  onTap: () {
                                    cubit.makeItReadAble();
                                  },
                                ),
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint4.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomDesignUnActive(
                              height: 50,
                              borderColor: purpleColor,
                              containerColor: Colors.transparent,
                              text: DropdownButton(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  underline: const SizedBox(),
                                  focusColor: Colors.black,
                                  dropdownColor: greyColortwoo,
                                  menuMaxHeight: 300.0,
                                  icon: CustomDesignUnActive(
                                    width: 40.0,
                                    borderRadius: 5.0,
                                    containerColor: purpleColor,
                                    borderColor: purpleColor,
                                    text: const Icon(Icons.arrow_drop_down,
                                        color: Colors.white, size: 30.0),
                                  ),
                                  isExpanded: true,
                                  hint: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10.0),
                                    child: Text("المدينة",
                                        style: TextStyle(color: purpleColor)),
                                  ),
                                  onTap: () {
                                    log("ana hnaaaaaaaaaa");
                                    log(cubit.cityList.toString());
                                  },
                                  value: cubit.selectedCity,
                                  onChanged: (newVal) {
                                    log("ana hnaaaaaaaaaakkk");
                                    cubit.selectFromCityChoices(newVal);
                                  },
                                  items: cubit.cityList.map((val) {
                                    return DropdownMenuItem(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      value: val,
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 10.0),
                                        child: Text(
                                          val,
                                          style: TextStyle(
                                              color: purpleColor , fontWeight: FontWeight.bold,fontSize: 18.0),
                                          //textAlign: TextAlign.right,
                                        ),
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: CustomDesignUnActive(
                              height: 50,
                              borderColor: purpleColor,
                              containerColor: Colors.transparent,
                              text: DropdownButton(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  underline: const SizedBox(),
                                  focusColor: Colors.black,
                                  dropdownColor: greyColortwoo,
                                  icon: CustomDesignUnActive(
                                    width: 40.0,
                                    borderRadius: 5.0,
                                    containerColor: purpleColor,
                                    borderColor: purpleColor,
                                    text: const Icon(Icons.arrow_drop_down,
                                        color: Colors.white, size: 30.0),
                                  ),
                                  isExpanded: true,
                                  menuMaxHeight: 250.0,
                                  hint: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10.0),
                                    child: Text("المنطقة",
                                        style: TextStyle(color: purpleColor)),
                                  ),
                                  onTap: () {},
                                  value: cubit.selectedArea,
                                  onChanged: (newVal) {
                                    cubit.selectFromAreaChoices(newVal);
                                  },
                                  items: cubit.areaList.map((val) {
                                    return DropdownMenuItem(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      value: val,
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 10.0),
                                        child: Text(
                                          val,
                                          style: TextStyle(
                                              color: purpleColor , fontWeight: FontWeight.bold,fontSize: 18.0),
                                          //textAlign: TextAlign.right,
                                        ),
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                      condition: SaveValueInKey.userType == "client"
                          ? state is! RegisterClientLoadingState
                          : state is! RegisterCompanyLoadingState,
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      builder: (context) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                        child: ButtonCustomDesign(
                          text: Text(
                            LocaleKeys.registerScreen2Company.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          inkwellFunc: () {
                            if (formValidCompany.currentState!.validate()) {
                              if (SaveValueInKey.userType == "client") {
                                cubit.registerClient(phoneController.text);
                              } else {
                                cubit.registerCompany();
                              }
                            }
                            // if (formValid.currentState!.validate()) {
                            //   myShowDialogForMarketing(
                            //       context: context,
                            //       alertDialog: CustomAlertDialogForMarketing(
                            //         backGroundImageColor: purpleColor,
                            //         mainWidgetText: Column(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.center,
                            //           children: [
                            //             Text(
                            //               LocaleKeys.companyRegisterMsg1.tr(),
                            //               style: lightTheme.textTheme.bodyText1
                            //                   ?.copyWith(
                            //                       fontSize: 20,
                            //                       color: Colors.green,
                            //                       fontWeight:
                            //                           FontWeight.normal),
                            //             ),
                            //             Text(
                            //               LocaleKeys.companyRegisterMsg2.tr(),
                            //               style: lightTheme.textTheme.bodyText1
                            //                   ?.copyWith(
                            //                       fontSize: 20,
                            //                       color: purpleColor),
                            //             ),
                            //             Text(
                            //               LocaleKeys.companyRegisterMsg3.tr(),
                            //               style: lightTheme.textTheme.bodyText1
                            //                   ?.copyWith(
                            //                       fontSize: 20,
                            //                       color: purpleColor),
                            //             ),
                            //             SizedBox(
                            //               height: 20,
                            //             ),
                            //           ],
                            //         ),
                            //         topImage: Image.asset(
                            //           'Assets/images/07.png',
                            //           width: 80,
                            //           height: 80,
                            //         ),
                            //         underWidget: Padding(
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 40.0),
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.center,
                            //             children: [
                            //               SizedBox(
                            //                 height: 20,
                            //               ),
                            //               Material(
                            //                 child: InkWell(
                            //                   onTap: () {
                            //                     // sent data to api
                            //                     navigateAndFinish(context,
                            //                         layout: StartScreen());
                            //                   },
                            //                   child: CustomDesignUnActive(
                            //                     text: Text(
                            //                       LocaleKeys.continueButton
                            //                           .tr(),
                            //                       style: lightTheme
                            //                           .textTheme.bodyText1
                            //                           ?.copyWith(
                            //                         fontSize: 25,
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                     containerColor: purpleColor,
                            //                     borderColor: Colors.white,
                            //                     height: 60,
                            //                     borderRadius: 40,
                            //                   ),
                            //                 ),
                            //                 borderRadius: BorderRadius.circular(
                            //                   40.0,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ));
                            // }
                          },
                          containerColor: purpleColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
