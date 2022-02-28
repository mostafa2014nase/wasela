import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/charge/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/charge/bloc/states.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/charge/evaluate.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

import '../../../../helper_methods/constants/endpoints.dart';

class ChargeScreen extends StatelessWidget {
  const ChargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChargeCubitClass, ChargeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ChargeCubitClass.get(context);
          return DefaultTabController(
            length: 3,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: greyColor,
                appBar: AppBar(
                  toolbarHeight: 140,
                  backgroundColor: purpleColor,
                  centerTitle: true,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
//backToPrevious(context);
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
                        child: SvgPicture.asset(
                          "Assets/images/menu.svg",
                          color: Colors.white,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                  title: Column(
                    children: [
                      Icon(
                        Icons.indeterminate_check_box,
                        size: 70,
                      ),
                      Text(
                        "شحناتي",
                        style: TextStyle(fontSize: 25, height: 1.5),
                      ),
                    ],
                  ),
                ),
                body: SafeArea(
                  child: Column(
                    textDirection: TextDirection.rtl,
                    children: [
                      TabBar(
                        enableFeedback: true,
                        physics: const BouncingScrollPhysics(),
                        labelPadding:
                            const EdgeInsets.only(top: 30.0, bottom: 10),
                        unselectedLabelColor: textGreyTwoColor,
                        labelColor: purpleColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: yellowColor,
                        indicatorWeight: 6,
                        // onTap: (index) {
                        //   cubit.toggleTab(index);
                        // },
                        tabs: [
                          Text(
                            "الشحنات الحالية",
                          ),
                          Text(
                            "الشحنات المرسلة",
                          ),
                          Text(
                            "الشحنات المنتهية",
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TabBarView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Container(
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.8,
                                              color: purpleColor,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Text(
                                                "من تاريخ",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.calendar_today,
                                                color: purpleColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.8,
                                              color: purpleColor,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Text(
                                                "إلى تاريخ",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.calendar_today,
                                                color: purpleColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              width: 200,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: greyColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: purpleColor,
                                                  )),
                                              child: Text(
                                                "البحث برقم بوصيلة الشحن",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: purpleColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0)),
                                                  border: Border.all(
                                                    width: 0.8,
                                                    color: purpleColor,
                                                  )),
                                              child: Expanded(
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 10, top: 40),
                                      child: ListView.separated(
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return DecoratedContainerWithShadow(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () {},
                                                        child:
                                                            CustomContainerForDetails(
                                                          text1:
                                                              "تتبع الشحنة على الخريطة",
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_back_ios,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 40),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      SizedBox(
                                                        child: MySeparator(
                                                          color: Colors.red,
                                                          height: 1.7,
                                                        ),
                                                        width: 300,
                                                      ),
                                                      Row(
                                                        textDirection:
                                                        TextDirection.rtl,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          DoneCircularAvatar(

                                                            underText:
                                                            "طلب جديد",
                                                          ),
                                                          DoneCircularAvatar(
                                                            underText:
                                                            "الإستلام من المندوب",
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: "التغليف",
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: "فى الطريق للعميل",
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: "تم الإستلام",
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 20,
                                          );
                                        },
                                        itemCount: 10,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Container(
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.8,
                                              color: purpleColor,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Text(
                                                "من تاريخ",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.calendar_today,
                                                color: purpleColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.8,
                                              color: purpleColor,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Text(
                                                "إلى تاريخ",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.calendar_today,
                                                color: purpleColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              width: 200,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: greyColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: purpleColor,
                                                  )),
                                              child: Text(
                                                "البحث برقم بوصيلة الشحن",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: purpleColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0)),
                                                  border: Border.all(
                                                    width: 0.8,
                                                    color: purpleColor,
                                                  )),
                                              child: Expanded(
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 10, top: 40),
                                      child: ListView.separated(
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return DecoratedContainerWithShadow(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () {},
                                                        child:
                                                            CustomContainerForDetails(
                                                          text1:
                                                              "تتبع الشحنة على الخريطة",
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_back_ios,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 40),
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      SizedBox(
                                                        child: MySeparator(
                                                          color: Colors.red,
                                                          height: 1.7,
                                                        ),
                                                        width: 300,
                                                      ),
                                                      Row(
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          DoneCircularAvatar(
                                                            underText:
                                                            "طلب جديد",
                                                          ),
                                                          DoneCircularAvatar(
                                                            underText:
                                                            "الإستلام من المندوب",
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: "التغليف",
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: "فى الطريق للعميل",
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: "تم الإستلام",
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 20,
                                          );
                                        },
                                        itemCount: 10,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Container(
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.8,
                                              color: purpleColor,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Text(
                                                "من تاريخ",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.calendar_today,
                                                color: purpleColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              width: 0.8,
                                              color: purpleColor,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Text(
                                                "إلى تاريخ",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.calendar_today,
                                                color: purpleColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              width: 200,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: greyColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: purpleColor,
                                                  )),
                                              child: Text(
                                                "البحث برقم بوصيلة الشحن",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: purpleColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0)),
                                                  border: Border.all(
                                                    width: 0.8,
                                                    color: purpleColor,
                                                  )),
                                              child: Expanded(
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 10, top: 40),
                                      child: ListView.separated(
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return DecoratedContainerWithShadow(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1:
                                                              "رقم بوليصة الشحن",
                                                          text2: "1855",
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () {
                                                          navigateAndBack(
                                                              context,
                                                              layout:EvaluateScreen(),);
                                                        },
                                                        child:
                                                            CustomContainerForDetails(
                                                          text1: "تقييم الشحنة",
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_back_ios,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 20,
                                          );
                                        },
                                        itemCount: 10,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

// DefaultTabController(
// length: 3,
// child: Column(
// children: [
// TabBar(//indicatorPadding: EdgeInsets.all(30.0),
// labelPadding: EdgeInsets.all(30.0),
// labelColor: Colors.black,
// indicatorWeight: 6,
// indicatorColor: yellowColor,
// onTap: (index) {
// cubit.toggleTab(index);
// },
// tabs: [
// Text(
// "one tap",
// style: TextStyle(color: Colors.black),
// ),
// Text(
// "two tap",
// style: TextStyle(color: Colors.black),
// ),
// Text(
// "three tap",
// style: TextStyle(color: Colors.black),
// ),
// ],
// ),
// TabBarView(
// children: [
// Center(
// child: Text(
// "one tap",
// style: TextStyle(color: Colors.red, fontSize: 25),
// )),
// Text(
// "two tap",
// style: TextStyle(color: Colors.black),
// ),
// Text(
// "three tap",
// style: TextStyle(color: Colors.black),
// ),
// ],
// ),
// ],
// ),
// ),
