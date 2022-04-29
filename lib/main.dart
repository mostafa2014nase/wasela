import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/add_order/bloc/add_order_cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/calculations/calculations_bloc/calculations_cubit.dart';
import 'package:wasela/comapny_app/app_layouts/home/home_bloc/home_cubit.dart';
import 'package:wasela/comapny_app/app_layouts/home/home_screen.dart';
import 'package:wasela/comapny_app/app_layouts/injunction/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/notifications/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/offers/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/trade_store/bloc/cubit_class.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/drawer/settings/bloc/cubit_class.dart';
import 'package:wasela/helper_methods/dio_helper/dio.dart';
import 'package:wasela/helper_methods/modules/const%20classes.dart';
import 'package:wasela/login/bloc/cubit_class.dart';
import 'package:wasela/register/bloc/cubit_class.dart';
import 'package:wasela/splach/splach_screen.dart';
import 'package:wasela/start/start_screen.dart';
import 'package:wasela/twilio_sms/cubit/twilio_cubit.dart';
import 'mainscreen/main_nav_screen.dart';
import 'helper_methods/app_bloc_provider/bloc/cubit.dart';
import 'helper_methods/app_bloc_provider/bloc/states.dart';
import 'helper_methods/constants/some_classes.dart';
import 'helper_methods/sharedpref/shared_preference.dart';
import 'onBoarding/on_boarding_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  Firebase.initializeApp();
  await SharedCashHelper.init();
  DioHelper.init();
  var dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  await dio.get("https://wasela.innovations-eg.com/");
  // Print cookies
  print(cookieJar
      .loadForRequest(Uri.parse("https://wasela.innovations-eg.com/")));
  // second request with the cookie
  await dio.get("https://wasela.innovations-eg.com/");
  var onBoarding = SharedCashHelper.getValue(key: "skip");
  SaveValueInKey.accessToken = SharedCashHelper.getValue(key: "accessToken");
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //lang = SharedCashHelper.getValue(key: "lang");
  SaveValueInKey.userType = SharedCashHelper.getValue(key: "user_type");
  log("${SaveValueInKey.accessToken}");
  //isArabic = SharedCashHelper.getValue(key: "isArabic");
  Widget startScreen;
  //print("language is ${lang}");
  // for handling language states
  // if (isArabic == false && lang == "en") {
  //   lang = "en";
  // } else {
  //   lang = "ar";
  // }

  // for handling ( clients / company) model
  if (SaveValueInKey.userType == null) {
    SaveValueInKey.userType = "client";
  }

  if (onBoarding == true) {
    if (SaveValueInKey.accessToken != null) {
      startScreen = MainNavScreen();
    } else {
      startScreen = StartScreen();
    }
  } else {
    startScreen = OnBoardingScreen();
  }
  BlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        child: MyApp(
          startScreen: startScreen,
        ),
        path: "Assets/translations",
        supportedLocales: const [
          Locale("en"),
          Locale("ar"),
        ],
        fallbackLocale: Locale("ar"),
        startLocale: Locale("ar"),
        useFallbackTranslations: true,
      ),
    ),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  Widget startScreen;

  MyApp({
    required this.startScreen,
  });

  // static void setLocale(BuildContext context, String myAppLanguage) {
  //   _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
  //   state!.setLocale(myAppLanguage);
  // }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // void setLocale(String finalLanguage) {
  //   setState(() {
  //     widget.language = finalLanguage;
  //   });
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AppCubitClass()
                ..getClientProfileData()
                ..getCompanyProfileData()..getAllShipmentsData()),
          BlocProvider(create: (context) => DrawerCubitClass()),
          BlocProvider(
              create: (context) =>
                  RegisterCubitClass()..getAllCitiesForRegister()),
          BlocProvider(create: (context) => LoginCubitClass()),
          BlocProvider(create: (context) => HomeCubitClassForCompany()..getHomeData()..getHomeChartData ()),
          BlocProvider(create: (context) => CalculateChargingCubitClass()),
          BlocProvider(
              create: (context) => AddNewShipCubitClass()
                ..getCostCitiesAndTheirAreas()
                ..getServiceType()
                ..getAdditionalServiceTypes()
                ..getLimitedWeight()),
          BlocProvider(create: (context) => InjunctionsAppCubitClass()),
          BlocProvider(create: (context) => NotificationCubitClass()),
          BlocProvider(create: (context) => OfferCubitClass()..getOffers()),
          BlocProvider(create: (context) => ShipForCompanyAppCubitClass()),
          BlocProvider(
              create: (context) =>
                  TradeStoreSystemCubitClass()..getAllStorageSystems()),
          BlocProvider(create: (context) => AddOrderCubitClass()),
          BlocProvider(create: (context) => CalculationsCubitClassForCompany()),
          BlocProvider(create: (context) => TwilioCubitClass()),
        ],
        child: BlocConsumer<AppCubitClass, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var appCubit = AppCubitClass.get(context);
            // print(
            //     "language is ${widget.language} which is (${Locale(widget.language)})");
            return MaterialApp(
              title: 'Flutter Demo',
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              //localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: [
                context.localizationDelegates[0],
                context.localizationDelegates[1],
                context.localizationDelegates[2],
                context.localizationDelegates[3],
                DefaultWidgetsLocalizations.delegate,
                DefaultMaterialLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: Locale("ar"),
              //Locale(widget.language),
              home: MainSplashScreen(startScreen: widget.startScreen),
            );
          },
        ));
  }
}
