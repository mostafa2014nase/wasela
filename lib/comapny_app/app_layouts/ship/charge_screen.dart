import 'dart:developer';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/comapny_app/app_layouts/ship/edit_shipment.dart';
import 'package:wasela/comapny_app/app_layouts/ship/ship_details.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class ShipScreenForCompanyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipForCompanyAppCubitClass, ShipStates>(
        listener: (context, state) {
      if (state is GetSpecificShipmentDataSuccessState) {
        navigateAndBack(context, layout: EditShipmentData());
      }
    }, builder: (context, state) {
      var cubit = ShipForCompanyAppCubitClass.get(context);
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: generateAppBarForCompanyMainScreens(
            mainScreen: true,
            title: LocaleKeys.bottomNavItemsName4.tr(),
            svgPath: "MyShipping",
            context: context,
            textHeight: 2.0,
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
                  labelPadding: const EdgeInsets.only(top: 25.0, bottom: 10),
                  labelStyle: lightTheme.textTheme.bodyText1!
                      .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                  unselectedLabelColor: textGreyTwoColor,
                  labelColor: purpleColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: yellowColor,
                  indicatorWeight: 6,
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
                      physics: const BouncingScrollPhysics(),
                      children: [
                        state is GetAllShipmentsDataSuccessState &&
                                cubit.tempList.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "Assets/images/noun-not-found-2503986.svg",
                                    width: 350.0,
                                    height: 350.0,
                                    color: textGreyColor,
                                  ),
                                  Text(
                                    "لا توجد شحنات حاليا",
                                    style: TextStyle(
                                      color: purpleColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      height: 0.0,
                                    ),
                                  ),
                                ],
                              )
                            : CurrentShipping(
                                shippingIsEmpty: false,
                                context: context),
                        state is GetAllShipmentsDataSuccessState &&
                            cubit.sentList.isEmpty
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "Assets/images/noun-not-found-2503986.svg",
                              width: 350.0,
                              height: 350.0,
                              color: textGreyColor,
                            ),
                            Text(
                              "لا توجد شحنات مرسلة حتى الان",
                              style: TextStyle(
                                color: purpleColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                height: 0.0,
                              ),
                            ),
                          ],
                        )
                            : const SentShipping(shippingIsEmpty: false),
                        state is GetAllShipmentsDataSuccessState &&
                            cubit.endedList.isEmpty
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "Assets/images/noun-not-found-2503986.svg",
                              width: 350.0,
                              height: 350.0,
                              color: textGreyColor,
                            ),
                            Text(
                              "لا توجد شحنات منتهية حتى الان",
                              style: TextStyle(
                                color: purpleColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                height: 0.0,
                              ),
                            ),
                          ],
                        )
                            : const EndedShipping(shippingIsEmpty: false),
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

class CurrentShipping extends StatelessWidget {
  final bool shippingIsEmpty;
  final BuildContext context;


