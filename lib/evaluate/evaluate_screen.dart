import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class EvaluateScreen extends StatelessWidget {
  final bool fromDrawer ;
  const EvaluateScreen({Key? key,required this.fromDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:generateAppBarForCompanyMainScreens(
        mainScreen: false,
        title: LocaleKeys.shippingEvaluate.tr(),
        svgPath: "wallet",
        context: context,
        textHeight: 2.0,
      ),
      body: Container(
        color: greyColor,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.evaluateScreen1.tr(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textGreyTwoColor,
                    fontSize: 20),
              ),
              Text(
                fromDrawer ?LocaleKeys.evaluateScreen2.tr():"ايه تقييمك للشحنة ده ؟",
                style: TextStyle(color: textGreyTwoColor, fontSize: 17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "Assets/images/crying.svg",
                            color: yellowColor,
                            width: 50,
                            height: 50,
                          ),
                          Text(LocaleKeys.evaluate1.tr()),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "Assets/images/happy1.svg",
                            color: yellowColor,
                            width: 50,
                            height: 50,
                          ),
                          Text(LocaleKeys.evaluate2.tr()),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "Assets/images/surprised1.svg",
                            color: yellowColor,
                            width: 50,
                            height: 50,
                          ),
                          Text(LocaleKeys.evaluate3.tr()),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myShowDialog(
                          context: context,
                          alertDialog: CustomAlertDialog(
                            mainWidgetText: Column(
                              children: [
                                Text(
                                  LocaleKeys.badDialog1.tr(),
                                  style:
                                      lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  LocaleKeys.badDialog2.tr(),
                                  style: lightTheme.textTheme.bodyText1
                                      ?.copyWith(
                                          fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            choiceMenu: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      child: MaterialButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      width: 50,
                                    ),
                                    Text(
                                      "تأخر توصيل الشحنات عن الموعد المحدد",
                                      style: lightTheme.textTheme.bodyText1
                                          ?.copyWith(
                                              fontSize: 15,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.check_box_outline_blank_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      width: 50,
                                    ),
                                    Text(
                                      "عدم التزام المندوب بأداب اللياقة والمعاملة",
                                      style: lightTheme.textTheme.bodyText1
                                          ?.copyWith(
                                              fontSize: 15,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: MaterialButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      width: 50,
                                    ),
                                    Text(
                                      "الشحنات تالفة",
                                      style: lightTheme.textTheme.bodyText1
                                          ?.copyWith(
                                              fontSize: 15,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: MaterialButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      width: 50,
                                    ),
                                    Text(
                                      "الأسئلة كلها هتبقي ديناميك من الداش بورد",
                                      style: lightTheme.textTheme.bodyText1
                                          ?.copyWith(
                                              fontSize: 15,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "Assets/images/sad1.svg",
                            color: yellowColor,
                            width: 50,
                            height: 50,
                          ),
                          Text(LocaleKeys.evaluate4.tr()),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myShowDialog(
                          context: context,
                          alertDialog: CustomAlertDialog(
                            mainWidgetText: Column(
                              children: [
                                Text(
                                  LocaleKeys.badDialog1.tr(),
                                  style:
                                      lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  LocaleKeys.badDialog2.tr(),
                                  style: lightTheme.textTheme.bodyText1
                                      ?.copyWith(
                                          fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            choiceMenu: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      child: MaterialButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      width: 50,
                                    ),
                                    Text(
                                      "تأخر توصيل الشحنات عن الموعد المحدد",
                                      style: lightTheme.textTheme.bodyText1
                                          ?.copyWith(
                                              fontSize: 15,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: MaterialButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      width: 50,
                                    ),
                                    Text(
                                      "عدم التزام المندوب بأداب اللياقة والمعاملة",
                                      style: lightTheme.textTheme.bodyText1
                                          ?.copyWith(
                                              fontSize: 15,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: MaterialButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      width: 50,
                                    ),
                                    Text(
                                      "الشحنات تالفة",
                                      style: lightTheme.textTheme.bodyText1
                                          ?.copyWith(
                                              fontSize: 15,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: MaterialButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      width: 50,
                                    ),
                                    Text(
                                      "الأسئلة كلها هتبقي ديناميك من الداش بورد",
                                      style: lightTheme.textTheme.bodyText1
                                          ?.copyWith(
                                              fontSize: 15,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "Assets/images/happynew1.svg",
                            color: yellowColor,
                            width: 50,
                            height: 50,
                          ),
                          Text(LocaleKeys.evaluate5.tr()),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

