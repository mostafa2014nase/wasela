import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/states.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarketingCubitClass, MarketingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MarketingCubitClass.get(context);
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
                  "Assets/images/online-shopping.svg",
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
                Text(
                  "سلة المشتريات",
                  style: TextStyle(fontSize: 25, height: 1.5),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Text("اقل قيمة للمشتريات 50000 جنيه"),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child:
                            put_line(line_width: 50, color: textGreyTwoColor),
                      );
                    },
                    itemCount: cubit.cardItems,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            CustomDesign(
                              height: 100,
                              width: 110,
                              borderRadius: 10,
                              text: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.transparent),
                                child: Image.asset(""),
                              ),
                              containerColor: purpleColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("اسم المنتج"),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomDesign(
                                text: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "25 ${LocaleKeys.pound.tr()}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          cubit.increasQuantity();
                                        },
                                        child: Icon(Icons.add,
                                            color: Colors.white),
                                      ),
                                      CustomDesignUnActive(
                                          width: 30,
                                          height: 30,
                                          containerColor: Colors.transparent,
                                          borderColor: Colors.white,
                                          borderRadius: 2,
                                          borderWidth: 2,
                                          text: Text(
                                            "${cubit.quantity}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      InkWell(
                                        onTap: () {
                                          cubit.decreaseQuantity();
                                        },
                                        child: Icon(Icons.remove,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                containerColor: purpleColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 25.0, end: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDesignUnActive(
                          width: 340,
                          borderColor: Colors.black,
                          borderWidth: 0.5,
                          borderRadius: 3,
                          text: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "Assets/images/track.svg",
                                width: 50,
                                height: 50,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Shipping cost : 150 ${LocaleKeys.pound.tr()}",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          containerColor: greyColortwoo,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CustomDesignUnActive(
                              width: 35,
                              height: 35,
                              borderRadius: 35,
                              borderWidth: 5,
                              borderColor: textGreyColor,
                              text: Icon(
                                Icons.check,
                                size: 20,
                              ),
                              containerColor: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${LocaleKeys.cost.tr()} : 5000 ${LocaleKeys.pound.tr()}",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomDesignUnActive(
                              width: 35,
                              height: 35,
                              borderRadius: 35,
                              borderWidth: 5,
                              borderColor: textGreyColor,
                              text: Icon(
                                Icons.check,
                                size: 20,
                              ),
                              containerColor: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Ship ${LocaleKeys.cost.tr()} : 150 ${LocaleKeys.pound.tr()}",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Total : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      CustomDesignUnActive(
                        width: 200,
                        borderRadius: 20,
                        borderColor: yellowColor,
                        text: Text("5150 ${LocaleKeys.pound}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        containerColor: yellowColor,
                      ),
                    ],
                  ),SizedBox(height: 30,),Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ButtonCustomDesign(
                      inkwellFunc: () {
                      },
                      containerColor: purpleColor,
                      borderRadius: 40,
                      height: 80,
                      text: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0),
                              child: Text(
                                "Continue buying process",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: greyColor),
                              ),
                            ),
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                child: SvgPicture.asset(
                                  "Assets/images/menu.svg",
                                  color: purpleColor,
                                  width: 50,
                                  height: 50,
                                ),
                                backgroundColor: yellowColor,
                                radius: 33,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
