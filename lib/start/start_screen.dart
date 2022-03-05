import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/login/login_screen.dart';
import 'package:wasela/register/register_screen.dart';
import 'package:wasela/translations/localeKeys.g.dart';

import '../helper_methods/constants/endpoints.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('Assets/images/3 back.jpg'),
            SizedBox(
              height: 30,
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
                      LocaleKeys.startScreenLogIn.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    inkwellFunc: () {
                      navigateAndBack(context, layout:LoginScreen());
                    },
                    containerColor: yellowColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonCustomDesign(
                    text: Text(
                      LocaleKeys.startScreenRegister.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    inkwellFunc: () {
                      navigateAndBack(context, layout:LoginScreen());
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
    );
  }
}

/*style: TextStyle(
color: Colors.white
),*/
