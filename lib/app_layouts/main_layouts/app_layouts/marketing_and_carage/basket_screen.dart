import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/states.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

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
                        child: put_line(
                            line_width: 50, color: textGreyTwoColor),
                      );
                    },
                    itemCount: cubit.cardItems,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          textDirection: TextDirection.rtl,
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
                            SizedBox(width: 10,),
                            Text("اسم المنتج"),
                            SizedBox(width: 10,),
                            Expanded(
                              child: CustomDesign(
                                text: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text("25 جنية",style: TextStyle(color: Colors.white),),
                                      InkWell(
                                        onTap: () {
                                          cubit.increasQuantity();
                                        },
                                        child: Icon(
                                          Icons.add,
                                            color: Colors.white
                                        ),
                                      ),
                                      CustomDesignUnActive(
                                          width: 30,
                                          height: 30,
                                          containerColor: Colors.transparent,
                                          borderColor: Colors.white,
                                          borderRadius: 2,
                                          borderWidth: 2,
                                          text: Text("${cubit.quantity}",style: TextStyle(color: Colors.white),)),
                                      InkWell(
                                        onTap: () {
                                          cubit.decreaseQuantity();
                                        },
                                        child: Icon(
                                          Icons.remove,
                                            color: Colors.white
                                        ),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
