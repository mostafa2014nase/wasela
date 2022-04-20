import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/drawer/settings/screens/change_password.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/cubit.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/profile/user_account_screen.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
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
        title: Column(
          children: [
            SvgPicture.asset(
              "Assets/images/settings(3).svg",
              width: 50,
              height: 50,
              color: Colors.white,
            ),
            Text(
              LocaleKeys.settingsAddress.tr(),
              style: TextStyle(fontSize: 25, height: 1.5),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SettingsButtonRow(
            onTap: () {
              navigateAndBack(context, layout: UserAccountScreenUpdate(isFromProfile: false,));
              if(SaveValueInKey.userType == "client"){
                AppCubitClass.get(context).getClientProfileData();
                AppCubitClass.get(context).getAllCitiesForRegister();
              }
              else{
                AppCubitClass.get(context).getCompanyProfileData();
                AppCubitClass.get(context).getAllCitiesForRegister();
              }

            },
            text: LocaleKeys.settings1.tr(),
            preIcon: Icon(
              Icons.person,
              size: 50,
            ),
            goIcon: Icons.arrow_forward_ios,
          ),
          // SettingsButtonRow(
          //   onTap: () {
          //     navigateAndBack(context, layout: LanguageScreen());
          //   },
          //   text: LocaleKeys.settings2.tr(),
          //   preIcon: Icon(
          //     Icons.person,
          //     size: 50,
          //   ),
          //   goIcon: Icons.arrow_forward_ios,
          // ),
          SettingsButtonRow(
            onTap: () {
              navigateAndBack(context, layout:  ChangePasswordScreen());
            },
            text: LocaleKeys.settings3.tr(),
            preIcon: Icon(
              Icons.person,
              size: 50,
            ),
            goIcon: Icons.arrow_forward_ios,
          ),
          // SettingsButtonRow(
          //   onTap: () {
          //     navigateAndBack(context, layout: ContactUsScreen());
          //   },
          //   text: LocaleKeys.settings4.tr(),
          //   preIcon: Icon(
          //     Icons.person,
          //     size: 50,
          //   ),
          //   goIcon: Icons.arrow_forward_ios,
          // ),
        ],
      ),
    );
  }
}
