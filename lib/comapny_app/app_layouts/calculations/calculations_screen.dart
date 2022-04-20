import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/calculations/calculations_bloc/calculations_cubit.dart';
import 'package:wasela/comapny_app/app_layouts/calculations/calculations_bloc/calculations_states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

class CalculationsScreenForCompanyApp extends StatelessWidget {
  const CalculationsScreenForCompanyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculationsCubitClassForCompany, CalculationsStatesForCompany>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: greyColor,
            appBar:generateAppBarForCompanyMainScreens(
              title: "الحسابات",
              svgPath: "noun-accounting-4679331",
              context: context,
              imageSize: 80.0,
              mainScreen: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
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
                                                  color: Colors.white,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "مبالغ قيد التحصيل",
                                              style: TextStyle(
                                                  color: Colors.white,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "5000 جنيه",
                                              style: TextStyle(
                                                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,height: 1.5),
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
                                          padding: const EdgeInsets.only(top: 15.0),
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
                                                  color: Colors.black,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "الرصيد المستحق",
                                              style: TextStyle(
                                                  color: Colors.black,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "5000 pound",
                                              style: TextStyle(
                                                  color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25,height: 1.5),
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
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            columnWidths: {
                              2: FlexColumnWidth(.5),
                              1: FlexColumnWidth(.6)
                            },
                            border: TableBorder.all(),
                            children: [
                              TableRow(children: [
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "نوع العملية",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "القيمة",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "تكلفة الشحن",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ]),
                              TableRow(children: [
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ]),
                              const TableRow(children: [
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ]),
                              const TableRow(children: [
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
