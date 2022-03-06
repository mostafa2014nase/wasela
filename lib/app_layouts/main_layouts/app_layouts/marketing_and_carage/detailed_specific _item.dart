import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/states.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/detailed_category.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

import '../../../../helper_methods/constants/endpoints.dart';
import '../../../../translations/localeKeys.g.dart';

class DetailedItemScreen extends StatefulWidget {
  final int categoryIndex;
  final int itemIndex;
  final bool isAlreadyClicked;

  DetailedItemScreen(
      {Key? key,
      required this.categoryIndex,
      required this.itemIndex,
      required this.isAlreadyClicked})
      : super(key: key);

  @override
  State<DetailedItemScreen> createState() => _DetailedItemScreenState();
}

class _DetailedItemScreenState extends State<DetailedItemScreen> {
  var itemController = PageController(initialPage: 0);

  int currentPage = 0;
  List<BoardingModelForMainScreen> itemImagesList = [
    BoardingModelForMainScreen(
      image: 'Assets/images/1 back.jpg',
    ),
    BoardingModelForMainScreen(
      image: 'Assets/images/3 back.jpg',
    ),
    BoardingModelForMainScreen(
      image: 'Assets/images/1 ktakeet.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(
          seconds: 5,
        ), (Timer timer) {
      if (currentPage < itemImagesList.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      itemController.animateToPage(currentPage,
          duration: const Duration(seconds: 1), curve: Curves.easeInCubic);
    });
  }

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
                  "${cubit.gridIcons[widget.categoryIndex]}",
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
                Text(
                  "${cubit.gridTexts[widget.categoryIndex]}",
                  style: TextStyle(fontSize: 25, height: 1.5),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomDesign(
                        height: 300,
                        width: 400,
                        borderRadius: 50,
                        text: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent),
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (int index) {
                              setState(() {
                                currentPage = index;
                              });
                            },
                            controller: itemController,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                buildBoradingForMainScreen(
                                    itemImagesList[index]),
                            itemCount: itemImagesList.length,
                          ),
                        ),
                        containerColor: purpleColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SmoothPageIndicator(
                        controller: itemController,
                        count: itemImagesList.length,
                        effect: ScrollingDotsEffect(
                          activeDotColor: yellowColor,
                          //expansionFactor: 4,
                          dotColor: Colors.red,
                          dotHeight: 10,
                          dotWidth: 10,
                          radius: 5,
                          spacing: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "200 ${LocaleKeys.pound.tr()}",
                    style: TextStyle(color: purpleColor, fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomDesignUnActive(
                          borderColor: purpleColor,
                          borderRadius: 1,
                          borderWidth: 1,
                          text: Text(
                            "أسم المنتج",
                          ),
                          containerColor: Colors.white),
                      SizedBox(
                        height: 10,
                      ),
                      CustomDesignUnActive(
                          borderColor: purpleColor,
                          borderRadius: 1,
                          borderWidth: 1,
                          height: 200,
                          text: Text(
                            "وصف المنتج",
                          ),
                          containerColor: Colors.white),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ButtonCustomDesign(
                          inkwellFunc: () {
                            if (!widget.isAlreadyClicked) {
                              cubit.increasCardItems();
                              showToast(context, "Added successfully", ToastStates.success);
                              navigateAndFinish(
                                context,
                                layout: DetailedCategory(
                                    index: widget.categoryIndex),
                              );
                            }
                            else {
                             showToast(context, "Already added", ToastStates.error);
                              navigateAndFinish(
                                context,
                                layout: DetailedCategory(
                                    index: widget.categoryIndex),
                              );
                            }

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
                                      horizontal: 40.0),
                                  child: Text(
                                    LocaleKeys.marketingCategory2.tr(),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
