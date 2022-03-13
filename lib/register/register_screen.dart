import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import '../helper_methods/constants/endpoints.dart';
import '../register/ensure_sent_code.dart';
import '../helper_methods/functions/functions_needed.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Column(
            children: [
              Image.asset(
                'Assets/images/05.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    keyboardType: TextInputType.number,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: TextFormField(
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
