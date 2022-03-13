import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wasela/app_layouts/main_layouts/mainscreen/main_nav_screen.dart';
import 'package:wasela/login/reback_password/return_password.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import '../helper_methods/constants/endpoints.dart';
import '../helper_methods/functions/functions_needed.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Column(
            children: [
              Image.asset('Assets/images/09.png',width: 300,height: 300,),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.loginScreen2.tr(),
                      style:const TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(10.0),
                          left: Radius.circular(10.0),
                        ),
                      ),
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: LocaleKeys.loginScreenHint1.tr(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                              borderSide:
                              BorderSide(color: purpleColor, width: 1.2)),
                          hintStyle: TextStyle(color: purpleColor),
                          border: const OutlineInputBorder(),),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(10.0),
                          left: Radius.circular(10.0),
                        ),
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: LocaleKeys.loginScreenHint2.tr(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:const BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                              borderSide:
                              BorderSide(color: purpleColor, width: 1.2)),
                          hintStyle: TextStyle(color: purpleColor),
                          border:const OutlineInputBorder(),),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        navigateAndBack(context, layout: ReturnPassword());
                      },
                      child: Text(
                        LocaleKeys.loginScreenTextButton.tr(),
                        style: TextStyle(
                            color: purpleColor,
                            decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ButtonCustomDesign(
                      text: Text(
                        LocaleKeys.loginScreenLogIn.tr(),
                        textAlign: TextAlign.center,
                        style:const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      inkwellFunc: () {
                        navigateAndFinish(context, layout: MainNavScreen());
                      },
                      containerColor: purpleColor,
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 50,
              //   child: Text(
              //     LocaleKeys.loginScreen1.tr(),
              //     style: TextStyle(fontSize: 17),
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.top,
          showCursor: true,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black,
            height: 0.4,
          ),
          cursorColor: Colors.black,
          cursorHeight: 60.0,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: preWidget,
          ),
          keyboardType: keyboardType,
        ));
  }
}
