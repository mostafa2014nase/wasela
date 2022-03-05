import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class EvaluateScreen extends StatelessWidget {
  const EvaluateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: purpleColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
        children: [
          SvgPicture.asset(
            "Assets/images/wallet.svg",
            width: 40,
            height: 40,
            color: Colors.white,
          ),
          Text(
            LocaleKeys.shippingEvaluate.tr(),
            style: TextStyle(fontSize: 25, height: 1.5),
          ),
        ],
      ),
        leading: IconButton(
          onPressed: () {
            backToPrevious(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  size: 40,
                )),
          ),
        ],
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
                    fontWeight: FontWeight.bold, color: textGreyTwoColor,fontSize: 20),
              ),
              Text(
                LocaleKeys.evaluateScreen2.tr(),
                style: TextStyle(color: textGreyTwoColor,fontSize: 17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                    },
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

class ShowDialog extends StatelessWidget {
  const ShowDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
          color: purpleColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              //color: greyColor,
              spreadRadius: 1,
              blurRadius: 0.5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(),
      ),
    );
  }
}
