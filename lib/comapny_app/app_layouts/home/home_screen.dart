import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/home/home_bloc/home_cubit.dart';
import 'package:wasela/comapny_app/app_layouts/home/home_bloc/home_states.dart';
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
        return BlocConsumer<HomeCubitClassForCompany, HomeStatesForCompany>(
            listener: (context, state) {},
            builder: (context, state) {
              var homeCubit = HomeCubitClassForCompany.get(context);
              return Scaffold(
                  backgroundColor: greyColor,
                  appBar: generateAppBarForCompanyMainScreens(
                    mainScreen: true,
                    context: context,
                    title: LocaleKeys.bottomNavItemsName1.tr(),
                    svgPath: "home",
                    textHeight: 2.0,
                  ),
                  body: ConditionalBuilder(
                      condition: state is! GetCodAndBalanceLoadingState &&
                          state is! GetChartDataLoadingState &&
                          homeCubit.success != null,
                      builder: (context) {
                        return SingleChildScrollView(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 45),
                                                      child:
                                                          CustomDesignUnActive(
                                                        width: 160,
                                                        height: 160,
                                                        borderWidth: 5,
                                                        borderRadius: 0,
                                                        borderColor:
                                                            purpleColor,
                                                        text: Column(
                                                          children: [
                                                            Text(
                                                              "cod",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "مبالغ قيد التحصيل",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "${homeCubit.cod} جنيه",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 25,
                                                                  height: 1.5),
                                                            ),
                                                          ],
                                                        ),
                                                        containerColor:
                                                            purpleColor,
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          purpleColor,
                                                      radius: 50,
                                                      child: CircleAvatar(
                                                        radius: 45,
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15.0),
                                                          child:
                                                              SvgPicture.asset(
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
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 45),
                                                      child:
                                                          CustomDesignUnActive(
                                                        width: 160,
                                                        height: 160,
                                                        borderWidth: 5,
                                                        borderRadius: 0,
                                                        borderColor:
                                                            yellowColor,
                                                        text: Column(
                                                          children: [
                                                            Text(
                                                              "Balance due",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "الرصيد المستحق",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "${homeCubit.balance} جنيه",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 25,
                                                                  height: 1.5),
                                                            ),
                                                          ],
                                                        ),
                                                        containerColor:
                                                            yellowColor,
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          yellowColor,
                                                      radius: 50,
                                                      child: CircleAvatar(
                                                        radius: 45,
                                                        backgroundColor:
                                                            Colors.white,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: BarChart(
                                        BarChartData(
                                            gridData: FlGridData(
                                              show: true,
                                              drawHorizontalLine: true,
                                              drawVerticalLine: false,
                                            ),
                                            maxY: 10,
                                            baselineY: 100,
                                            axisTitleData: FlAxisTitleData(),
                                            barTouchData: BarTouchData(
                                              enabled: false,
                                            ),
                                            titlesData: FlTitlesData(
                                              show: false,
                                              bottomTitles: SideTitles(
                                                showTitles: true,
                                              ),
                                              topTitles: SideTitles(
                                                showTitles: false,
                                              ),
                                              rightTitles: SideTitles(
                                                showTitles: false,
                                              ),
                                              leftTitles: SideTitles(
                                                showTitles: true,
                                                interval: 10.0,
                                                reservedSize: 30.0,
                                              ),
                                            ),
                                            barGroups: [
                                              BarChartGroupData(
                                                  x: 50,
                                                  groupVertically: false,
                                                  barRods: [
                                                    BarChartRodData(
                                                        toY: homeCubit
                                                            .pickUpHasBeenReceived!,
                                                        width: 40,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.zero),
                                                        colors: [
                                                          purpleColor,
                                                        ]),
                                                  ]),
                                              BarChartGroupData(
                                                  x: 100,
                                                  groupVertically: false,
                                                  barRods: [
                                                    BarChartRodData(
                                                        toY: homeCubit
                                                            .underCollection!,
                                                        width: 40,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.zero),
                                                        colors: [
                                                          yellowColor,
                                                        ]),
                                                  ]),
                                              BarChartGroupData(
                                                  x: 100,
                                                  groupVertically: false,
                                                  barRods: [
                                                    BarChartRodData(
                                                        toY: homeCubit.success!,
                                                        width: 40,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.zero),
                                                        colors: [
                                                          Colors.green,
                                                        ]),
                                                  ]),
                                              BarChartGroupData(
                                                  x: 100,
                                                  groupVertically: false,
                                                  barRods: [
                                                    BarChartRodData(
                                                        toY: homeCubit.failed!,
                                                        width: 40,
                                                        borderRadius:
                                                            const BorderRadius.all(
                                                                Radius.zero),
                                                        colors: [
                                                          Colors.red,
                                                        ]),
                                                  ]),
                                              BarChartGroupData(
                                                  x: 100,
                                                  groupVertically: false,
                                                  barRods: [
                                                    BarChartRodData(
                                                        toY: homeCubit.returns!,
                                                        width: 40,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.zero),
                                                        colors: [
                                                          Colors.black,
                                                        ]),
                                                  ]),
                                            ]
                                            // read about it in the BarChartData section
                                            ),
                                        swapAnimationDuration:
                                            Duration(milliseconds: 150),
                                        // Optional
                                        swapAnimationCurve:
                                            Curves.linear, // Optional
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 95,
                                    width: 350,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 25.0,end: 20.0),
                                      child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: const [
                                            Text(
                                              "تم استلام البيك اب",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  decorationStyle:
                                                      TextDecorationStyle.wavy),
                                              textScaleFactor: 1.0,
                                            ),
                                            Text(
                                              "قيد التحصيل",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  decorationStyle:
                                                      TextDecorationStyle
                                                          .wavy),
                                              textScaleFactor: 1.0,
                                            ),
                                            Text(
                                              "تسليم ناجح",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  decorationStyle:
                                                      TextDecorationStyle.wavy),
                                              textScaleFactor: 1.0,
                                            ),
                                            Text(
                                              "فشل التسليم",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  decorationStyle:
                                                      TextDecorationStyle
                                                          .wavy),
                                              textScaleFactor: 1.0,
                                            ),
                                            Text(
                                              "المرتجعات",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  decorationStyle:
                                                      TextDecorationStyle
                                                          .wavy),
                                              textScaleFactor: 1.0,
                                            ),
                                          ],
                                        ),
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
                                bottom: 750,
                              ),
                            ],
                          ),
                        );
                      },
                      fallback: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }));
            });
      },
    );
  }
}
