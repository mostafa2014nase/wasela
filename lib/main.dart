import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/home/home_bloc/home_cubit.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/mainscreen/nav_bloc/main_nav_cubit.dart';
import 'package:wasela/splach/splach_screen.dart';
import 'app_layouts/main_layouts/app_layouts/charge/bloc/cubit_class.dart';
import 'app_layouts/main_layouts/app_layouts/our_places/bloc/cubit_class.dart';
import 'helper_methods/app_bloc_provider/bloc/cubit.dart';
import 'helper_methods/app_bloc_provider/bloc/states.dart';
import 'helper_methods/constants/endpoints.dart';
import 'helper_methods/sharedpref/shared_preference.dart';
import 'login/login_screen.dart';
import 'onBoarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await SharedCashHelper.init();
  Bloc.observer = BlocObserver();
  var onBoarding = SharedCashHelper.getValue(key: "skip");
  //var logout_look = SharedCashHelper.getValue(key: "logout");
  Widget startScreen;
  //print("logout value =  ${logout_look}");
  if (onBoarding == null || onBoarding == false) {
    startScreen = OnBoardingScreen();
  } else {
    startScreen = LoginScreen();
  }

  runApp(MyApp(startScreen: startScreen));
}

class MyApp extends StatelessWidget {
  Widget startScreen;

  MyApp({required this.startScreen});

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
        ],
        child: BlocConsumer<AppCubitClass, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              home: MainSplashScreen(startScreen: startScreen),
            );
          },
        ));
  }
}
