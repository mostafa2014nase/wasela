import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(
        context: context,
        title: LocaleKeys.bottomNavItemsName6.tr(),
        svgPath: "user Support",
      ),
    );
  }
}
