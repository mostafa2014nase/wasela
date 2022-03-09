import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/home/home_screen.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import '../helper_methods/constants/endpoints.dart';
import 'ensure_sent_code.dart';
import '../helper_methods/functions/functions_needed.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;

class LoginScreen extends StatelessWidget {
  var instance = FacebookAuth.getInstance();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Column(
            children: [
              Image.asset('Assets/images/3 back.jpg'),
              const SizedBox(
                height: 15,
              ),
              CustomLocalTextFormField(
                controller: phoneController,
                preWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.loginScreenMobile.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          CountryFlagGeneration.generateCountryFlag(),
                        ),
                        Text(
                          '  20' + ' ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                keyboardType: TextInputType.number,
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
                    LocaleKeys.loginScreenLogIn.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  inkwellFunc: () {
                    navigateAndBack(context, layout: EnsureSentCode());
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
                    child: put_line(line_height: 1.0, color: Colors.grey),
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60.0, vertical: 8.0),
                child: Row(
                  children: [
                    MakeImage.performThisImage(
                      text: "Facebook",
                      icon: Icon(Icons.facebook),
                      width: 130.0,
                      height: 50.0,
                      backgroundColor: Colors.white,
                      onPress: () async{
                        // initialize the facebook javascript SDK
                        // FacebookAuth.instance.webInitialize(
                        //   appId: "155551551165454",
                        //   cookie: true,
                        //   xfbml: true,
                        //   version: '1.6.10',
                        // );
                        await FacebookAuth.instance.login().then((value) {
                          navigateAndBack(context, layout: const HomeScreen());
                        }).catchError((onError){
                          if (kDebugMode) {
                            print(onError.toString());
                          }
                        });
                      },
                    ),
                    Spacer(),
                    MakeImage.performThisImage(
                      text: "Google",
                      icon: Icon(Icons.mail),
                      width: 130.0,
                      height: 50.0,
                      backgroundColor: Colors.white,
                      onPress: () {},
                    ),
                  ],
                ),
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
