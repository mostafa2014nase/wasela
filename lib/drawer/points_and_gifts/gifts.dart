import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

import '../../translations/localeKeys.g.dart';

class PointsAndGifts extends StatelessWidget {
  const PointsAndGifts({Key? key}) : super(key: key);

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
            backToPrevious(context);
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
              "Assets/images/online-shopping.svg",
              width: 40,
              height: 40,
              color: Colors.white,
            ),
            Text(
              LocaleKeys.cart.tr(),
              style: TextStyle(fontSize: 25, height: 1.5),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: DecoratedContainerWithShadow(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(3.0),
                        bottom: Radius.circular(3.0),
                      ),
                      color: purpleColor,
                    ),
                    width: 12,
                    height: 110,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: purpleColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    "mmmmmmmmmmmmmmmmmmmmmmmmm",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0)),
                            ),
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "أحصل عليها الآن",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: yellowColor,
                                    borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(5.0),
                                        left: Radius.circular(5.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SvgPicture.asset(
                                      "Assets/images/gift.svg",
                                      color: purpleColor,
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
