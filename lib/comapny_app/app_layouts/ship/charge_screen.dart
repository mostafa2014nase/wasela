import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';

import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

import 'follow_shipping.dart';

class ShipScreenForCompanyApp extends StatelessWidget {
  const ShipScreenForCompanyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipForCompanyAppCubitClass, ShipStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShipForCompanyAppCubitClass.get(context);
          return DefaultTabController(
            length: 3,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: generateAppBar(
                  title: LocaleKeys.bottomNavItemsName4.tr(),
                  svgPath: "wallet",
                  context: context,
                ),
                primary: true,
                resizeToAvoidBottomInset: false,
                backgroundColor: greyColor,
                body: SafeArea(
                  child: Column(
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
                            LocaleKeys.shippingTabs1.tr(),
                          ),
                          Text(
                            LocaleKeys.shippingTabs2.tr(),
                          ),
                          Text(
                            LocaleKeys.shippingTabs3.tr(),
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
                                children: [
                                  Row(
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
                                            children: [
                                              Text(
                                                LocaleKeys.shippingSearch1.tr(),
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
                                            children: [
                                              Text(
                                                LocaleKeys.shippingSearch2.tr(),
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
                                          alignment:
                                              AlignmentDirectional.centerEnd,
                                          children: [
                                            Container(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 5),
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
                                                LocaleKeys.shippingSearch3.tr(),
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: purpleColor,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .only(
                                                              bottomEnd: Radius
                                                                  .circular(
                                                                      10.0),
                                                              topEnd: Radius
                                                                  .circular(
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
                                                  children: [
                                                    Column(
                                                      children: [
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .walletScreenListItemDetails1
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails2
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .walletScreenListItemDetails2
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails4
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails5
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails6
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails7
                                                              .tr(),
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
                                                              layout:
                                                                  FollowShippingOnMapScreen());
                                                        },
                                                        child:
                                                            CustomContainerForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemButton
                                                              .tr(),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 40),
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
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          DoneCircularAvatar(
                                                            underText: LocaleKeys
                                                                .shippingQueSteps1
                                                                .tr(),
                                                          ),
                                                          DoneCircularAvatar(
                                                            underText: LocaleKeys
                                                                .shippingQueSteps2
                                                                .tr(),
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: LocaleKeys
                                                                .shippingQueSteps3
                                                                .tr(),
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: LocaleKeys
                                                                .shippingQueSteps4
                                                                .tr(),
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: LocaleKeys
                                                                .shippingQueSteps5
                                                                .tr(),
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
                                children: [
                                  Row(
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
                                            children: [
                                              Text(
                                                LocaleKeys.shippingSearch1.tr(),
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
                                            children: [
                                              Text(
                                                LocaleKeys.shippingSearch2.tr(),
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
                                          alignment:
                                              AlignmentDirectional.centerEnd,
                                          children: [
                                            Container(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 5),
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
                                                LocaleKeys.shippingSearch3.tr(),
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: purpleColor,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .only(
                                                              bottomEnd: Radius
                                                                  .circular(
                                                                      10.0),
                                                              topEnd: Radius
                                                                  .circular(
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
                                                  children: [
                                                    Column(
                                                      children: [
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .walletScreenListItemDetails1
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails2
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .walletScreenListItemDetails2
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails4
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails5
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails6
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails7
                                                              .tr(),
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
                                                          text1: LocaleKeys
                                                              .shippingListItemButton
                                                              .tr(),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 40),
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
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          DoneCircularAvatar(
                                                            underText: LocaleKeys
                                                                .shippingQueSteps1
                                                                .tr(),
                                                          ),
                                                          DoneCircularAvatar(
                                                            underText: LocaleKeys
                                                                .shippingQueSteps2
                                                                .tr(),
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: LocaleKeys
                                                                .shippingQueSteps3
                                                                .tr(),
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: LocaleKeys
                                                                .shippingQueSteps4
                                                                .tr(),
                                                          ),
                                                          NotYetYellowContainer(
                                                            underText: LocaleKeys
                                                                .shippingQueSteps5
                                                                .tr(),
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
                                children: [
                                  Row(
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
                                            children: [
                                              Text(
                                                LocaleKeys.shippingSearch1.tr(),
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
                                            children: [
                                              Text(
                                                LocaleKeys.shippingSearch2.tr(),
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
                                          alignment:
                                              AlignmentDirectional.centerEnd,
                                          children: [
                                            Container(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 5),
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
                                                LocaleKeys.shippingSearch3.tr(),
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: purpleColor,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .only(
                                                              bottomEnd: Radius
                                                                  .circular(
                                                                      10.0),
                                                              topEnd: Radius
                                                                  .circular(
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
                                                  children: [
                                                    Column(
                                                      children: [
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .walletScreenListItemDetails1
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails2
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .walletScreenListItemDetails2
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails4
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails5
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails6
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                        CustomRowForDetails(
                                                          text1: LocaleKeys
                                                              .shippingListItemDetails7
                                                              .tr(),
                                                          text2: "1855",
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10,
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
