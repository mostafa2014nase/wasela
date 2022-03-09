import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/drawer/settings/bloc/states.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:wasela/main.dart';

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

  void setArabic({required BuildContext context}) async {
    MyApp.setLocale(context, "ar");
    await context.setLocale(Locale("ar")).then((value) {
      isArabic = true;
      emit(SetArabicNow());
      // SharedCashHelper.setValue(key: "isArabic", value: true).then((value) {
      //   emit(PerformArabicLanguageSuccessState());
      // });
    });
  }

  void setEnglish({required BuildContext context}) async {
    MyApp.setLocale(context, "en");
    await context.setLocale(Locale("en")).then((value) {
      isArabic = false;
      emit(SetEnglishNow());
      // SharedCashHelper.setValue(key: "isArabic", value: false).then((value) {
      //   emit(PerformEnglishLanguageSuccessState());
      // });
    });
  }

  // for contact us screen
  TextEditingController completeName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();

  bool isCall = true;

  void swapToEmailAnswer() {
    isCall = false;
    completeName = TextEditingController();
    email = TextEditingController();
    message = TextEditingController();
    emit(SwapToEmailAnswerSuccessState());
  }

  void swapToCallAnswer() {
    isCall = true;
    completeName = TextEditingController();
    phoneNumber = TextEditingController();
    email = TextEditingController();
    message = TextEditingController();
    emit(SwapToCallAnswerSuccessState());
  }
}
