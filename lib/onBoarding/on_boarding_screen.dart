import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/start/start_screen.dart';
import '../helper_methods/sharedpref/shared_preference.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boardingList = [
    BoardingModel(
      image: 'Assets/images/1 back.jpg',
      text: Column(
        children: [
          Text(
            "شحناتك تصل الى اى مكان",
            style: TextStyle(fontSize: 30, color: textBlueColor),
            textAlign: TextAlign.center,
          ),
          const Text(
            "جهز شحناتك .... تصل لأي مكان",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
    BoardingModel(
      image: 'Assets/images/3 back.jpg',
      text: Column(
        children: [
          Text(
            "افضل نظام لتتبع شحناتك",
            style: TextStyle(fontSize: 30, color: textBlueColor),
            textAlign: TextAlign.center,
          ),
          const Text(
            "شحناتك معاك فى اى وقت وفى اى مكان",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
    BoardingModel(
      image: 'Assets/images/1 ktakeet.jpg',
      text: Column(
        children: [
          Text(
            "أفضل مندوبي توصيل",
            style: TextStyle(fontSize: 30, color: textBlueColor),
            textAlign: TextAlign.center,
          ),
          const Text(
            "نظام تقييمات كامل على أداء المندوب",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ];

  var boardController = PageController(initialPage: 0);

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(
          seconds: 5,
        ), (Timer timer) {
      if (currentPage < boardingList.length - 1) {
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
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 500,
              child: Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  controller: boardController,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boardingList[index]),
                  itemCount: boardingList.length,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boardingList.length,
                    effect: const ScrollingDotsEffect(
                      activeDotColor: Colors.yellow,
                      //expansionFactor: 4,
                      dotColor: Colors.grey,
                      dotHeight: 8,
                      dotWidth: 8,
                      radius: 5,
                      spacing: 25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
        floatingActionButton: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "تجاوز",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Spacer(),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                color: Colors.indigo[300],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward,
                    color: Colors.white, size: 35),
                onPressed: () {
                  // SharedCashHelper.setValue(key: "skip", value: true).then((value) {
                  //if (value) {
                  navigateAndFinish(context, layout: StartScreen());
                  // }
                  // });
                },
              ),
            ),
          ],
        ));
  }
}
