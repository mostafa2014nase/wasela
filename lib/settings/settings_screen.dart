import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerLeft,
                height: 100,
                width: 100,
                color: Colors.red,
                child: Text("English",style: TextStyle(fontSize: 30),),
              ),
              onTap: () async {
                await context.setLocale(Locale("en"));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerRight,
                height: 100,
                width: 100,
                color: Colors.red,
                child: Text("العربية",style: TextStyle(fontSize: 30),),
              ),
              onTap: () async {
                await context.setLocale(Locale("ar"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
