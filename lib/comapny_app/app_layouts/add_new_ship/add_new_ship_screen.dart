import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/add_ship_form_app.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/states.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/constants/themes.dart';

import 'bloc/cubit_class.dart';

class AddNewShipForCompanyApp extends StatelessWidget {
  const AddNewShipForCompanyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewShipCubitClass, AddNewShipStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AddNewShipCubitClass.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 140,
            backgroundColor: purpleColor,
            centerTitle: true,
            foregroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                backToPrevious(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications,
                      size: 35,
                    )),
              ),
            ],
            title: Column(
              children: [
                SvgPicture.asset(
                  "Assets/images/wallet.svg",
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
                Text(
                  "أضافة شحنة من على التطبيق",
                  style: TextStyle(fontSize: 22,),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Text(
                    "أختر طريقة أدخال الشحنة",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0,horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "Assets/images/noun-csv-file-305198.svg",
                                width: 100,
                                height: 100,
                                color: purpleColor,
                              ),
                              InkWell(
                                onTap: (){},
                                child: CustomDesignUnActive(
                                  containerColor: Colors.transparent,
                                  borderColor: purpleColor,
                                  borderWidth: 2,
                                  borderRadius: 5,
                                  text: Text(
                                    "تحميل نسخة الأكسيل الأفتراضية",
                                    style: TextStyle(
                                        color: purpleColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "Assets/images/noun-excel-2788108.svg",
                                width: 100,
                                height: 100,
                                color: purpleColor,
                              ),
                              InkWell(
                                onTap: (){},
                                child: CustomDesignUnActive(
                                  containerColor: Colors.transparent,
                                  borderColor: purpleColor,
                                  borderWidth: 2,
                                  borderRadius: 5,
                                  text: Text(
                                    "تحميل نسخة الأكسيل الأفتراضية",
                                    style: TextStyle(
                                        color: purpleColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Column(
                    children: [
                      SvgPicture.asset(
                        "Assets/images/noun-application-1603837.svg",
                        width: 100,
                        height: 100,
                        color: purpleColor,
                      ),
                      InkWell(
                        onTap: (){
                          navigateAndBack(context, layout: AddShipFromMobileApp());
                        },
                        child: CustomDesignUnActive(
                          width: 180,
                          containerColor: Colors.transparent,
                          borderColor: purpleColor,
                          borderWidth: 2,
                          borderRadius: 5,
                          text: Text(
                            "أضافة شحنة من على التطبيق",
                            style: TextStyle(
                                color: purpleColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
