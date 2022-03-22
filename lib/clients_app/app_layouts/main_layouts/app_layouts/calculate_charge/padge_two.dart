import 'package:easy_localization/easy_localization.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/cubit_class.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/states.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/calculate_charge/calculate_charge_screen.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/calculate_charge/to_who_details.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class CalculateChargeSecondScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  final String fromCity;
  final String toCity;

  CalculateChargeSecondScreen(
      {Key? key, required this.fromCity, required this.toCity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculateChargingCubitClass, CalculateChargingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CalculateChargingCubitClass.get(context);
        return Scaffold(
          appBar: generateAppBarForCompanyMainScreens(
            mainScreen: false,
            title: LocaleKeys.bottomNavItemsName3.tr(),
            svgPath: "wallet",
            context: context,
            textHeight: 2.0,
          ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 175,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: TransportCustomDesign(
                            onTap: () {
                              cubit.chooseRight();
                            },
                            icon: Icon(
                              Icons.car_repair,
                              color: purpleColor,
                              size: 120,
                            ),
                            containerColor: Colors.white,
                            paddingValue: 0,
                            borderRadius: 15,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(children: [
                                Text(
                                  LocaleKeys.calculateBetween.tr(),
                                  style: TextStyle(fontSize: 28),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Expanded(
                                  child: YellowCustomDesign(
                                    height: 50,
                                    text: "4 ${LocaleKeys.days.tr()}",
                                  ),
                                ),
                              ]),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Text(
                                      LocaleKeys.cost.tr(),
                                      style: TextStyle(
                                          fontSize: 25, color: yellowColor),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: YellowCustomDesign(
                                        height: 50,
                                        text: "30 ${LocaleKeys.pound.tr()}",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: greyColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Row(
                          children: [
                            TransportCustomDesign(
                              onTap: () {},
                              icon: const Icon(
                                Icons.car_repair,
                                color: Colors.white,
                                size: 80,
                              ),
                              containerColor: purpleColor,
                              paddingValue: 10,
                              borderRadius: 15,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.calculateScreenTabs1.tr(),
                                  style: TextStyle(
                                      fontSize: 17, color: textGreyTwoColor),
                                  textAlign: TextAlign.center,
                                ),
                                put_line(
                                  color: yellowColor,
                                  line_width: 90,
                                ),
                                Text(
                                  fromCity,
                                  style: TextStyle(
                                      fontSize: 15, color: textGreyColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: YellowButtonCustomDesign(
                                height: 50,
                                textSize: 20,
                                text: LocaleKeys.calculateScreenModify.tr(),
                                inkwellFunc: () {
                                  cubit.chooseRight();
                                  navigateAndFinish(context,
                                      layout: CalculateChargeScreen());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Row(
                          children: [
                            TransportCustomDesign(
                              onTap: () {},
                              icon: const Icon(
                                Icons.car_repair,
                                color: Colors.white,
                                size: 80,
                              ),
                              containerColor: purpleColor,
                              paddingValue: 10,
                              borderRadius: 15,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.calculateScreenTabs2.tr(),
                                  style: TextStyle(
                                      fontSize: 17, color: textGreyTwoColor),
                                  textAlign: TextAlign.center,
                                ),
                                put_line(
                                  color: yellowColor,
                                  line_width: 90,
                                ),
                                Text(
                                  toCity,
                                  style: TextStyle(
                                      fontSize: 15, color: textGreyColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: YellowButtonCustomDesign(
                                height: 50,
                                textSize: 20,
                                text: LocaleKeys.calculateScreenModify.tr(),
                                inkwellFunc: () {
                                  cubit.chooseMiddle();
                                  navigateAndFinish(context,
                                      layout: CalculateChargeScreen());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Row(
                          children: [
                            TransportCustomDesign(
                              onTap: () {},
                              icon: const Icon(
                                Icons.car_repair,
                                color: Colors.white,
                                size: 80,
                              ),
                              containerColor: purpleColor,
                              paddingValue: 10,
                              borderRadius: 15,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.calculateScreenTabs3.tr(),
                                  style: TextStyle(
                                      fontSize: 17, color: textGreyTwoColor),
                                  textAlign: TextAlign.center,
                                ),
                                put_line(
                                  color: yellowColor,
                                  line_width: 90,
                                ),
                                Text(
                                  "طرد 50 كيلو",
                                  style: TextStyle(
                                      fontSize: 15, color: textGreyColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: YellowButtonCustomDesign(
                                height: 50,
                                textSize: 20,
                                text: LocaleKeys.calculateScreenModify.tr(),
                                inkwellFunc: () {
                                  backToPrevious(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ButtonCustomDesign(
                          text: Text(
                            LocaleKeys.continueShipping.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          inkwellFunc: () {
                            navigateAndBack(context,
                                layout: ToWhoDataDetails());
                          },
                          containerColor: purpleColor,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
