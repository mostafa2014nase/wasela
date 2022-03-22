import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class FollowShippingOnMapScreen extends StatelessWidget {
  const FollowShippingOnMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      appBar: AppBar(
        toolbarHeight: 140,
        backgroundColor: purpleColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            SvgPicture.asset(
              "Assets/images/track.svg",
              width: 40,
              height: 40,
              color: Colors.white,
            ),
            Text(
              LocaleKeys.followShippingAddress.tr(),
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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Container(
                color: purpleColor,
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                  left: 10.0,
                  bottom: 20.0,
                  top: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "Assets/images/telephone.svg",
                              width: 30,
                              height: 30,
                              color: purpleColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "مصطفى نصر",
                              style: lightTheme.textTheme.bodyText1?.copyWith(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "Assets/images/headphones.svg",
                              width: 30,
                              height: 30,
                              color: purpleColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "01208834037",
                              style: lightTheme.textTheme.bodyText1?.copyWith(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.callCenter.tr(),
                              style: lightTheme.textTheme.bodyText1?.copyWith(
                                fontSize: 15,
                                color: Colors.black,
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
                              color: purpleColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: purpleColor,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      child: MySeparator(
                        color: Colors.white,
                        height: 1.7,
                      ),
                      width: 300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DoneCircularAvatar(
                          underText: LocaleKeys.shippingQueSteps1.tr(),
                          textColor: Colors.white,
                          iconColor: purpleColor,
                          backGroundColor: Colors.white,
                          frontGroundColor: Colors.white,
                        ),
                        DoneCircularAvatar(
                          underText: LocaleKeys.shippingQueSteps2.tr(),
                          textColor: Colors.white,
                          iconColor: purpleColor,
                          backGroundColor: Colors.white,
                          frontGroundColor: Colors.white,
                        ),
                        NotYetYellowContainer(
                          underText: LocaleKeys.shippingQueSteps3.tr(),
                          textColor: Colors.white,
                          borderColor: Colors.white,
                          containerColor: purpleColor,
                        ),
                        NotYetYellowContainer(
                          underText: LocaleKeys.shippingQueSteps4.tr(),
                          textColor: Colors.white,
                          borderColor: Colors.white,
                          containerColor: purpleColor,
                        ),
                        NotYetYellowContainer(
                          underText: LocaleKeys.shippingQueSteps5.tr(),
                          textColor: Colors.white,
                          borderColor: Colors.white,
                          containerColor: purpleColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                color: purpleColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    LocaleKeys.followShipping1.tr(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              // foregroundColor: Colors.white,
              child: CustomDesignUnActive(
                containerColor: Colors.white,
                borderColor: purpleColor,
                borderWidth: 2,
                height: 100,
                borderRadius: 90,
                text: SvgPicture.asset(
                  "Assets/images/user Support.svg",
                  color: purpleColor,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
            bottom: 470,
          ),
        ],
      ),
    );
  }
}
