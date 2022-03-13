import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/drawer/settings/screens/contact_us.dart';
import 'package:wasela/drawer/settings/screens/language_screen.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/translations/localeKeys.g.dart';

import '../../helper_methods/functions/functions_needed.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
                child: Icon(
                  Icons.notifications,
                  size: 35,
                )),
          ),
        ],
        title: Padding(
          padding: isArabic!
              ? const EdgeInsetsDirectional.only(start: 80)
              : const EdgeInsetsDirectional.only(start: 80),
          child: Row(
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    "Assets/images/settings (3).svg",
                    width: 40,
                    height: 40,
                    color: Colors.white,
                  ),
                  Text(
                  LocaleKeys.settingsAddress.tr(),
                    style: TextStyle(fontSize: 25, height: 1.5),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SettingsButtonRow(
            onTap: () {},
            text: LocaleKeys.settings1.tr(),
            preIcon: Icon(
              Icons.person,
              size: 50,
            ),
            goIcon: Icons.arrow_forward_ios,
          ),
          SettingsButtonRow(
            onTap: () {
              navigateAndBack(context, layout: LanguageScreen());
            },
            text: LocaleKeys.settings2.tr(),
            preIcon: Icon(
              Icons.person,
              size: 50,
            ),
            goIcon: Icons.arrow_forward_ios,
          ),
          SettingsButtonRow(
            onTap: () {},
            text: LocaleKeys.settings3.tr(),
            preIcon: Icon(
              Icons.person,
              size: 50,
            ),
            goIcon: Icons.arrow_forward_ios,
          ),
          SettingsButtonRow(
            onTap: () {
              navigateAndBack(context, layout: ContactUsScreen());
            },
            text: LocaleKeys.settings4.tr(),
            preIcon: Icon(
              Icons.person,
              size: 50,
            ),
            goIcon: Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
