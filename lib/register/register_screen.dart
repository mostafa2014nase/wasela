import 'package:easy_localization/easy_localization.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/register/bloc/cubit_class.dart';
import 'package:wasela/register/bloc/states.dart';
import 'package:wasela/register/ensure_sent_code.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import '../helper_methods/functions/functions_needed.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  var formValid = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubitClass, RegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubitClass.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Form(
                key: formValid,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 10.0, end: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.loginScreen0.tr(),
                            style:
                                TextStyle(color: textBlueColor, fontSize: 25),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: CustomDesignUnActive(
                                        width: 170,
                                        height: 200,
                                        borderWidth: 10,
                                        borderRadius: 10,
                                        borderColor: SaveValueInKey.userType == "company"
                                            ? purpleColor
                                            : yellowColor,
                                        text: SvgPicture.asset(
                                          'Assets/images/Client-2.svg',
                                          color: SaveValueInKey.userType == "company"
                                              ? purpleColor
                                              : yellowColor,
                                          width: 150.0,
                                          height: 150.0,
                                        ),
                                        containerColor: Colors.transparent,
                                      ),
                                    ),
                                    SaveValueInKey.userType == "client"
                                        ? CircleAvatar(
                                            backgroundColor: yellowColor,
                                            radius: 15,
                                            child: CircleAvatar(
                                              radius: 12,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.check_circle,
                                                color: yellowColor,
                                              ),
                                            ),
                                          )
                                        : Text(""),
                                  ],
                                ),
                                onTap: () {
                                  cubit.makeNotCompany();
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: CustomDesignUnActive(
                                        width: 170,
                                        height: 200,
                                        borderWidth: 10,
                                        borderRadius: 10,
                                        borderColor: SaveValueInKey.userType == "client"
                                            ? purpleColor
                                            : yellowColor,
                                        text: SvgPicture.asset(
                                          'Assets/images/company.svg',
                                          color: SaveValueInKey.userType == "client"
                                              ? purpleColor
                                              : yellowColor,
                                          width: 150.0,
                                          height: 150.0,
                                        ),
                                        containerColor: Colors.transparent,
                                      ),
                                    ),
                                    SaveValueInKey.userType == "company"
                                        ? CircleAvatar(
                                            backgroundColor: yellowColor,
                                            radius: 15,
                                            child: CircleAvatar(
                                              radius: 12,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.check_circle,
                                                color: yellowColor,
                                              ),
                                            ),
                                          )
                                        : Text(""),
                                  ],
                                ),
                                onTap: () {
                                  cubit.makeCompany();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SaveValueInKey.userType == "company"
                                  ? ColumnForCompany()
                                  : ColumnForUser(),
                              const SizedBox(
                                height: 20,
                              ),
                              // Container(
                              //   decoration: const BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.horizontal(
                              //       right: Radius.circular(10.0),
                              //       left: Radius.circular(10.0),
                              //     ),
                              //   ),
                              //   child: TextFormField(
                              //     controller: phoneController,
                              //     keyboardType: TextInputType.text,
                              //     decoration: InputDecoration(
                              //       fillColor: Colors.white,
                              //       hintText: LocaleKeys.loginScreenHint1.tr(),
                              //       enabledBorder: OutlineInputBorder(
                              //           borderRadius: const BorderRadius.horizontal(
                              //             right: Radius.circular(10.0),
                              //             left: Radius.circular(10.0),
                              //           ),
                              //           borderSide: BorderSide(
                              //               color: yellowColor, width: 1.2)),
                              //       hintStyle: TextStyle(color: textGreyTwoColor),
                              //       border: const OutlineInputBorder(),
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 15,
                              // ),
                              // Container(
                              //   decoration: const BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.horizontal(
                              //       right: Radius.circular(10.0),
                              //       left: Radius.circular(10.0),
                              //     ),
                              //   ),
                              //   child: TextFormField(
                              //     controller: passwordController,
                              //     keyboardType: TextInputType.text,
                              //     decoration: InputDecoration(
                              //       fillColor: Colors.white,
                              //       hintText: LocaleKeys.loginScreenHint2.tr(),
                              //       enabledBorder: OutlineInputBorder(
                              //           borderRadius: const BorderRadius.horizontal(
                              //             right: Radius.circular(10.0),
                              //             left: Radius.circular(10.0),
                              //           ),
                              //           borderSide: BorderSide(
                              //               color: yellowColor, width: 1.2)),
                              //       hintStyle: TextStyle(color: textGreyTwoColor),
                              //       border: const OutlineInputBorder(),
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 15,
                              // ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       LocaleKeys.remember.tr(),
                              //       style: TextStyle(
                              //           fontSize: 17,
                              //           color: textGreyTwoColor,
                              //           fontWeight: FontWeight.bold),
                              //     ),
                              //     cubit.remember == false
                              //         ? IconButton(
                              //         onPressed: () {
                              //           cubit.makeRemember();
                              //         },
                              //         icon: Icon(
                              //             Icons.check_box_outline_blank_rounded,
                              //             color: yellowColor))
                              //         : IconButton(
                              //       onPressed: () {
                              //         cubit.makeNotRemember();
                              //       },
                              //       icon: Icon(Icons.check_box),
                              //       color: yellowColor,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            LocaleKeys.loginScreenMobile.tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              height: 1,
                            ),
                          ),
                        ),
                        CustomLocalTextFormField(
                          controller: phoneController,
                          preWidget: Row(
                            children: [
                              Text(
                                CountryFlagGeneration.generateCountryFlag(),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '  20' + ' ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: ButtonCustomDesign(
                        text: Text(
                          LocaleKeys.startScreenRegister.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        inkwellFunc: () {
                          if (formValid.currentState!.validate()) {
                            navigateAndBack(context,
                                layout: EnsureSentCode(
                                  phoneController: phoneController,
                                ));
                          }
                          //navigateAndBack(context, layout: MainNavScreen());
                        },
                        containerColor: purpleColor,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 50,
                      child: Text(
                        LocaleKeys.loginScreen1.tr(),
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child:
                              put_line(line_height: 1.0, color: Colors.grey),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            LocaleKeys.loginScreenEnter.tr(),
                            style: TextStyle(
                              fontSize: 20,
                              color: textGreyTwoColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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

class CustomLocalTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Widget preWidget;
  final TextInputType keyboardType;

  const CustomLocalTextFormField({
    required this.controller,
    required this.preWidget,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "phone number must be not empty";
            }
            if (value.length != 11 || value.startsWith("01") == false) {
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
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black,
          ),
          cursorHeight: 30.0,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: preWidget,
            prefixIconConstraints: BoxConstraints(
              maxWidth: 60,
            ),
          ),
          keyboardType: keyboardType,
        ));
  }
}

class ColumnForCompany extends StatelessWidget {
  const ColumnForCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.loginScreenCompany1.tr(),
          style: TextStyle(color: textBlueColor, fontSize: 25),
        ),
        Text(
          LocaleKeys.loginScreenCompany2.tr(),
          style: TextStyle(color: textBlueColor, fontSize: 15),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}

class ColumnForUser extends StatelessWidget {
  const ColumnForUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.loginScreenUser1.tr(),
          style: TextStyle(color: textBlueColor, fontSize: 25),
        ),
        Text(
          LocaleKeys.loginScreenCompany2.tr(),
          style: TextStyle(color: textBlueColor, fontSize: 15),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
