import 'package:easy_localization/easy_localization.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/charge/evaluate.dart';
import 'package:wasela/mainscreen/nav_bloc/main_nav_cubit.dart';
import 'package:wasela/drawer/settings/settings_screen.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:wasela/start/start_screen.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import 'nav_bloc/main_nav_states.dart';

PersistentTabController persistentTabController =
    PersistentTabController(initialIndex: 0);

class MainNavScreen extends StatelessWidget {
  MainNavScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainNavCubitClass(),
      child: BlocConsumer<MainNavCubitClass, MainNavStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainNavCubitClass.get(context);
          return Scaffold(
            key: globalKey,
            drawer: Drawer(
              backgroundColor: Colors.white,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        persistentTabController.jumpToTab(4);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 25, top: 25),
                        color: Colors.white,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20),
                              child: Row(
                                children: [
                                  CustomDesignUnActive(
                                    text: SvgPicture.asset(
                                      "Assets/images/user Support.svg",
                                      color: purpleColor,
                                      width: 50,
                                      height: 50,
                                    ),
                                    borderColor: purpleColor,
                                    containerColor: Colors.white,
                                    borderWidth: 1,
                                    height: 70,
                                    width: 70,
                                    borderRadius: 35,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "مصطفى نصر",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "01208834037",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    put_line(color: purpleColor),
                    SizedBox(
                      height: 215,
                      child: Container(
                          color: Colors.white,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                put_line(color: purpleColor),
                            itemCount: cubit.drawerTexts.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: index == 2
                                    ? () {
                                        navigateAndBack(context,
                                            layout: SettingsScreen());
                                      }
                                    : index == 1
                                        ? () {
                                            navigateAndBack(context,
                                                layout: EvaluateScreen(
                                                  fromDrawer: true,
                                                ));
                                          }
                                        : () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 20.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        "Assets/images/${cubit.drawerSvgPics[index]}.svg",
                                        width: 30,
                                        height: 30,
                                        color: purpleColor,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${cubit.drawerTexts[index]}",
                                        style: TextStyle(
                                            color: purpleColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                    put_line(color: purpleColor),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 50),
                      child: InkWell(
                        onTap: () {
                          SharedCashHelper.removeValue(key: "accessToken")
                              .then((value) {
                            if (value) {
                              navigateAndFinish(context, layout: StartScreen());
                            }
                          });
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "Assets/images/logout.svg",
                              width: 40,
                              height: 40,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              LocaleKeys.logOutDrawer.tr(),
                              style: TextStyle(color: Colors.red, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: isCompany == 1
                ? WillPopScope(
                    onWillPop: () {
                      if (globalKey.currentState!.isDrawerOpen) {
                        Navigator.pop(context); // closes the drawer if opened
                        return Future.value(false); // won't exit the app
                      } else {
                        return Future.value(true); // exits the app
                      }
                    },
                    child: PersistentTabView(
                      context,
                      // padding: isArabic == false
                      //     ? NavBarPadding.only(left: 70.0, right: 0.0)
                      //     : NavBarPadding.only(left: 0.0, right: 90.0),
                      screens: cubit.screensForClientApp,
                      items: cubit.navigationBarItems,
                      backgroundColor: Colors.white,
                      //resizeToAvoidBottomInset: true,
                      controller: persistentTabController,
                      navBarHeight: 60,
                      navBarStyle: NavBarStyle.style6,
                      onItemSelected: (index) {
                        cubit.changeBarItem(index);
                        print(persistentTabController.index);
                      },
                      popAllScreensOnTapOfSelectedTab: false,
                      //hideNavigationBar: false,
                      resizeToAvoidBottomInset: true,
                    ))
                : cubit.screensForCompanyApp[cubit.indexForCompanyApp],
            bottomNavigationBar: isCompany != 1
                ? BottomNavigationBar(
                    showUnselectedLabels: true,
                    iconSize: 25,
                    unselectedFontSize: 12,
                    selectedFontSize: 15,
                    backgroundColor: Colors.white,
                    items: cubit.navigationBarItemsForCompanyApp,
                    //resizeToAvoidBottomInset: true,
                    onTap: (index) {
                      cubit.changeBarItemForCompanyApp(index);
                    },
                    selectedItemColor: yellowColor,
                    unselectedItemColor: textGreyTwoColor,
                    currentIndex: cubit.indexForCompanyApp,
                  )
                : null,
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.startDocked,
            // resizeToAvoidBottomInset: false,
            // floatingActionButton: isCompany == 1
            //     ? SizedBox(
            //         height: 100,
            //         child: Column(
            //           children: [
            //             InkWell(
            //               onTap: () {
            //                 navigateAndBack(context, layout: MarketingScreen());
            //               },
            //               child: Container(
            //                 child: Icon(
            //                   Icons.hotel,
            //                   color: iconBlackColor,
            //                   size: 35,
            //                 ),
            //                 padding: EdgeInsets.symmetric(
            //                     horizontal: 10, vertical: 12),
            //                 decoration: BoxDecoration(
            //                   color: yellowColor,
            //                   borderRadius: BorderRadius.circular(60.0),
            //                 ),
            //               ),
            //             ),
            //             Text(LocaleKeys.marketing.tr()),
            //           ],
            //         ),
            //       )
            //     : null,
          );
        },
      ),
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

/*

          leading: IconButton(
              onPressed: () {
                persistentTabController.jumpToTab(0);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            actions: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 20),
                      child: SvgPicture.asset(
                        "Assets/images/menu.svg",
                        color: Colors.white,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none,
                        size: 40,
                      )),
                ],
              ),
            ],
            title: Column(
              children: [
                SvgPicture.asset(
                  "Assets/images/${cubit.svgGenerate(persistentTabController.index)}.svg",
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
                Text(
                  "${cubit.addressGenerate(persistentTabController.index)}",
                  style: TextStyle(fontSize: 25, height: 1.5),
                ),
              ],
            ),

 */
