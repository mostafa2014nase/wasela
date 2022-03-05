import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:wasela/settings/bloc/states.dart';

import '../../helper_methods/constants/endpoints.dart';

class DrawerCubitClass extends Cubit<DrawerStates> {
  DrawerCubitClass() : super(DrawerStatesInitState());

  static DrawerCubitClass get(context) => BlocProvider.of(context);

  //bool ? englishActive;

  void toggleLanguage(
      {required String language, required BuildContext context}) async {
    await context.setLocale(Locale(language)).then((value) {
      SharedCashHelper.setValue(key: "lang", value: language);
    }).then((value) {
      if (language == "en") {
        isArabic = false;
        SharedCashHelper.setValue(key: "isArabic", value: false).then((value) {
          emit(PerformEnglishLanguageSuccessState());
        });
      } else {
        isArabic = true;
        SharedCashHelper.setValue(key: "isArabic", value: true).then((value) {
          emit(PerformArabicLanguageSuccessState());
        });

      }
    });
  }
}
