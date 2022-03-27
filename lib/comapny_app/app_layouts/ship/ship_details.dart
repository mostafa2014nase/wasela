import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/comapny_app/app_layouts/ship/chats/chats_screen.dart';
import 'package:wasela/helper_methods/constants/themes.dart';

import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

import 'follow_shipping.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({Key? key}) : super(key: key);

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
              svgPath: "wallet",
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
                              navigateAndBack(context,layout: ChatsScreen());
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
                        SizedBox(
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
                                        Text("برجاء توضيح الشكوى الخاصة بك",style: lightTheme.textTheme.bodyText1?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),),
                                        Material(
                                          color: Colors.transparent,
                                          child: Container(
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
                                              controller: cubit.complain,
                                              keyboardType: const TextInputType.numberWithOptions(),
                                              decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0, top: 20.0),
                                                fillColor: Colors.white,
                                                hintStyle: lightTheme.textTheme.bodyText1
                                                    ?.copyWith(color: textGreyColor, fontSize: 20.0),
                                                hintText: "أترك الشكوى الخاصه بك",
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
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          child: Material(
                                            borderRadius: BorderRadius.horizontal(
                                              right: Radius.circular(10.0),
                                              left: Radius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: InkWell(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal:40.0 ,vertical: 5.0),
                                                child: Text(
                                                  "أرسال",
                                                  style: lightTheme.textTheme.bodyText1?.copyWith(
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
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 20.0),
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
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  LocaleKeys.callCenter.tr(),
                                                  style: lightTheme.textTheme.bodyText1?.copyWith(
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
                            onTap: () {},
                            child: CustomDesignUnActive(
                              borderColor: blueColor,
                              text: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "دردشة",
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
                            onTap: () {},
                            child: CustomDesignUnActive(
                              borderColor: greenColor,
                              text: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "شكاوي",
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
                            onTap: () {},
                            child: CustomDesignUnActive(
                              borderColor: orangeColor,
                              text: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "شكاوي",
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
                        SvgPicture.asset(
                          "Assets/images/noun-qr-1474708.svg",
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            CustomRowForDetails(
                              text1: "أسم التاجر",
                              text2: "سمر للملابس",
                              firstTextWidth: 90,
                              rowWidth: 210,
                            ),
                            CustomRowForDetails(
                              text1: "كود التاجر",
                              text2: "1250",
                              firstTextWidth: 90,
                              rowWidth: 210,
                            ),
                            CustomRowForDetails(
                              text1: "عنوان التاجر",
                              text2: "الهرم - 12 شارع",
                              firstTextWidth: 90,
                              rowWidth: 210,
                            ),
                          ],
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
                                    text1: LocaleKeys.shippingListItemDetails2
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
                                    text1: LocaleKeys.shippingListItemDetails4
                                        .tr(),
                                    text2: "1855",
                                  ),
                                  CustomRowForDetails(
                                    text1: LocaleKeys.shippingListItemDetails5
                                        .tr(),
                                    text2: "1855",
                                  ),
                                  CustomRowForDetails(
                                    text1: LocaleKeys.shippingListItemDetails6
                                        .tr(),
                                    text2: "1855",
                                  ),
                                  CustomRowForDetails(
                                    text1: LocaleKeys.shippingListItemDetails7
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
                                    navigateAndBack(context,
                                        layout: FollowShippingOnMapScreen());
                                  },
                                  child: CustomContainerForDetails(
                                    text1:
                                        LocaleKeys.shippingListItemButton.tr(),
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DoneCircularAvatar(
                                      underText:
                                          LocaleKeys.shippingQueSteps1.tr(),
                                    ),
                                    DoneCircularAvatar(
                                      underText:
                                          LocaleKeys.shippingQueSteps2.tr(),
                                    ),
                                    NotYetYellowContainer(
                                      underText:
                                          LocaleKeys.shippingQueSteps3.tr(),
                                    ),
                                    NotYetYellowContainer(
                                      underText:
                                          LocaleKeys.shippingQueSteps4.tr(),
                                    ),
                                    NotYetYellowContainer(
                                      underText:
                                          LocaleKeys.shippingQueSteps5.tr(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 15.0),
                      child: DecoratedContainerWithShadow(
                        child: CustomRowForDetails(
                          text1: "المرسل اليه",
                          text2: "مصطفي تركي",
                          firstTextWidth: 90,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 15.0),
                      child: DecoratedContainerWithShadow(
                        child: CustomRowForDetails(
                          text1: "العنوان",
                          text2: "حدائق الأهرام مجاورة 18 خلف الباب الكبير",
                          firstTextWidth: 70,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
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
                                      width: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.check_circle_outline),
                                            Text(
                                              "تسليم ناجح",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomRowForDetails(
                                      text1: "اسم المندوب",
                                      text2: "محمود محمد",
                                      firstTextWidth: 100,
                                      rowWidth: 200,
                                    ),
                                    CustomRowForDetails(
                                      text1: "رقم المندوب",
                                      text2: "12",
                                      firstTextWidth: 100,
                                      rowWidth: 200,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
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
                                      width: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.check_circle_outline),
                                            Text(
                                              "قيد التوصيل",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomRowForDetails(
                                      text1: "اسم المندوب",
                                      text2: "محمود محمد",
                                      firstTextWidth: 100,
                                      rowWidth: 200,
                                    ),
                                    CustomRowForDetails(
                                      text1: "رقم المندوب",
                                      text2: "12",
                                      firstTextWidth: 100,
                                      rowWidth: 200,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
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
                                      width: 150,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.check_circle_outline),
                                            Text(
                                              "تم الأستلام فى المخزن",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomRowForDetails(
                                      text1: "اسم أمين المخزن",
                                      text2: "محمود محمد",
                                      firstTextWidth: 120,
                                      rowWidth: 240,
                                    ),
                                    CustomRowForDetails(
                                      text1: "عنوان المخزن",
                                      text2: "رمسيس",
                                      firstTextWidth: 120,
                                      rowWidth: 240,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
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
                                      width: 150,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.check_circle_outline),
                                            Text(
                                              "تم الأستلام البيك أب",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomRowForDetails(
                                      text1: "اسم المندوب",
                                      text2: "محمود محمد",
                                      firstTextWidth: 100,
                                      rowWidth: 200,
                                    ),
                                    CustomRowForDetails(
                                      text1: "رقم المندوب",
                                      text2: "12",
                                      firstTextWidth: 100,
                                      rowWidth: 200,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
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
                    ],
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
