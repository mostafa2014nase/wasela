import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/mainscreen/nav_bloc/main_nav_cubit.dart';
import 'package:wasela/mainscreen/nav_bloc/main_nav_states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class HomeScreenForCompanyApp extends StatelessWidget {
  const HomeScreenForCompanyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainNavCubitClass, MainNavStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: greyColor,
            appBar: generateAppBarForCompanyMainScreens(
              mainScreen: true,
              context: context,
              title: LocaleKeys.bottomNavItemsName1.tr(),
              svgPath: "home",
              textHeight: 2.0,
            ),
            body: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        color: purpleColor,
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10.0,
                          left: 10.0,
                          bottom: 20.0,
                          top: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 45),
                                          child: CustomDesignUnActive(
                                            width: 160,
                                            height: 160,
                                            borderWidth: 5,
                                            borderRadius: 0,
                                            borderColor: purpleColor,
                                            text: Column(
                                              children: [
                                                Text(
                                                  "cod",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "مبالغ قيد التحصيل",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "5000 جنيه",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25,
                                                      height: 1.5),
                                                ),
                                              ],
                                            ),
                                            containerColor: purpleColor,
                                          ),
                                        ),
                                        CircleAvatar(
                                          backgroundColor: purpleColor,
                                          radius: 50,
                                          child: CircleAvatar(
                                            radius: 45,
                                            backgroundColor: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0),
                                              child: SvgPicture.asset(
                                                "Assets/images/noun-cod-3282485.svg",
                                                color: purpleColor,
                                                width: 80,
                                                height: 80,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    onTap: () {},
                                  ),
                                  InkWell(
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 45),
                                          child: CustomDesignUnActive(
                                            width: 160,
                                            height: 160,
                                            borderWidth: 5,
                                            borderRadius: 0,
                                            borderColor: yellowColor,
                                            text: Column(
                                              children: [
                                                Text(
                                                  "Balance due",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "الرصيد المستحق",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "5000 pound",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25,
                                                      height: 1.5),
                                                ),
                                              ],
                                            ),
                                            containerColor: yellowColor,
                                          ),
                                        ),
                                        CircleAvatar(
                                          backgroundColor: yellowColor,
                                          radius: 50,
                                          child: CircleAvatar(
                                            radius: 45,
                                            backgroundColor: Colors.white,
                                            child: SvgPicture.asset(
                                              "Assets/images/noun-cash-on-delivery-3881853.svg",
                                              color: yellowColor,
                                              width: 60,
                                              height: 60,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 350,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: BarChart(
                            BarChartData(
                                gridData: FlGridData(
                                  show: true,
                                  drawHorizontalLine: true,
                                  drawVerticalLine: false,
                                ),
                                maxY: 600,
                                baselineY: 100,
                                axisTitleData: FlAxisTitleData(),
                                barTouchData: BarTouchData(
                                  enabled: false,
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  bottomTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                  topTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                  rightTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    interval: 50.0,
                                    reservedSize: 30.0,
                                  ),
                                ),
                                barGroups: [
                                  BarChartGroupData(
                                      x: 50,
                                      groupVertically: false,
                                      barRods: [
                                        BarChartRodData(
                                            toY: 600,
                                            width: 40,
                                            borderRadius:
                                                BorderRadius.all(Radius.zero),
                                            colors: [
                                              purpleColor,
                                            ]),
                                      ]),
                                  BarChartGroupData(
                                      x: 100,
                                      groupVertically: false,
                                      barRods: [
                                        BarChartRodData(
                                            toY: 250,
                                            width: 40,
                                            borderRadius:
                                                BorderRadius.all(Radius.zero),
                                            colors: [
                                              yellowColor,
                                            ]),
                                      ]),
                                  BarChartGroupData(
                                      x: 100,
                                      groupVertically: false,
                                      barRods: [
                                        BarChartRodData(
                                            toY: 120,
                                            width: 40,
                                            borderRadius:
                                                BorderRadius.all(Radius.zero),
                                            colors: [
                                              Colors.green,
                                            ]),
                                      ]),
                                  BarChartGroupData(
                                      x: 100,
                                      groupVertically: false,
                                      barRods: [
                                        BarChartRodData(
                                            toY: 70,
                                            width: 40,
                                            borderRadius:
                                                BorderRadius.all(Radius.zero),
                                            colors: [
                                              Colors.blue,
                                            ]),
                                      ]),
                                  BarChartGroupData(
                                      x: 100,
                                      groupVertically: false,
                                      barRods: [
                                        BarChartRodData(
                                            toY: 50,
                                            width: 40,
                                            borderRadius:
                                                BorderRadius.all(Radius.zero),
                                            colors: [
                                              Colors.red,
                                            ]),
                                      ]),
                                  BarChartGroupData(
                                      x: 100,
                                      groupVertically: false,
                                      barRods: [
                                        BarChartRodData(
                                            toY: 20,
                                            width: 40,
                                            borderRadius:
                                                BorderRadius.all(Radius.zero),
                                            colors: [
                                              Colors.black,
                                            ]),
                                      ]),
                                ]
                                // read about it in the BarChartData section
                                ),
                            swapAnimationDuration: Duration(milliseconds: 150),
                            // Optional
                            swapAnimationCurve: Curves.linear, // Optional
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  Positioned(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      // foregroundColor: Colors.white,
                      child: CustomDesignUnActive(
                        containerColor: Colors.white,
                        borderColor: purpleColor,
                        borderWidth: 2,
                        height: 100,
                        borderRadius: 90,
                        text: SvgPicture.asset(
                          "Assets/images/company.svg",
                          color: purpleColor,
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    bottom: 640,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
