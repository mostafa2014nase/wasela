import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/comapny_app/app_layouts/ship/chats/chats_screen.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/cubit.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';

import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:wasela/translations/localeKeys.g.dart';

import 'follow_shipping.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShippingDetails extends StatelessWidget {
  final int index;
  final bool fromEnded;
  final List list;

  const ShippingDetails({Key? key, required this.index,this.fromEnded = false,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipForCompanyAppCubitClass, ShipStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShipForCompanyAppCubitClass.get(context);
          return Scaffold(
            appBar: generateAppBarForCompanyMainScreens(
              mainScreen: false,
              title: "تفاصيل الشحنة",
              svgPath: "MyShipping",
              context: context,
              textHeight: 2.0,
            ),
            primary: true,
            resizeToAvoidBottomInset: false,
            backgroundColor: greyColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              navigateAndBack(context, layout: ChatsScreen());
                            },
                            child: CustomDesignUnActive(
                              borderColor: purpleColor,
                              text: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "دردشة",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SvgPicture.asset(
                                    "Assets/images/noun-talk-4679128.svg",
                                    width: 50,
                                    height: 50,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              containerColor: purpleColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              myShowDialogForMarketing(
                                  context: context,
                                  alertDialog: CustomAlertDialogForMarketing(
                                    topPadding: 220.0,
                                    bottomSmallPicPadding: 525,
                                    bottomPicPadding: 525,
                                    bodyColor: purpleColor,
                                    backGroundImageColor: Colors.white,
                                    imageBackColor: purpleColor,
                                    topImage: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: SvgPicture.asset(
                                        "Assets/images/noun-complaint-2048408.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                    mainWidgetText: Column(
                                      children: [
                                        Text(
                                          "برجاء توضيح الشكوى الخاصة بك",
                                          style: lightTheme.textTheme.bodyText1
                                              ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                right: Radius.circular(10.0),
                                                left: Radius.circular(10.0),
                                              ),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15.0,
                                                horizontal: 10.0),
                                            child: TextFormField(
                                              textAlign: TextAlign.start,
                                              maxLines: 8,
                                              textAlignVertical:
                                                  TextAlignVertical.top,
                                              controller: cubit.complain,
                                              keyboardType: const TextInputType
                                                  .numberWithOptions(),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 10.0,
                                                        top: 20.0),
                                                fillColor: Colors.white,
                                                hintStyle: lightTheme
                                                    .textTheme.bodyText1
                                                    ?.copyWith(
                                                        color: textGreyColor,
                                                        fontSize: 20.0),
                                                hintText:
                                                    "أترك الشكوى الخاصه بك",
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                greyColortwoo,
                                                            width: 1.5),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .horizontal(
                                                          right:
                                                              Radius.circular(
                                                                  10.0),
                                                          left: Radius.circular(
                                                              10.0),
                                                        )),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              right: Radius.circular(10.0),
                                              left: Radius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: InkWell(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 40.0,
                                                        vertical: 5.0),
                                                child: Text(
                                                  "أرسال",
                                                  style: lightTheme
                                                      .textTheme.bodyText1
                                                      ?.copyWith(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    underWidget: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0, vertical: 20.0),
                                      child: Material(
                                        borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(10.0),
                                          left: Radius.circular(10.0),
                                        ),
                                        color: purpleColor,
                                        child: InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  LocaleKeys.callCenter.tr(),
                                                  style: lightTheme
                                                      .textTheme.bodyText1
                                                      ?.copyWith(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.end,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                SvgPicture.asset(
                                                  "Assets/images/headphones.svg",
                                                  width: 30,
                                                  height: 30,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                            child: CustomDesignUnActive(
                              borderColor: yellowColor,
                              text: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "شكاوي",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SvgPicture.asset(
                                    "Assets/images/noun-complaint-2048408.svg",
                                    width: 50,
                                    height: 50,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              containerColor: yellowColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15.0, left: 10.0, right: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              cubit.callPhone(phone: "01208834037");
                            },
                            child: CustomDesignUnActive(
                              borderColor: blueColor,
                              text: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(SharedCashHelper.getValue(key: "phoneCount")!= null ?
                                  "${SharedCashHelper.getValue(key: "phoneCount")}":" ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SvgPicture.asset(
                                    "Assets/images/noun-phone-4668781.svg",
                                    width: 40,
                                    height: 40,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              containerColor: blueColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              cubit.openWatsApp(phone: "01208834037");
                            },
                            child: CustomDesignUnActive(
                              borderColor: greenColor,
                              text: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(SharedCashHelper.getValue(key: "watsAppCount")!= null ?
                                    "${SharedCashHelper.getValue(key: "watsAppCount")}":" ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SvgPicture.asset(
                                    "Assets/images/noun-app-2465542.svg",
                                    width: 50,
                                    height: 50,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              containerColor: greenColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              cubit.sendSms(phone: "01208834037");
                            },
                            child: CustomDesignUnActive(
                              borderColor: orangeColor,
                              text: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(SharedCashHelper.getValue(key: "smsCount")!= null ?
                                  "${SharedCashHelper.getValue(key: "smsCount")}":" ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SvgPicture.asset(
                                    "Assets/images/noun-sms-1953496.svg",
                                    width: 50,
                                    height: 50,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              containerColor: orangeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        QrImage(
                          data: 'اسم التاجر :  ${AppCubitClass.get(context).companyModel!.name}, موبايل التاجر : ${AppCubitClass.get(context).companyModel!.phoneNumber}, اسم المرسل اليه : "${list[index]["client"]["name"]}" , موبايل المرسل اليه "${list[index]["client"]["phone"]}"',
                          version: QrVersions.auto,
                          size: 140,
                          gapless: false,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocConsumer<AppCubitClass, AppStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            //var appCubit = AppCubitClass.get(context);
                            var companyModel = AppCubitClass.get(context).companyModel;
                            var clientModel = AppCubitClass.get(context).clientModel;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomRowForDetails(
                                  text1: "اسم التاجر",
                                  text2: SaveValueInKey.userType=="client"?
                                  "${clientModel!.name}":"${companyModel!.name}",
                                  firstTextWidth: 90,
                                  rowWidth: 210,
                                ),
                                // CustomRowForDetails(
                                //   text1: "كود التاجر",
                                //   text2: "1250",
                                //   firstTextWidth: 90,
                                //   rowWidth: 210,
                                // ),
                                CustomRowForDetails(
                                  text1: "عنوان التاجر",
                                  text2: SaveValueInKey.userType=="client"?
                                  "${clientModel!.address}":"${companyModel!.address}",
                                  firstTextWidth: 90,
                                  rowWidth: 210,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10.0, left: 10.0, bottom: 15.0),
                    child: DecoratedContainerWithShadow(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                        .walletScreenListItemDetails2
                                        .tr(),
                                    text2:
                                        "${list[index]["total_shipment"]} جنيه",
                                  ),
                                  CustomRowForDetails(
                                    text1: LocaleKeys.shippingListItemDetails5
                                        .tr(),
                                    text2: "${list[index]["shipmentstatu"]["name"]}",
                                  ),
                                  CustomRowForDetails(
                                    text1: LocaleKeys.shippingListItemDetails6
                                        .tr(),
                                    text2: DateFormat("y/MM/dd").format(
                                        DateTime.parse(list[index]
                                            ["created_at"])),
                                  ),
                                  CustomRowForDetails(
                                    text1: LocaleKeys.shippingListItemDetails7
                                        .tr(),
                                    text2:list[index]["delivery_date"] !=null ?  "${list[index]["delivery_date"]}":"",
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    //cubit.getMyCurrentLocation();
                                    navigateAndBack(context,
                                        layout:
                                             FollowShippingOnMapScreen());
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 25.0,
                                        child: SvgPicture.asset(
                                          "Assets/images/placeholder.svg",
                                          color: yellowColor,
                                          width: 35,
                                          height: 35,
                                        ),
                                      ),
                                      const Text("تتبع"),
                                    ],
                                  ),
                                  // CustomContainerForDetails(
                                  //   text1:
                                  //       LocaleKeys.shippingListItemButton.tr(),
                                  //   icon: Icon(
                                  //     Icons.arrow_forward_ios,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          if(!fromEnded)
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 40),
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
                                cubit.controlStepper(list[index]["shipmentstatu"]["id"]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 15.0),
                      child: DecoratedContainerWithShadow(
                        child: CustomRowForDetails(
                          text1: "المرسل اليه",
                          text2: "${list[index]["client"]["name"]}",
                          firstTextWidth: 90,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 15.0),
                      child: DecoratedContainerWithShadow(
                        child: CustomRowForDetails(
                          text1: "العنوان",
                          text2:
                              "${list[index]["client"]["address"]}",
                          firstTextWidth: 70,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 130,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 15.0),
                      child: DecoratedContainerWithShadow(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.check_circle_outline),
                                        Text(
                                          "${list[index]["shipmentstatu"]["name"]}",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomRowForDetails(
                                  text1: "اسم المندوب",
                                  text2: "${list[index]["representative"]["name"]}",
                                  firstTextWidth: 100,
                                ),
                                CustomRowForDetails(
                                  text1: "رقم المندوب",
                                  text2:list[index]["representative"]["phone"] != null ? "${list[index]["representative"]["phone"]}":"",
                                  firstTextWidth: 100,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  end: 10.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("20/11/2022"),
                                  Text("AM 10:30"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(10.0),
                        left: Radius.circular(10.0),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      maxLines: 8,
                      textAlignVertical: TextAlignVertical.top,
                      controller: cubit.notes,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 20.0),
                        fillColor: Colors.white,
                        hintStyle: lightTheme.textTheme.bodyText1
                            ?.copyWith(color: textGreyColor, fontSize: 20.0),
                        hintText: "ملاحظاتك",
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: greyColortwoo, width: 1.5),
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(10.0),
                              left: Radius.circular(10.0),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    child: InkWell(
                      onTap: () {},
                      child: CustomDesignUnActive(
                        width: 200,
                        borderColor: purpleColor,
                        text: Text(
                          "أضف ملاحظتك",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        containerColor: purpleColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