   CurrentShipping({
    Key? key,
    required this.shippingIsEmpty,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipForCompanyAppCubitClass, ShipStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShipForCompanyAppCubitClass.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        onCancel: () {
                          cubit.resetFromDate();
                          cubit.findAllMatchShipments();
                        },
                        minTime: DateTime(2020, 1, 1),
                        maxTime: DateTime(2024, 1, 1),
                        onChanged: (formDate) {
                          log('change $formDate');
                        },
                        onConfirm: (formDate) {
                          //cubit.stringFromDate =DateFormat("y/MM/dd").format(formDate);
                          cubit.getFromDate(myDate: formDate);
                          cubit.findAllMatchShipments();
                        },
                        currentTime: DateTime.now(),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 55.0,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 0.8,
                            color: purpleColor,
                          )),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: cubit.stringFromDate == ""
                              ? Row(
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
                                )
                              : Text(
                                  DateFormat("y/MM/dd").format(cubit.fromDate!),
                                  style: TextStyle(
                                      color: purpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                )),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        onCancel: () {
                          cubit.resetToDate();
                          cubit.findAllMatchShipments();
                        },
                        minTime: DateTime(2020, 1, 1),
                        maxTime: DateTime(2024, 1, 1),
                        onChanged: (toDate) {
                          log('change $toDate');
                        },
                        onConfirm: (toDate) {
                          //cubit.stringToDate =DateFormat("y/MM/dd").format(toDate);
                          cubit.getToDate(myDate: toDate);
                          cubit.findAllMatchShipments();
                        },
                        currentTime: DateTime.now(),
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 55.0,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 0.8,
                            color: purpleColor,
                          )),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: cubit.stringToDate == ""
                              ? Row(
                                  children: [
                                    Text(
                                      LocaleKeys.shippingSearch2.tr(),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.calendar_today,
                                      color: purpleColor,
                                    ),
                                  ],
                                )
                              : Text(
                                  DateFormat("y/MM/dd").format(cubit.toDate!),
                                  style: TextStyle(
                                      color: purpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                )),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          padding: const EdgeInsetsDirectional.only(start: 5),
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: purpleColor,
                              )),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            controller: cubit.searchController,
                            onChanged: (word) {
                              if (word.isEmpty) {
                                cubit.findAllMatchShipments();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "بحث (بوليصة - موبايل - اسم )",
                              hintStyle: lightTheme.textTheme.bodyText1!
                                  .copyWith(fontSize: 14.0),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cubit.findAllMatchShipments();
                          },
                          child: Container(
                            width: 30,
                            height: 55,
                            decoration: BoxDecoration(
                                color: purpleColor,
                                borderRadius:
                                    const BorderRadiusDirectional.only(
                                        bottomEnd: Radius.circular(10.0),
                                        topEnd: Radius.circular(10.0)),
                                border: Border.all(
                                  width: 0.8,
                                  color: purpleColor,
                                )),
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
              ConditionalBuilder(
                  condition: state is GetAllMatchedShipmentsDataLoadingState,
                  builder: (context) {
                    return const Center(child: LinearProgressIndicator());
                  },
                  fallback: (context) {
                    return ConditionalBuilder(
                        condition: state is GetAllShipmentsDataLoadingState,
                        builder: (context) {
                          return Column(
                            children: const [
                              SizedBox(
                                height: 100.0,
                              ),
                              Center(child: CircularProgressIndicator()),
                            ],
                          );
                        },
                        fallback: (context) {
                          return ConditionalBuilder(
                            condition: state
                                    is GetAllMatchedShipmentsDataSuccessState &&
                                cubit.tempList.isEmpty ,
                            builder: (context) {
                              return const Center(
                                  child: Text("لاتوجد شحنات بهذه البيانات"));
                            },
                            fallback: (context) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 40),
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return DecoratedContainerWithShadow(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                      text1: "أسم المرسل اليه",
                                                      text2: cubit.tempList[index]
                                                          ["client"]["name"],
                                                      rowWidth: 230,
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .walletScreenListItemDetails2
                                                          .tr(),
                                                      text2:
                                                          "${cubit.tempList[index]["total_shipment"]} جنيه",
                                                      rowWidth: 230,
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .shippingListItemDetails5
                                                          .tr(),
                                                      text2: "${cubit.tempList[index]["shipmentstatu"]["name"]}",
                                                      rowWidth: 230,
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .shippingListItemDetails6
                                                          .tr(),
                                                      text2: DateFormat(
                                                              "y/MM/dd")
                                                          .format(DateTime
                                                              .parse(cubit.tempList[
                                                                      index][
                                                                  "created_at"])),
                                                      //"${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).year}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).month}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).day}",
                                                      //"${DateTime.parse(dataList[index]["created_at"])}",
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .shippingListItemDetails7
                                                          .tr(),
                                                      text2:cubit.tempList[index]["delivery_date"]!=null?
                                                      DateFormat(
                                                          "y/MM/dd")
                                                          .format(DateTime
                                                          .parse(cubit.tempList[
                                                      index][
                                                      "delivery_date"])):"",
                                                      rowWidth: 230,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0,
                                                          vertical: 8.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          cubit.detailedClicked(
                                                              index);
                                                        },
                                                        child: SvgPicture.asset(
                                                          "Assets/images/menu.svg",
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                      ),
                                                    ),
                                                    cubit.isDetailed[index]
                                                        ? Container(
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          5.0,
                                                                      vertical:
                                                                          10.0),
                                                                  child: InkWell(
                                                                      onTap: () {
                                                                        navigateAndBack(
                                                                            context,
                                                                            layout:
                                                                                ShippingDetails(
                                                                              index: index,
                                                                                  list: cubit.tempList,
                                                                            ));
                                                                        cubit.resetFalse(
                                                                            index);
                                                                      },
                                                                      child: Row(
                                                                        children: [
                                                                          Text(
                                                                            "تفاصيل",
                                                                            style:
                                                                                TextStyle(color: purpleColor),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          Icon(
                                                                            Icons.info,
                                                                            color:
                                                                                purpleColor,
                                                                          ),
                                                                        ],
                                                                      )),
                                                                ),
                                                                put_line(
                                                                    line_width:
                                                                        80.0),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          5.0,
                                                                      vertical:
                                                                          10.0),
                                                                  child: InkWell(
                                                                      onTap: () {
                                                                        //log(cubit.tempList[index]["id"].toString());
                                                                        cubit.getSpecificShipmentData(
                                                                            shipmentId:
                                                                                cubit.tempList[index]["id"]);
                                                                        cubit
                                                                            .getAllCitiesAndTheirAreas();
                                                                        cubit.getServiceType(
                                                                            index);
                                                                      },
                                                                      child: Row(
                                                                        children: [
                                                                          Text(
                                                                            "تعديل",
                                                                            style:
                                                                                TextStyle(color: purpleColor),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          Icon(
                                                                            Icons.edit,
                                                                            color:
                                                                                purpleColor,
                                                                          ),
                                                                        ],
                                                                      )),
                                                                ),
                                                              ],
                                                            ),
                                                            margin:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              border:
                                                                  Border.all(
                                                                width: 0.8,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          )
                                                        : const Text(""),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 40),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  const SizedBox(
                                                    child: MySeparator(
                                                      color: Colors.red,
                                                      height: 1.7,
                                                    ),
                                                    width: 300,
                                                  ),
                                                  cubit.controlStepper(cubit.tempList[index]["shipmentstatu"]["id"]),
                                                ],
                                              ),
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
                                    itemCount: cubit.tempList.length,
                                  ),
                                ),
                              );
                            },
                          );
                        });
                  }),
            ],
          );
        });
  }
}

