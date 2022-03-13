import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:wasela/translations/localeKeys.g.dart';

import 'change_password.dart';

class ReturnPassword extends StatelessWidget {
  var instance = FacebookAuth.getInstance();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Column(
            children: [
              Image.asset('Assets/images/08.png',width: 300,height: 300,),
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
                      LocaleKeys.loginScreenTextButton1.tr(),
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
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
                        controller: phoneController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: LocaleKeys.loginScreenHint1.tr(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: purpleColor, width: 1.2)),
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: ButtonCustomDesign(
                  text: Text(
                    LocaleKeys.loginScreenTextButton2.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  inkwellFunc: () {
                    myShowDialogForMarketing(
                        context: context,
                        barrierColor: purpleColor.withOpacity(0.8),
                        alertDialog: CustomAlertDialogForMarketing(
                          containerPadding: 40.0,
                          topPadding: 200,
                          backGroundImageColor: purpleColor,
                          mainWidgetText: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                LocaleKeys.returnPasswordMsg1.tr(),
                                style: lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                LocaleKeys.returnPasswordMsg2.tr(),
                                style: lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 20,
                                    color: purpleColor,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          topImage: SvgPicture.asset(
                            "Assets/images/calculator.svg",
                            width: 40,
                            height: 40,
                            color: purpleColor,
                          ),
                          bottomPicPadding: 550,
                          underWidget: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Material(
                                  child: InkWell(
                                    onTap: () {
                                      navigateAndBack(context,
                                          layout: ChangePassword());
                                    },
                                    child: CustomDesignUnActive(
                                      text: Text(
                                        LocaleKeys.returnPasswordMsg3.tr(),
                                        style: lightTheme.textTheme.bodyText1
                                            ?.copyWith(
                                          fontSize: 20,
                                          color: purpleColor,
                                        ),
                                      ),
                                      containerColor: Colors.white,
                                      borderColor: Colors.white,
                                      height: 50,
                                      borderRadius: 15,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    40.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                  containerColor: purpleColor,
                ),
              ),
              // Container(
              //   height: 50,
              //   child: Text(
              //     LocaleKeys.loginScreen1.tr(),
              //     style: TextStyle(fontSize: 17),
              //   ),
              // ),
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

