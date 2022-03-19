import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

class FollowCharge extends StatelessWidget {
  const FollowCharge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
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
            SvgPicture.asset(
              "Assets/images/wallet.svg",
              width: 40,
              height: 40,
              color: Colors.white,
            ),
            Text(
              "تابع شحناتك",
              style: TextStyle(fontSize: 25, height: 1.5),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 40),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return DecoratedContainerWithShadow(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomRowForDetailsWithNoPreIcon(
                                text1: "رقم بوليصة الشحن",
                                text2: "1855",
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text("مساء 8:55"),
                              ),
                            ],
                          ),
                          Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomRowForDetailsWithNoPreIcon(
                                text1: "رقم بوليصة الشحن",
                                text2: "1855",
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text("مساء 8:55"),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: CustomRowForDetailsWithNoPreIcon(
                              text1: "إجمالى المبلغ",
                              text2: "5500 جنية مصري",
                              color: purpleColor,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
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
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DoneFollowChargeCircularAvatar(
                                  underText: "تم الإستلام",
                                ),
                                DoneFollowChargeCircularAvatar(
                                  underText: "جارى المراجعة",
                                ),
                                NotYetFollowChargeYellowContainer(
                                  underText: "تم التأكيد",
                                ),
                                NotYetFollowChargeYellowContainer(
                                  underText: "جاري التحضير",
                                ),
                                NotYetFollowChargeYellowContainer(
                                  underText: "فى الطريق",
                                ),
                                NotYetFollowChargeYellowContainer(
                                  underText: "تم التسليم",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, left: 10.0, bottom: 20, top: 10),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonCustomDesign(
                              width: 140,
                              text: Text(
                                "البوليصة",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              inkwellFunc: () {},
                              containerColor: purpleColor,
                            ),
                            ButtonCustomDesign(
                              width: 140,
                              text: Text(
                                "تأكيد الإستلام",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              inkwellFunc: () {},
                              containerColor: yellowColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
    );
  }
}