class SentShipping extends StatelessWidget {
  final bool shippingIsEmpty;

  const SentShipping({Key? key, required this.shippingIsEmpty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipForCompanyAppCubitClass, ShipStates>(
        listener: (context, state) {},
    builder: (context, state) {
      var cubit = ShipForCompanyAppCubitClass.get(context);
     return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
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
                            style: const TextStyle(fontSize: 12),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.calendar_today,
                            color: purpleColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
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
                            style: const TextStyle(fontSize: 12),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.calendar_today,
                            color: purpleColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          padding: const EdgeInsetsDirectional.only(start: 5),
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: purpleColor,
                              )),
                          child: Text(
                            LocaleKeys.shippingSearch3.tr(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: const BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(10.0),
                                  topEnd: Radius.circular(10.0)),
                              border: Border.all(
                                width: 0.8,
                                color: purpleColor,
                              )),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ConditionalBuilder(
                  condition: state is GetAllMatchedShipmentsDataLoadingState,
                  builder: (context) {
                    return const Center(child: LinearProgressIndicator());
                  },
                  fallback: (context) {
                    return ConditionalBuilder(
                        condition: state is GetAllShipmentsDataLoadingState,
                        builder: (context) {
                          return Column(
                            children: const [
                              SizedBox(
                                height: 100.0,
                              ),
                              Center(child: CircularProgressIndicator()),
                            ],
                          );
                        },
                        fallback: (context) {
                          return ConditionalBuilder(
                            condition: state
                            is GetAllMatchedShipmentsDataSuccessState &&
                                cubit.sentList.isEmpty,
                            builder: (context) {
                              return const Center(
                                  child: Text("لاتوجد شحنات بهذه البيانات"));
                            },
                            fallback: (context) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 40),
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return DecoratedContainerWithShadow(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                      text1: "أسم المرسل اليه",
                                                      text2: cubit.sentList[index]
                                                      ["client"]["name"],
                                                      rowWidth: 230,
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .walletScreenListItemDetails2
                                                          .tr(),
                                                      text2:
                                                      "${cubit.sentList[index]["total_shipment"]} جنيه",
                                                      rowWidth: 230,
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .shippingListItemDetails5
                                                          .tr(),
                                                      text2: "${cubit.sentList[index]["shipmentstatu"]["name"]}",
                                                      rowWidth: 230,
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .shippingListItemDetails6
                                                          .tr(),
                                                      text2: DateFormat(
                                                          "y/MM/dd")
                                                          .format(DateTime
                                                          .parse(cubit.sentList[
                                                      index][
                                                      "created_at"])),
                                                      //"${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).year}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).month}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).day}",
                                                      //"${DateTime.parse(dataList[index]["created_at"])}",
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .shippingListItemDetails7
                                                          .tr(),
                                                      text2:cubit.sentList[index]["delivery_date"]!=null?
                                                      DateFormat(
                                                          "y/MM/dd")
                                                          .format(DateTime
                                                          .parse(cubit.sentList[
                                                      index][
                                                      "delivery_date"])):"",
                                                      rowWidth: 230,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8.0,
                                                          vertical: 8.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          cubit.detailedClickedSent(
                                                              index);
                                                        },
                                                        child: SvgPicture.asset(
                                                          "Assets/images/menu.svg",
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                      ),
                                                    ),
                                                    cubit.isDetailedSent[index]
                                                        ? Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal:
                                                            5.0,
                                                            vertical:
                                                            10.0),
                                                        child: InkWell(
                                                            onTap: () {
                                                              navigateAndBack(
                                                                  context,
                                                                  layout:
                                                                  ShippingDetails(
                                                                    index: index,
                                                                    list: cubit.sentList,
                                                                  ));
                                                              cubit.resetFalse(
                                                                  index);
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "تفاصيل",
                                                                  style:
                                                                  TextStyle(color: purpleColor),
                                                                ),
                                                                const SizedBox(
                                                                  width:
                                                                  2.0,
                                                                ),
                                                                Icon(
                                                                  Icons.info,
                                                                  color:
                                                                  purpleColor,
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                      margin:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal:
                                                          10.0),
                                                      decoration:
                                                      BoxDecoration(
                                                        color:
                                                        Colors.white,
                                                        border:
                                                        Border.all(
                                                          width: 0.8,
                                                          color: Colors
                                                              .black,
                                                        ),
                                                      ),
                                                    )
                                                        : const Text(""),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 40),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  const SizedBox(
                                                    child: MySeparator(
                                                      color: Colors.red,
                                                      height: 1.7,
                                                    ),
                                                    width: 300,
                                                  ),
                                                  cubit.controlStepper(cubit.sentList[index]["shipmentstatu"]["id"]),
                                                  // Row(
                                                  //   mainAxisAlignment:
                                                  //       MainAxisAlignment
                                                  //           .spaceBetween,
                                                  //   children: [
                                                  //     DoneCircularAvatar(
                                                  //       underText: LocaleKeys
                                                  //           .shippingQueSteps1
                                                  //           .tr(),
                                                  //     ),
                                                  //     DoneCircularAvatar(
                                                  //       underText: LocaleKeys
                                                  //           .shippingQueSteps2
                                                  //           .tr(),
                                                  //     ),
                                                  //     NotYetYellowContainer(
                                                  //       underText: LocaleKeys
                                                  //           .shippingQueSteps3
                                                  //           .tr(),
                                                  //     ),
                                                  //     NotYetYellowContainer(
                                                  //       underText: LocaleKeys
                                                  //           .shippingQueSteps4
                                                  //           .tr(),
                                                  //     ),
                                                  //     NotYetYellowContainer(
                                                  //       underText: LocaleKeys
                                                  //           .shippingQueSteps5
                                                  //           .tr(),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
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
                                    itemCount: cubit.sentList.length,
                                  ),
                                ),
                              );
                            },
                          );
                        });
                  }),
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 10, left: 10, top: 40),
              //     child: ListView.separated(
              //       physics: const BouncingScrollPhysics(),
              //       itemBuilder: (context, index) {
              //         return DecoratedContainerWithShadow(
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Row(
              //                 children: [
              //                   Column(
              //                     children: [
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys
              //                             .walletScreenListItemDetails1
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys.shippingListItemDetails2
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys
              //                             .walletScreenListItemDetails2
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys.shippingListItemDetails4
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys.shippingListItemDetails5
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys.shippingListItemDetails6
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys.shippingListItemDetails7
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //               Padding(
              //                 padding:
              //                     const EdgeInsets.only(top: 10, bottom: 40),
              //                 child: Stack(
              //                   alignment: Alignment.center,
              //                   children: [
              //                     const SizedBox(
              //                       child: MySeparator(
              //                         color: Colors.red,
              //                         height: 1.7,
              //                       ),
              //                       width: 300,
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         DoneCircularAvatar(
              //                           underText:
              //                               LocaleKeys.shippingQueSteps1.tr(),
              //                         ),
              //                         DoneCircularAvatar(
              //                           underText:
              //                               LocaleKeys.shippingQueSteps2.tr(),
              //                         ),
              //                         NotYetYellowContainer(
              //                           underText:
              //                               LocaleKeys.shippingQueSteps3.tr(),
              //                         ),
              //                         NotYetYellowContainer(
              //                           underText:
              //                               LocaleKeys.shippingQueSteps4.tr(),
              //                         ),
              //                         NotYetYellowContainer(
              //                           underText:
              //                               LocaleKeys.shippingQueSteps5.tr(),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         );
              //       },
              //       separatorBuilder: (context, index) {
              //         return const SizedBox(
              //           height: 20,
              //         );
              //       },
              //       itemCount: 10,
              //     ),
              //   ),
              // )
            ],
          );});
        // : Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       SvgPicture.asset(
        //         "Assets/images/noun-not-found-2503986.svg",
        //         width: 350.0,
        //         height: 350.0,
        //         color: textGreyColor,
        //       ),
        //       Text(
        //         "لا توجد شحنات حاليا",
        //         style: TextStyle(
        //           color: purpleColor,
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //           height: 0.0,
        //         ),
        //       ),
        //     ],
        //   );
  }
}

