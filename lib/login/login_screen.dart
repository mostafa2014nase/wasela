import 'package:flutter/material.dart';

import '../helper_methods/constants/endpoints.dart';
import 'ensure_sent_code.dart';
import '../helper_methods/functions/functions_needed.dart';

class LoginScreen extends StatelessWidget {
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
              SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: phoneController,
                textDirection: TextDirection.ltr,
                preWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mobile",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      CountryFlagGeneration.generateCountryFlag() +
                          '  20' +
                          ' ',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
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
                    'تسجيل',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  inkwellFunc: () {
                    navigateAndBack(context,layout: EnsureSentCode());
                  },
                  containerColor: purpleColor,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                  height: 50,
                  child: Text("ﺳﻮﻑ ﻳﺘﻢ ﺃﺭﺳﺎﻝ ﺭﺳﺎﻟﺔ ﻧﺼﻴﺔ ﻟﺘﺄﻛﻴﺪ ﺭﻗﻢ ﺍﻟﻤﻮﺑﺎﻳﻞ ",style: TextStyle(fontSize: 17),),),
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
                      "الدخول",
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
        ),
      ),
    );
  }
}
