import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/states.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

class CalculateChargeSecondScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculateChargingCubitClass, CalculateChargingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CalculateChargingCubitClass.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: purpleColor,
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: SizedBox(
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_none,
                          size: 40,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "Assets/images/wallet.svg",
                          width: 40,
                          height: 40,
                          color: Colors.white,
                        ),
                        Text(
                          "تقييم الشحنة",
                          style: TextStyle(fontSize: 25, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            leading: IconButton(
              onPressed: () {
                backToPrevious(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 175,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
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
                              size: 140,
                            ),
                            containerColor: Colors.white,
                            paddingValue: 10,
                            borderRadius: 15,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Expanded(
                                      child: YellowCustomDesign(
                                        height: 50,
                                        text: "4 أيام",
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 17),
                                      child: Text(
                                        "الشحن خلال",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    ),
                                  ]),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Text(
                                      "التكلفة",
                                      style: TextStyle(
                                          fontSize: 25, color: yellowColor),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Expanded(
                                      child: YellowCustomDesign(
                                        height: 50,
                                        text: "30 جنية",
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "الشحنة من ",
                                  style: TextStyle(
                                      fontSize: 17, color: textGreyTwoColor),
                                  textAlign: TextAlign.center,
                                ),
                                put_line(
                                  color: yellowColor,
                                  line_width: 90,
                                ),
                                Text(
                                  "القاهرة الجديدة",
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
                                text: "تعديل",
                                inkwellFunc: () {},
                              ),
                            ),
                          ],
                          textDirection: TextDirection.rtl,
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "الشحنة الي",
                                  style: TextStyle(
                                      fontSize: 17, color: textGreyTwoColor),
                                  textAlign: TextAlign.center,
                                ),
                                put_line(
                                  color: yellowColor,
                                  line_width: 90,
                                ),
                                Text(
                                  "القاهرة الجديدة",
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
                                text: "تعديل",
                                inkwellFunc: () {},
                              ),
                            ),
                          ],
                          textDirection: TextDirection.rtl,
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "نوع الشحنة",
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
                                text: "تعديل",
                                inkwellFunc: () {},
                              ),
                            ),
                          ],
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ButtonCustomDesign(
                          text: const Text(
                            "أحسب شحنتك",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          inkwellFunc: () {
                            //navigateAndBack(context, PranchesMapAndMenue());
                          },
                          containerColor: purpleColor,
                        ),
                      ),
                      SizedBox(height: 30,),
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
