import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wasela/app_layouts/main_layouts/mainscreen/main_nav_screen.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import '../helper_methods/constants/endpoints.dart';
import '../helper_methods/functions/functions_needed.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnsureSentCode extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset('Assets/images/3 back.jpg'),
                    height: 350,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.ensureScreenCode.tr(),
                          style:
                              TextStyle(fontSize: 17, color: textGreyTwoColor),
                        ),
                        PinCodeTextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          appContext: context,
                          length: 4,
                          onChanged: (value) {},
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            borderWidth: 3,
                            fieldWidth: 80,
                            inactiveColor: Colors.yellow[600],
                            errorBorderColor: Colors.red,
                            selectedColor: Colors.yellow[600],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonCustomDesign(
                          text: Text(
                            LocaleKeys.ensureScreenGo.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          inkwellFunc: () {
                            navigateAndBack(context, layout:ManNavScreen());
                          },
                          containerColor: purpleColor,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    LocaleKeys.ensureScreen1.tr(),
                    style: TextStyle(fontSize: 17, color: textGreyTwoColor),
                    textAlign: TextAlign.center,
                  ),   Text(
                    LocaleKeys.ensureScreen2.tr(),
                    style: TextStyle(fontSize: 17, color: textGreyTwoColor),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.ensureScreen3.tr(),
                      style: TextStyle(fontSize: 15, height: 0),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 30.0,
                        ),
                        child: put_line(line_height: 1.0, color: Colors.grey),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          LocaleKeys.loginScreenEnter.tr(),
                          style: TextStyle(
                            fontSize: 18,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 8.0),
                    child: Row(
                      children: [
                        MakeImage.performThisImage(
                          text: "Facebook",
                          icon: Icon(Icons.facebook),
                          width: 130.0,
                          height: 50.0,
                          backgroundColor: Colors.white,
                          onPress: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
