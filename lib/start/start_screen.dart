import 'package:easy_localization/easy_localization.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/login/login_screen.dart';
import 'package:wasela/register/register_screen.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 70, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('Assets/images/04.png'),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  LocaleKeys.startScreen1.tr(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1,
                      fontSize: 40,
                      color: textBlueColor),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.startScreen2.tr(),
                      style: TextStyle(
                          fontSize: 20, color: textGreyColor, height: 2),
                    ),
                    Text(
                      LocaleKeys.startScreen3.tr(),
                      style: TextStyle(
                          fontSize: 20, color: textGreyColor, height: 1),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonCustomDesign(
                      text: Text(
                        LocaleKeys.loginScreenLogIn.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      inkwellFunc: () {
                        navigateAndBack(context, layout: LoginScreen());
                      },
                      containerColor: yellowColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonCustomDesign(
                      text: Text(
                        "${LocaleKeys.startScreenRegister.tr()} ( ${LocaleKeys.company.tr()} / ${LocaleKeys.client.tr()} )",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      inkwellFunc: () {
                        navigateAndBack(context, layout: RegisterScreen());
                      },
                      containerColor: purpleColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*style: TextStyle(
color: Colors.white
),*/
