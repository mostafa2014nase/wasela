import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:wasela/app_layouts/main_layouts/mainscreen/main_nav_screen.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/login/reback_password/return_password.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;

class ChangePassword extends StatelessWidget {
  var instance = FacebookAuth.getInstance();
  TextEditingController resentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

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
                      LocaleKeys.returnPasswordMsg3.tr(),
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
                        controller: resentPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: LocaleKeys.changePasswordHint1.tr(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                              borderSide:
                              BorderSide(color: purpleColor, width: 1.2)),
                          hintStyle: TextStyle(color: purpleColor),
                          border: OutlineInputBorder(),),
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
                        controller: newPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: LocaleKeys.changePasswordHint2.tr(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                              borderSide:
                              BorderSide(color: purpleColor, width: 1.2)),
                          hintStyle: TextStyle(color: purpleColor),
                          border: OutlineInputBorder(),),
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
                  horizontal: 40.0,vertical: 20.0,
                ),
                child: ButtonCustomDesign(
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
                    navigateAndFinish(context, layout: MainNavScreen());
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

