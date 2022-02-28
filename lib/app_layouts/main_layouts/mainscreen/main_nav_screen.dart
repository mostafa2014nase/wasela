import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/marketing_screen.dart';
import 'package:wasela/app_layouts/main_layouts/mainscreen/nav_bloc/main_nav_cubit.dart';
import 'package:wasela/app_layouts/main_layouts/mainscreen/nav_bloc/main_nav_states.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
PersistentTabController persistentTabController =
PersistentTabController(initialIndex: 0);
class ManNavScreen extends StatelessWidget {
  const ManNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navCubit = MainNavCubitClass.get(context);
    return BlocConsumer<MainNavCubitClass, MainNavStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: PersistentTabView(
            context,

            padding: NavBarPadding.only(left: 90,right: 0),
            screens: navCubit.Screens,
            items: navCubit.navigationBarItems,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            controller: persistentTabController,
            navBarHeight: 60,
            navBarStyle: NavBarStyle.style6,
            onItemSelected: (index) {
              navCubit.changeBarItem(index);
            },
            popAllScreensOnTapOfSelectedTab: true,
            hideNavigationBar: false,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          floatingActionButton: SizedBox(
            height: 100,
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    navigateAndBack(context, layout: MarketingScreen());
                  },
                  child: Container(
                    child: Icon(
                      Icons.hotel,
                      color: iconBlackColor,
                      size: 35,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                ),
                Text("تسوق وأشحن"),
              ],
            ),
          ),
        );
      },
    );
  }
}

/*

          floatingActionButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(60.0),
            ),
            child: Icon(Icons.hotel, color: Colors.black, size: 35),
          ),
          body: navCubit.Screens[navCubit.index],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          bottomNavigationBar: BottomNavigationBar(
            items: navCubit.bottomNavigationBarItems,
            backgroundColor: greyColor,
            onTap: (index) => navCubit.changeBarItem(index),
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black,
            selectedItemColor: yellowColor,
          ),

 */
