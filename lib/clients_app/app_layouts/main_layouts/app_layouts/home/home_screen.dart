import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasela/mainscreen/main_nav_screen.dart';
import 'package:wasela/mainscreen/nav_bloc/main_nav_cubit.dart';
import 'package:wasela/mainscreen/nav_bloc/main_nav_states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var boardController = PageController(initialPage: 0);

  int currentPage = 0;

  List<BoardingModelForMainScreen> homeImagesList = [
    BoardingModelForMainScreen(
      image: 'Assets/images/05.png',
    ),
    BoardingModelForMainScreen(
      image: 'Assets/images/06.png',
    ),
    BoardingModelForMainScreen(
      image: 'Assets/images/07.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(
          seconds: 5,
        ), (Timer timer) {
      if (currentPage < homeImagesList.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      boardController.animateToPage(currentPage,
          duration: const Duration(seconds: 1), curve: Curves.easeInCubic);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainNavCubitClass, MainNavStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: generateAppBarForCompanyMainScreens(
            mainScreen: true,
            context: context,
            title: LocaleKeys.bottomNavItemsName1.tr(),
            svgPath: "home",
            textHeight: 2.0
          ),
          body: Column(
            children: [
              SizedBox(
                height: 300,
                child: Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (int index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    controller: boardController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildBoradingForMainScreen(homeImagesList[index]),
                    itemCount: homeImagesList.length,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: boardController,
                        count: homeImagesList.length,
                        effect: const ScrollingDotsEffect(
                          activeDotColor: Colors.yellow,
                          //expansionFactor: 4,
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                          radius: 5,
                          spacing: 15,
                        ),
                      ),
                      //Spacer(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  color: greyColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          LocaleKeys.homeScreen1.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: textGreyTwoColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: put_line(
                            line_width: 120,
                            color: yellowColor,
                            line_height: 2),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TransportCustomDesign(
                              onTap: () {
                                MainNavCubitClass.get(context)
                                    .getFirebaseToken();
                              },
                              icon: const Icon(
                                Icons.car_repair,
                                color: Colors.white,
                                size: 80,
                              ),
                              paddingValue: 15,
                              borderRadius: 20,
                              containerColor: purpleColor,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: YellowButtonCustomDesign(
                                text: LocaleKeys.homeScreen2.tr(),
                                inkwellFunc: () {
                                  persistentTabController.jumpToTab(2);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
