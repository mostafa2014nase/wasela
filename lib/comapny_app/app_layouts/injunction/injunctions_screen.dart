import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/injunction/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/injunction/bloc/states.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/cubit.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class InjunctionsScreenForCompanyApp extends StatelessWidget {
  const InjunctionsScreenForCompanyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InjunctionsAppCubitClass, InjunctionsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = InjunctionsAppCubitClass.get(context);
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: generateAppBarForCompanyMainScreens(
                mainScreen: true,
                title: "المرتجعات",
                svgPath: "noun-pick-up-4160044",
                context: context,
                imageSize: 80.0,
              ),
              primary: true,
              resizeToAvoidBottomInset: false,
              backgroundColor: greyColor,
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 5.0),
                      child: TabBar(
                        labelStyle: lightTheme.textTheme.bodyText1!.copyWith(fontSize: 13.0,height: 1.8,fontWeight: FontWeight.bold),
                        enableFeedback: true,
                        physics: const BouncingScrollPhysics(),
                        labelPadding:
                        const EdgeInsets.symmetric(horizontal: 5.0),
                        labelColor: Colors.white,
                        unselectedLabelColor: purpleColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: purpleColor,
                        indicator: BoxDecoration(
                          border: Border.all(
                            color: purpleColor,
                          ),
                          color: purpleColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadiusDirectional.horizontal(
                            start: Radius.circular(10.0),
                            end: Radius.circular(10.0),
                          ),
                        ),
                        indicatorWeight: 0,
                        tabs: [
                          Container(
                            height: 70.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: purpleColor,
                                  width: 4.0
                              ),
                              borderRadius: BorderRadiusDirectional.horizontal(
                                start: Radius.circular(10.0),
                                end: Radius.circular(10.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                              child: Text(
                                "مرتجع جزئي للشحنة",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            height: 70.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: purpleColor,
                                  width: 4.0
                              ),
                              borderRadius: BorderRadiusDirectional.horizontal(
                                start: Radius.circular(10.0),
                                end: Radius.circular(10.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                              child: Text(
                                "مرتجع كامل مسدد قيمة الشحن",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            height: 70.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: purpleColor,
                                  width: 4.0
                              ),
                              borderRadius: BorderRadiusDirectional.horizontal(
                                start: Radius.circular(10.0),
                                end: Radius.circular(10.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                              child: Text(
                                "مرتجع كامل بدون تستديد قيمة الشحن",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            BouncePart(
                                shippingIsEmpty: false,
                                context: context),
                             BounceCompleteWithShipmentPay(shippingIsEmpty: false,context: context),
                             BounceCompleteWithOutShipmentPay(shippingIsEmpty: false,context: context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class BouncePart extends StatelessWidget {
  final bool shippingIsEmpty;
  final BuildContext context;

  const BouncePart({
    Key? key,
    required this.shippingIsEmpty,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = InjunctionsAppCubitClass.get(context);
    var appCubit = AppCubitClass.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsetsDirectional.only(start: 5),
                    height: 60,
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: purpleColor,
                        )),
                    child: TextFormField(
                      // controller: cubit.searchController,
                      // onChanged: (word) {
                      //   if (word.isEmpty) {
                      //     cubit.findAllMatchShipments();
                      //   }
                      // },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.shippingSearch3.tr(),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //cubit.findAllMatchShipments();
                      //cubit.checkIfWordExist();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: const BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(10.0),
                              topEnd: Radius.circular(10.0)),
                          border: Border.all(
                            width: 0.8,
                            color: purpleColor,
                          )),
                      child: const Icon(
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
        BlocConsumer<InjunctionsAppCubitClass, InjunctionsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Expanded(
              child: Padding(
                padding:
                const EdgeInsets.only(right: 10, left: 10, top: 40),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return DecoratedContainerWithShadow(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              CustomRowForDetails(
                                text1: LocaleKeys
                                    .walletScreenListItemDetails1
                                    .tr(),
                                text2: "5889523556",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "أسم العميل",
                                text2: "${appCubit.bouncePartShipmentsList[index]["client"]["name"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "العنوان",
                                text2:"${appCubit.bouncePartShipmentsList[index]["client"]["address"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: LocaleKeys
                                    .shippingListItemDetails6
                                    .tr(),
                                text2: "${appCubit.bouncePartShipmentsList[index]["created_at"]}",
                                //"${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).year}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).month}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).day}",
                                //"${DateTime.parse(dataList[index]["created_at"])}",
                              ),
                              CustomRowForDetails(
                                text1: "سعر المنتج",
                                text2: "${appCubit.bouncePartShipmentsList[index]["product_price"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "قيمة المرتجع",
                                text2: "${appCubit.bouncePartShipmentsList[index]["return_price"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "تكلفة الشحن",
                                text2: "${appCubit.bouncePartShipmentsList[index]["shipping_price"]}",
                                rowWidth: 230,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: appCubit.bouncePartShipmentsList.length,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class BounceCompleteWithShipmentPay extends StatelessWidget {
  final bool shippingIsEmpty;
  final BuildContext context;

  const BounceCompleteWithShipmentPay({
    Key? key,
    required this.shippingIsEmpty,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = InjunctionsAppCubitClass.get(context);
    var appCubit = AppCubitClass.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsetsDirectional.only(start: 5),
                    height: 60,
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: purpleColor,
                        )),
                    child: TextFormField(
                      // controller: cubit.searchController,
                      // onChanged: (word) {
                      //   if (word.isEmpty) {
                      //     cubit.findAllMatchShipments();
                      //   }
                      // },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.shippingSearch3.tr(),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //cubit.findAllMatchShipments();
                      //cubit.checkIfWordExist();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: const BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(10.0),
                              topEnd: Radius.circular(10.0)),
                          border: Border.all(
                            width: 0.8,
                            color: purpleColor,
                          )),
                      child: const Icon(
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
        BlocConsumer<InjunctionsAppCubitClass, InjunctionsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Expanded(
              child: Padding(
                padding:
                const EdgeInsets.only(right: 10, left: 10, top: 40),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return DecoratedContainerWithShadow(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              CustomRowForDetails(
                                text1: LocaleKeys
                                    .walletScreenListItemDetails1
                                    .tr(),
                                text2: "5889523556",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "أسم العميل",
                                text2: "${appCubit.bounceCompletePayShippingList[index]["client"]["name"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "العنوان",
                                text2:"${appCubit.bounceCompletePayShippingList[index]["client"]["address"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: LocaleKeys
                                    .shippingListItemDetails6
                                    .tr(),
                                text2: "${appCubit.bounceCompletePayShippingList[index]["created_at"]}",
                                //"${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).year}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).month}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).day}",
                                //"${DateTime.parse(dataList[index]["created_at"])}",
                              ),
                              CustomRowForDetails(
                                text1: "سعر المنتج",
                                text2: "${appCubit.bounceCompletePayShippingList[index]["product_price"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "قيمة المرتجع",
                                text2: "${appCubit.bounceCompletePayShippingList[index]["return_price"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "تكلفة الشحن",
                                text2: "${appCubit.bounceCompletePayShippingList[index]["shipping_price"]}",
                                rowWidth: 230,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: appCubit.bounceCompletePayShippingList.length,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class BounceCompleteWithOutShipmentPay extends StatelessWidget {
  final bool shippingIsEmpty;
  final BuildContext context;

  const BounceCompleteWithOutShipmentPay({
    Key? key,
    required this.shippingIsEmpty,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = InjunctionsAppCubitClass.get(context);
    var appCubit = AppCubitClass.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsetsDirectional.only(start: 5),
                    height: 60,
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: purpleColor,
                        )),
                    child: TextFormField(
                      // controller: cubit.searchController,
                      // onChanged: (word) {
                      //   if (word.isEmpty) {
                      //     cubit.findAllMatchShipments();
                      //   }
                      // },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.shippingSearch3.tr(),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //cubit.findAllMatchShipments();
                      //cubit.checkIfWordExist();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: const BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(10.0),
                              topEnd: Radius.circular(10.0)),
                          border: Border.all(
                            width: 0.8,
                            color: purpleColor,
                          )),
                      child: const Icon(
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
        BlocConsumer<InjunctionsAppCubitClass, InjunctionsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Expanded(
              child: Padding(
                padding:
                const EdgeInsets.only(right: 10, left: 10, top: 40),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return DecoratedContainerWithShadow(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              CustomRowForDetails(
                                text1: LocaleKeys
                                    .walletScreenListItemDetails1
                                    .tr(),
                                text2: "5889523556",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "أسم العميل",
                                text2: "${appCubit.bounceCompleteNotPayShippingList[index]["client"]["name"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "العنوان",
                                text2:"${appCubit.bounceCompleteNotPayShippingList[index]["client"]["address"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: LocaleKeys
                                    .shippingListItemDetails6
                                    .tr(),
                                text2: "${appCubit.bounceCompleteNotPayShippingList[index]["created_at"]}",
                                //"${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).year}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).month}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).day}",
                                //"${DateTime.parse(dataList[index]["created_at"])}",
                              ),
                              CustomRowForDetails(
                                text1: "سعر المنتج",
                                text2: "${appCubit.bounceCompleteNotPayShippingList[index]["product_price"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "قيمة المرتجع",
                                text2: "${appCubit.bounceCompleteNotPayShippingList[index]["return_price"]}",
                                rowWidth: 230,
                              ),
                              CustomRowForDetails(
                                text1: "تكلفة الشحن",
                                text2: "${appCubit.bounceCompleteNotPayShippingList[index]["shipping_price"]}",
                                rowWidth: 230,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: appCubit.bounceCompleteNotPayShippingList.length,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

