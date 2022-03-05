import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/charge/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/charge/bloc/states.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/home/home_screen.dart';
import 'package:wasela/app_layouts/main_layouts/mainscreen/main_nav_screen.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

import '../../../../helper_methods/constants/endpoints.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

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
                appBar: generateAppBar(
                  context: context,
                  title: LocaleKeys.bottomNavItemsName2.tr(),
                  svgPath: "wallet",
                ),
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
                        indicatorColor: purpleColor,
                        indicatorWeight: 6,
                        // onTap: (index) {
                        //   cubit.toggleTab(index);
                        // },
                        tabs: [
                          Text(
                            LocaleKeys.walletScreenTabBar1.tr(),
                          ),
                          Text(
                            LocaleKeys.walletScreenTabBar2.tr(),
                          ),
                          Text(
                            LocaleKeys.walletScreenTabBar3.tr(),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                "Assets/images/calendar Income.svg",
                                                color: purpleColor,
                                                width: 35,
                                                height: 35,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 5,left: 5,),
                                                width: 200,
                                                height: 40,
                                                color: greyColor,
                                                child: Text(
                                                  LocaleKeys.walletScreenSearch.tr(),
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: purpleColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
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
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                                top: 40,
                                                bottom: 20),
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return DecoratedContainerWithShadow(
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          CustomRowForDetails(
                                                            text1:
                                                                LocaleKeys.walletScreenListItemDetails1.tr(),
                                                            text2: "1855",
                                                          ),
                                                          CustomRowForDetails(
                                                            text1:
                                                            LocaleKeys.walletScreenListItemDetails2.tr(),
                                                            text2: "1855",
                                                          ),
                                                          CustomRowForDetails(
                                                            text1:
                                                            LocaleKeys.walletScreenListItemDetails3.tr(),
                                                            text2: "1855",
                                                          ),
                                                          CustomRowForDetails(
                                                            text1:
                                                            LocaleKeys.walletScreenListItemDetails4.tr(),
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
                                                                LocaleKeys.walletScreenListItemButton.tr(),
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_back_ios,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                  height: 20,
                                                );
                                              },
                                              itemCount: 10,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    LocaleKeys.walletScreenAll1.tr(),
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomDesign(
                                                    text: Text(
                                                      "5000 جنية",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    containerColor: purpleColor,
                                                    width: 110,
                                                    height: 80,
                                                  )
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    LocaleKeys.walletScreenAll2.tr(),
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomDesign(
                                                    text: Text(
                                                      "5000 ${LocaleKeys.pound.tr()}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    containerColor: purpleColor,
                                                    width: 110,
                                                    height: 80,
                                                  )
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    LocaleKeys.walletScreenAll3.tr(),
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomDesign(
                                                    text: Text(
                                                      "5000 ${LocaleKeys.pound.tr()}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    containerColor: purpleColor,
                                                    width: 110,
                                                    height: 80,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 35,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                "Assets/images/calendar Income.svg",
                                                color: purpleColor,
                                                width: 35,
                                                height: 35,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 5.0,left: 5.0),
                                                width: 200,
                                                height: 40,
                                                color: greyColor,
                                                child: Text(
                                                  LocaleKeys.walletScreenSearch.tr(),
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: purpleColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
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
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                                top: 40,
                                                bottom: 20),
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return DecoratedContainerWithShadow(
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          CustomRowForDetails(
                                                            text1:
                                                            LocaleKeys.walletScreenListItemDetails1.tr(),
                                                            text2: "1855",
                                                          ),
                                                          CustomRowForDetails(
                                                            text1:
                                                            LocaleKeys.walletScreenListItemDetails2.tr(),
                                                            text2: "1855",
                                                          ),
                                                          CustomRowForDetails(
                                                            text1:
                                                            LocaleKeys.walletScreenListItemDetails3.tr(),
                                                            text2: "1855",
                                                          ),
                                                          CustomRowForDetails(
                                                            text1:
                                                            LocaleKeys.walletScreenListItemDetails4.tr(),
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
                                                            LocaleKeys.walletScreenListItemButton.tr(),
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_back_ios,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                  height: 20,
                                                );
                                              },
                                              itemCount: 10,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      LocaleKeys.walletScreenAll1.tr()),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: purpleColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Text(
                                                        "5000 ${LocaleKeys.pound.tr()}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                "Assets/images/calendar Income.svg",
                                                color: purpleColor,
                                                width: 35,
                                                height: 35,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 5.0,left: 5.0),
                                                width: 200,
                                                height: 40,
                                                color: greyColor,
                                                child: Text(
                                                  LocaleKeys.walletScreenSearch.tr(),
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: purpleColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
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
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                                top: 40,
                                                bottom: 20),
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return DecoratedContainerWithShadow(
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          CustomRowForDetails(
                                                            text1:
                                                                LocaleKeys.walletScreenPointsListItemDetails1.tr(),
                                                            text2: "1855",
                                                          ),
                                                          CustomRowForDetails(
                                                            text1: LocaleKeys.walletScreenPointsListItemDetails2.tr(),
                                                            text2: "1855",
                                                          ),
                                                          CustomRowForDetails(
                                                            text1:
                                                            LocaleKeys.walletScreenPointsListItemDetails3.tr(),
                                                            text2: "1855",
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                  height: 20,
                                                );
                                              },
                                              itemCount: 10,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(LocaleKeys.walletScreenPointsAll2.tr()),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: purpleColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Text(
                                                        "5000 ${LocaleKeys.pound.tr()}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(LocaleKeys.walletScreenPointsAll1.tr()),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: purpleColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Text(
                                                        "5000 ${LocaleKeys.pound.tr()}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  shape: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(30),
                                                        topRight:
                                                            Radius.circular(30),
                                                      )),
                                                  constraints: BoxConstraints(
                                                    maxHeight: 300,
                                                  ),
                                                  isScrollControlled: true,
                                                  builder: (context) {
                                                    return Container(
                                                      width: double.infinity,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20,
                                                              horizontal: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                LocaleKeys.bottomSheet1.tr(),
                                                                textAlign: TextAlign
                                                                    .center,
                                                                style: TextStyle(
                                                                  color:
                                                                      purpleColor,
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              Text(
                                                                LocaleKeys.bottomSheet2.tr(),
                                                                style: TextStyle(
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 8.0,
                                                                        bottom:
                                                                            10.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    CustomDesign(
                                                                        borderRadius:
                                                                            5,
                                                                        width: 110,
                                                                        height: 98,
                                                                        text:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                                  .all(
                                                                              10.0),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Padding(
                                                                                padding:
                                                                                    const EdgeInsets.all(2.0),
                                                                                child:
                                                                                    SvgPicture.asset(
                                                                                  "Assets/images/cash-back.svg",
                                                                                  width: 40,
                                                                                  height: 40,
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                LocaleKeys.bottomSheetChoice1.tr(),
                                                                                style: TextStyle(
                                                                                    color: Colors.white,
                                                                                    fontSize: 20,
                                                                                    height: 1.5),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        containerColor:
                                                                            purpleColor),
                                                                    CustomDesignUnActive(
                                                                        borderColor:
                                                                            purpleColor,
                                                                        borderRadius:
                                                                            5,
                                                                        width: 110,
                                                                        height: 98,
                                                                        text:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                                  .all(
                                                                              10.0),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Padding(
                                                                                padding:
                                                                                    const EdgeInsets.all(2.0),
                                                                                child:
                                                                                    SvgPicture.asset(
                                                                                  "Assets/images/cash-back.svg",
                                                                                  width: 40,
                                                                                  height: 40,
                                                                                  color: purpleColor,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                LocaleKeys.bottomSheetChoice2.tr(),
                                                                                style: TextStyle(
                                                                                    color: purpleColor,
                                                                                    fontSize: 20,
                                                                                    height: 1.5),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        containerColor:
                                                                            Colors
                                                                                .transparent),
                                                                    CustomDesignUnActive(
                                                                        borderColor:
                                                                            purpleColor,
                                                                        borderRadius:
                                                                            5,
                                                                        width: 110,
                                                                        height: 98,
                                                                        text:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                                  .all(
                                                                              10.0),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Padding(
                                                                                padding:
                                                                                    const EdgeInsets.all(2.0),
                                                                                child:
                                                                                    SvgPicture.asset(
                                                                                  "Assets/images/party.svg",
                                                                                  width: 40,
                                                                                  height: 40,
                                                                                  color: purpleColor,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                LocaleKeys.bottomSheetChoice3.tr(),
                                                                                style: TextStyle(
                                                                                    color: purpleColor,
                                                                                    fontSize: 20,
                                                                                    height: 1.5),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        containerColor:
                                                                            Colors
                                                                                .transparent),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Stack(
                                                            alignment: AlignmentDirectional
                                                                .centerEnd,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            25),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                padding: EdgeInsetsDirectional.only(
                                                                        start:
                                                                            20),
                                                                width: 250,
                                                                height: 60,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color:
                                                                            purpleColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              purpleColor,
                                                                        )),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                          .only(
                                                                      end:
                                                                          50.0),
                                                                  child: Text(
                                                                    LocaleKeys.bottomSheetPerform.tr(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                              Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 30,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundColor:
                                                                        purpleColor,
                                                                  ),
                                                                  CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      "Assets/images/confirm.svg",
                                                                      color:
                                                                          purpleColor,
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Stack(
                                                alignment: AlignmentDirectional.centerEnd,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25),
                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.only(
                                                        right: 20),
                                                    width: 250,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        color: purpleColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: purpleColor,
                                                        )),
                                                    child: Text(
                                                      LocaleKeys.walletScreenPointsAll3.tr(),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color:
                                                              Colors.white),
                                                    ),
                                                  ),
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor:
                                                            Colors.white,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 25,
                                                        backgroundColor:
                                                            purpleColor,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: SvgPicture.asset(
                                                          "Assets/images/confirm.svg",
                                                          color: purpleColor,
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                        ],
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
