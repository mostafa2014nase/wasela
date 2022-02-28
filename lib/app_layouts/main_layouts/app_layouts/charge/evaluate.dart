import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

class EvaluateScreen extends StatelessWidget {
  const EvaluateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "تقييم الشحنة",
              style: TextStyle(fontSize: 25, height: 1.5),
            ),
          ],
        ),
      ),
      body: Container(
        color: greyColor,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "شريك نجاح.... دائما معانا ",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: textGreyTwoColor),
              ),
              Text(
                "ايه رأيك فى خدمات الشحن عندنا ؟",
                textAlign: TextAlign.end,
                style: TextStyle(color: textGreyTwoColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
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
                          Text("ممتازة"),
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
                          Text("جيدة جدا"),
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
                          Text("جيدة"),
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
                                  "نأسف جدا لسماع ذلك من حضرتك",
                                  style:
                                  lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  "برجاء توضيح سبب هذا التقييم",
                                  style: lightTheme.textTheme.bodyText1
                                      ?.copyWith(
                                      fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            choiceMenu: Column(
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
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
                                  textDirection: TextDirection.rtl,
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
                                  textDirection: TextDirection.rtl,
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
                                  textDirection: TextDirection.rtl,
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
                          Text("سيئة"),
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
                                  "نأسف جدا لسماع ذلك من حضرتك",
                                  style:
                                  lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  "برجاء توضيح سبب هذا التقييم",
                                  style: lightTheme.textTheme.bodyText1
                                      ?.copyWith(
                                      fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            choiceMenu: Column(
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
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
                                  textDirection: TextDirection.rtl,
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
                                  textDirection: TextDirection.rtl,
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
                                  textDirection: TextDirection.rtl,
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
                          Text("سيئة جدا"),
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