class EndedShipping extends StatelessWidget {
  final bool shippingIsEmpty;

  const EndedShipping({Key? key, required this.shippingIsEmpty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipForCompanyAppCubitClass, ShipStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShipForCompanyAppCubitClass.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
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
                            style: const TextStyle(fontSize: 12),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.calendar_today,
                            color: purpleColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
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
                            style: const TextStyle(fontSize: 12),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.calendar_today,
                            color: purpleColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          padding: const EdgeInsetsDirectional.only(start: 5),
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: purpleColor,
                              )),
                          child: Text(
                            LocaleKeys.shippingSearch3.tr(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: const BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(10.0),
                                  topEnd: Radius.circular(10.0)),
                              border: Border.all(
                                width: 0.8,
                                color: purpleColor,
                              )),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ConditionalBuilder(
                  condition: state is GetAllMatchedShipmentsDataLoadingState,
                  builder: (context) {
                    return const Center(child: LinearProgressIndicator());
                  },
                  fallback: (context) {
                    return ConditionalBuilder(
                        condition: state is GetAllShipmentsDataLoadingState,
                        builder: (context) {
                          return Column(
                            children: const [
                              SizedBox(
                                height: 100.0,
                              ),
                              Center(child: CircularProgressIndicator()),
                            ],
                          );
                        },
                        fallback: (context) {
                          return ConditionalBuilder(
                            condition: state
                            is GetAllMatchedShipmentsDataSuccessState &&
                                cubit.endedList.isEmpty,
                            builder: (context) {
                              return const Center(
                                  child: Text("لاتوجد شحنات بهذه البيانات"));
                            },
                            fallback: (context) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 40),
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return DecoratedContainerWithShadow(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                      text1: "أسم المرسل اليه",
                                                      text2: cubit.endedList[index]
                                                      ["client"]["name"],
                                                      rowWidth: 230,
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .walletScreenListItemDetails2
                                                          .tr(),
                                                      text2:
                                                      "${cubit.endedList[index]["total_shipment"]} جنيه",
                                                      rowWidth: 230,
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .shippingListItemDetails5
                                                          .tr(),
                                                      text2: "${cubit.endedList[index]["shipmentstatu"]["name"]}",
                                                      rowWidth: 230,
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .shippingListItemDetails6
                                                          .tr(),
                                                      text2: DateFormat(
                                                          "y/MM/dd")
                                                          .format(DateTime
                                                          .parse(cubit.endedList[
                                                      index][
                                                      "created_at"])),
                                                      //"${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).year}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).month}-${DateFormat("yyyy-MM-dd").parse(dataList[index]["created_at"]).day}",
                                                      //"${DateTime.parse(dataList[index]["created_at"])}",
                                                    ),
                                                    CustomRowForDetails(
                                                      text1: LocaleKeys
                                                          .shippingListItemDetails7
                                                          .tr(),
                                                      text2:cubit.endedList[index]["delivery_date"]!=null?
                                                      DateFormat(
                                                          "y/MM/dd")
                                                          .format(DateTime
                                                          .parse(cubit.endedList[
                                                      index][
                                                      "delivery_date"])):"",
                                                      rowWidth: 230,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8.0,
                                                          vertical: 8.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          cubit.detailedClickedEnded(
                                                              index);
                                                        },
                                                        child: SvgPicture.asset(
                                                          "Assets/images/menu.svg",
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                      ),
                                                    ),
                                                    cubit.isDetailedEnded[index]
                                                        ? Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal:
                                                            5.0,
                                                            vertical:
                                                            10.0),
                                                        child: InkWell(
                                                            onTap: () {
                                                              navigateAndBack(
                                                                  context,
                                                                  layout:
                                                                  ShippingDetails(
                                                                    index: index,
                                                                    list: cubit.endedList,
                                                                    fromEnded: true,
                                                                  ));
                                                              cubit.resetFalse(
                                                                  index);
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "تفاصيل",
                                                                  style:
                                                                  TextStyle(color: purpleColor),
                                                                ),
                                                                const SizedBox(
                                                                  width:
                                                                  2.0,
                                                                ),
                                                                Icon(
                                                                  Icons.info,
                                                                  color:
                                                                  purpleColor,
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                      margin:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal:
                                                          10.0),
                                                      decoration:
                                                      BoxDecoration(
                                                        color:
                                                        Colors.white,
                                                        border:
                                                        Border.all(
                                                          width: 0.8,
                                                          color: Colors
                                                              .black,
                                                        ),
                                                      ),
                                                    )
                                                        : const Text(""),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       top: 10, bottom: 40),
                                            //   child: Stack(
                                            //     alignment: Alignment.center,
                                            //     children: [
                                            //       const SizedBox(
                                            //         child: MySeparator(
                                            //           color: Colors.red,
                                            //           height: 1.7,
                                            //         ),
                                            //         width: 300,
                                            //       ),
                                            //       cubit.controlStepper(cubit.sentList[index]["shipmentstatu"]["id"]),
                                            //       // Row(
                                            //       //   mainAxisAlignment:
                                            //       //       MainAxisAlignment
                                            //       //           .spaceBetween,
                                            //       //   children: [
                                            //       //     DoneCircularAvatar(
                                            //       //       underText: LocaleKeys
                                            //       //           .shippingQueSteps1
                                            //       //           .tr(),
                                            //       //     ),
                                            //       //     DoneCircularAvatar(
                                            //       //       underText: LocaleKeys
                                            //       //           .shippingQueSteps2
                                            //       //           .tr(),
                                            //       //     ),
                                            //       //     NotYetYellowContainer(
                                            //       //       underText: LocaleKeys
                                            //       //           .shippingQueSteps3
                                            //       //           .tr(),
                                            //       //     ),
                                            //       //     NotYetYellowContainer(
                                            //       //       underText: LocaleKeys
                                            //       //           .shippingQueSteps4
                                            //       //           .tr(),
                                            //       //     ),
                                            //       //     NotYetYellowContainer(
                                            //       //       underText: LocaleKeys
                                            //       //           .shippingQueSteps5
                                            //       //           .tr(),
                                            //       //     ),
                                            //       //   ],
                                            //       // ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 20,
                                      );
                                    },
                                    itemCount: cubit.endedList.length,
                                  ),
                                ),
                              );
                            },
                          );
                        });
                  }),
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 10, left: 10, top: 40),
              //     child: ListView.separated(
              //       physics: const BouncingScrollPhysics(),
              //       itemBuilder: (context, index) {
              //         return DecoratedContainerWithShadow(
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Row(
              //                 children: [
              //                   Column(
              //                     children: [
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys
              //                             .walletScreenListItemDetails1
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys.shippingListItemDetails2
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys
              //                             .walletScreenListItemDetails2
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys.shippingListItemDetails4
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys.shippingListItemDetails5
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys.shippingListItemDetails6
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                       CustomRowForDetails(
              //                         text1: LocaleKeys.shippingListItemDetails7
              //                             .tr(),
              //                         text2: "1855",
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //               Padding(
              //                 padding:
              //                     const EdgeInsets.only(top: 10, bottom: 40),
              //                 child: Stack(
              //                   alignment: Alignment.center,
              //                   children: [
              //                     const SizedBox(
              //                       child: MySeparator(
              //                         color: Colors.red,
              //                         height: 1.7,
              //                       ),
              //                       width: 300,
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         DoneCircularAvatar(
              //                           underText:
              //                               LocaleKeys.shippingQueSteps1.tr(),
              //                         ),
              //                         DoneCircularAvatar(
              //                           underText:
              //                               LocaleKeys.shippingQueSteps2.tr(),
              //                         ),
              //                         NotYetYellowContainer(
              //                           underText:
              //                               LocaleKeys.shippingQueSteps3.tr(),
              //                         ),
              //                         NotYetYellowContainer(
              //                           underText:
              //                               LocaleKeys.shippingQueSteps4.tr(),
              //                         ),
              //                         NotYetYellowContainer(
              //                           underText:
              //                               LocaleKeys.shippingQueSteps5.tr(),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         );
              //       },
              //       separatorBuilder: (context, index) {
              //         return const SizedBox(
              //           height: 20,
              //         );
              //       },
              //       itemCount: 10,
              //     ),
              //   ),
              // )
            ],
          );});
  }
}
