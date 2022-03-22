import 'package:easy_localization/easy_localization.dart';
import 'package:wasela/comapny_app/app_layouts/injunction/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/injunction/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class InjunctionsScreenForCompanyApp extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InjunctionsAppCubitClass, InjunctionsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //var cubit = InjunctionsAppCubitClass.get(context);
        return Scaffold(
          backgroundColor: greyColor,
          appBar: generateAppBarForCompanyMainScreens(
            mainScreen: true,
            title: "التلسيمات",
            svgPath: "noun-pick-up-4160044",
            context: context,
            imageSize: 80.0,

          ),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الأستلامات",
                        style: TextStyle(
                          color: purpleColor,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          put_line(
                            line_height: 5.0,
                            color: yellowColor,
                            line_width: 100.0,
                          ),
                          Expanded(
                            child: put_line(
                              line_height: 5.0,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
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
                                  padding: EdgeInsetsDirectional.only(start: 5),
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
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
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
                                  child: const Expanded(
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
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return DecoratedContainerWithShadow(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                      // navigateAndBack(
                                      //     context,
                                      //     layout:
                                      //     FollowShippingOnMapScreen());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 5.0),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: const CustomContainerForDetails(
                                        text1: "تفاصيل",
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
