import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

import 'bloc/cubit_class.dart';
import 'bloc/states.dart';

class NotificationsForCompanyApp extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubitClass, NotificationStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotificationCubitClass.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: generateAppBar(
            title: LocaleKeys.bottomNavItemsName5.tr(),
            svgPath: "wallet",
            context: context,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 175,
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 40.0),
                      alignment: AlignmentDirectional.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(50.0),
                          left: Radius.circular(50.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "Assets/images/placeholder.svg",
                              color: Colors.black,
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              LocaleKeys.branches1.tr(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      )),
                ),
                Container(
                  color: greyColor,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Row(
                          children: [
                            TransportCustomDesign(
                              onTap: () {},
                              icon: const Icon(
                                Icons.account_balance_sharp,
                                color: Colors.white,
                                size: 80,
                              ),
                              containerColor: purpleColor,
                              paddingValue: 10,
                              borderRadius: 15,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "القاهرة",
                                    style: TextStyle(
                                        fontSize: 17, color: textGreyTwoColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "4 شارع عامر الدقي 24 شارع عامر الدقي ",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: textGreyColor,
                                            height: 1,
                                          ),
                                        ),
                                        Text(
                                          "4 شارع عامر الدقي 24 شارع عامر الدقي ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: textGreyColor,
                                              height: 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => put_line(
                      color: yellowColor,
                      line_width: 90,
                    ),
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
// Column(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 20.0, vertical: 20.0),
// child: Row(
// children: [
// TransportCustomDesign(
// onTap: () {},
// icon: const Icon(
// Icons.account_balance_sharp,
// color: Colors.white,
// size: 80,
// ),
// containerColor: purpleColor,
// paddingValue: 10,
// borderRadius: 15,
// ),
// const SizedBox(
// width: 20,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Text(
// "الشحنة من ",
// style: TextStyle(
// fontSize: 17, color: textGreyTwoColor),
// ),
// put_line(
// color: yellowColor,
// line_width: 90,
// ),
// Text(
// "القاهرة الجديدة",
// style: TextStyle(
// fontSize: 15, color: textGreyColor),
// ),
// ],
// ),
// const SizedBox(
// width: 20,
// ),
// Expanded(
// child: YellowButtonCustomDesign(
// height: 50,
// textSize: 20,
// text: "تعديل",
// inkwellFunc: () {},
// ),
// ),
// ],
// textDirection: TextDirection.rtl,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 20.0, vertical: 20.0),
// child: Row(
// children: [
// TransportCustomDesign(
// onTap: () {},
// icon: const Icon(
// Icons.account_balance_sharp,
// color: Colors.white,
// size: 80,
// ),
// containerColor: purpleColor,
// paddingValue: 10,
// borderRadius: 15,
// ),
// const SizedBox(
// width: 20,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Text(
// "الشحنة الي",
// style: TextStyle(
// fontSize: 17, color: textGreyTwoColor),
// ),
// put_line(
// color: yellowColor,
// line_width: 90,
// ),
// Text(
// "القاهرة الجديدة",
// style: TextStyle(
// fontSize: 15, color: textGreyColor),
// ),
// ],
// ),
// const SizedBox(
// width: 20,
// ),
// Expanded(
// child: YellowButtonCustomDesign(
// height: 50,
// textSize: 20,
// text: "تعديل",
// inkwellFunc: () {},
// ),
// ),
// ],
// textDirection: TextDirection.rtl,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 20.0, vertical: 20.0),
// child: Row(
// children: [
// TransportCustomDesign(
// onTap: () {},
// icon: const Icon(
// Icons.account_balance_sharp,
// color: Colors.white,
// size: 80,
// ),
// containerColor: purpleColor,
// paddingValue: 10,
// borderRadius: 15,
// ),
// const SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Text(
// "نوع الشحنة",
// style: TextStyle(
// fontSize: 17, color: textGreyTwoColor),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20.0),
// child: Column(
// children: [
// Text(
// "طرد 50 كيلو",
// style: TextStyle(
// fontSize: 15, color: textGreyColor,height: 1,),
// ),
// Text(
// "طرد 50 كيلو",
// style: TextStyle(
// fontSize: 15, color: textGreyColor,height: 1),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// textDirection: TextDirection.rtl,
// ),
// ),
// ],
// ),
