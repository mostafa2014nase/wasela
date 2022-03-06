import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:wasela/main.dart';
import 'package:wasela/settings/bloc/states.dart';

import '../../helper_methods/constants/endpoints.dart';

class DrawerCubitClass extends Cubit<DrawerStates> {
  DrawerCubitClass() : super(DrawerStatesInitState());

  static DrawerCubitClass get(context) => BlocProvider.of(context);

  //bool ? englishActive;
  String? myLanguage;

  void toggleLanguage(
      {required String language, required BuildContext context}) {
    SharedCashHelper.setValue(key: "lang", value: language).then((value) async {
      if (language == "en") {
        myLanguage = language;
        setLanguageNow(context: context);
        isArabic = false;
        await context.setLocale(Locale("en")).then((value) {
          SharedCashHelper.setValue(key: "isArabic", value: false)
              .then((value) {
            emit(PerformEnglishLanguageSuccessState());
          });
        });
      } else {
        myLanguage = language;
        setLanguageNow(context: context);
        isArabic = true;
        await context.setLocale(Locale("ar")).then((value) {
          SharedCashHelper.setValue(key: "isArabic", value: true).then((value) {
            emit(PerformArabicLanguageSuccessState());
          });
        });
      }
    });
  }

  void setLanguageNow({required BuildContext context}) {
    if (myLanguage == null) {
      myLanguage = "ar";
      MyApp.setLocale(context, myLanguage!);
    } else
      MyApp.setLocale(context, myLanguage!);
  }
}
