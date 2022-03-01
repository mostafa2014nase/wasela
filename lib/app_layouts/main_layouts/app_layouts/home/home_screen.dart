import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasela/app_layouts/main_layouts/mainscreen/nav_bloc/main_nav_states.dart';
import '../../../../helper_methods/constants/endpoints.dart';
import '../../../../helper_methods/functions/functions_needed.dart';
import '../../mainscreen/main_nav_screen.dart';
import '../../mainscreen/nav_bloc/main_nav_cubit.dart';

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
          appBar: generateAppBar(
            context: context,
            title: "",
            svgPath: "",
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "ﻗﺎﺋﻤﺔ ﺍﻟﺸﺤﻨﺎﺕ ﺍﻟﺨﺎﺻﺔ ﺑﻚ",
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
                          textDirection: TextDirection.rtl,
                          children: [
                            TransportCustomDesign(
                              onTap: () {},
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
                                text: "تابع شحناتك",
                                inkwellFunc: () {
                                    persistentTabController.jumpToTab(3);
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
