import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/home/home_bloc/home_cubit.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/mainscreen/nav_bloc/main_nav_cubit.dart';
import 'package:wasela/settings/bloc/cubit_class.dart';
import 'package:wasela/splach/splach_screen.dart';
import 'package:wasela/translations/codegen_loader.g.dart';
import 'app_layouts/main_layouts/app_layouts/charge/bloc/cubit_class.dart';
import 'app_layouts/main_layouts/app_layouts/our_places/bloc/cubit_class.dart';
import 'helper_methods/app_bloc_provider/bloc/cubit.dart';
import 'helper_methods/app_bloc_provider/bloc/states.dart';
import 'helper_methods/constants/endpoints.dart';
import 'helper_methods/sharedpref/shared_preference.dart';
import 'login/login_screen.dart';
import 'onBoarding/on_boarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await SharedCashHelper.init();
  Bloc.observer = BlocObserver();
  var onBoarding = SharedCashHelper.getValue(key: "skip");
  lang = SharedCashHelper.getValue(key: "lang");
  isArabic = SharedCashHelper.getValue(key: "isArabic");
  Widget startScreen;
  print("language is ${lang} and isArabic Check = $isArabic");
  if(isArabic == false  && lang == "en")
    {
      lang = "en";
    }
  else {
    lang = "ar";
  }

  if (onBoarding == null || onBoarding == false) {
    startScreen = OnBoardingScreen();
  } else {
    startScreen = LoginScreen();
  }

  runApp(
    EasyLocalization(
      child: MyApp(startScreen: startScreen,language: lang),
      path: "Assets/translations",
      supportedLocales: const [
        Locale("en"),
        Locale("ar"),
      ],
      fallbackLocale: Locale("ar"),
      startLocale: Locale("ar"),
      useFallbackTranslations: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  Widget startScreen;
  String language;

  MyApp({required this.startScreen,required this.language});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubitClass()),
          BlocProvider(create: (context) => MainNavCubitClass()),
          BlocProvider(create: (context) => CalculateChargingCubitClass()),
          BlocProvider(create: (context) => OurBranchesCubitClass()),
          BlocProvider(create: (context) => ChargeCubitClass()),
          BlocProvider(create: (context) => HomeCubitClass()),
          BlocProvider(create: (context) => MarketingCubitClass()),
          BlocProvider(create: (context) => DrawerCubitClass()),
        ],
        child: BlocConsumer<AppCubitClass, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            print ("language is $language which is (${Locale(language)})");
            return MaterialApp(
              title: 'Flutter Demo',
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: Locale(language),
              home: MainSplashScreen(startScreen: startScreen),
            );
          },
        ));
  }
}
