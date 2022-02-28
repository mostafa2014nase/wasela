import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class MainSplashScreen extends StatelessWidget {
  Widget startScreen;

  MainSplashScreen({required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EasySplashScreen(
          logo: Image.asset("Assets/images/Wasela_Logo.png"),
          backgroundColor: Colors.white,
          durationInSeconds: 2,
          navigator: startScreen,
          showLoader: false,
          logoSize: 200,
        ),
      ),
    );
  }
}
