import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';
import 'package:wasela/settings/bloc/cubit_class.dart';
import 'package:wasela/settings/bloc/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubitClass, DrawerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DrawerCubitClass.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    cubit.toggleLanguage(
                      language: "ar",
                      context: context,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomDesignUnActive(
                            width: 70,
                            height: 70,
                            borderRadius: 70,
                            borderWidth: 5,
                            borderColor: purpleColor,
                            text: Text(
                              "AR",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            containerColor: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "العربية",
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      isArabic == true || isArabic == null
                          ? Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 20),
                              child: CustomDesignUnActive(
                                borderColor: purpleColor,
                                text: Icon(
                                  Icons.check,
                                  size: 30,
                                  color: purpleColor,
                                ),
                                containerColor: Colors.white,
                                width: 50,
                                height: 50,
                                borderWidth: 5,
                                borderRadius: 50,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomDesignUnActive(
                            width: 70,
                            height: 70,
                            borderRadius: 70,
                            borderWidth: 5,
                            borderColor: purpleColor,
                            text: Text(
                              "En",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            containerColor: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "English",
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      isArabic == false
                          ? Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 20),
                              child: CustomDesignUnActive(
                                borderColor: purpleColor,
                                text: Icon(
                                  Icons.check,
                                  size: 30,
                                  color: purpleColor,
                                ),
                                containerColor: Colors.white,
                                width: 50,
                                height: 50,
                                borderWidth: 5,
                                borderRadius: 50,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  onTap: () {
                    cubit.toggleLanguage(
                      language: "en",
                      context: context,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
