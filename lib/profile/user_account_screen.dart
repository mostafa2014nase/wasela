import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/notifications/notifications_screen.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/cubit.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitClass, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubitClass.get(context);
        return ConditionalBuilder(
          condition: cubit.companyModel != null,
          builder: (context) {
            return Scaffold(
              backgroundColor: greyColor,
              appBar: AppBar(
                toolbarHeight: 140,
                backgroundColor: purpleColor,
                centerTitle: true,
                foregroundColor: Colors.white,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      cubit.resetFalse();
                      backToPrevious(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10.0),
                    child: IconButton(
                        onPressed: () {
                          navigateAndBack(context,
                              layout: NotificationsForCompanyApp());
                        },
                        icon: Icon(
                          Icons.notifications_none,
                          size: 40,
                        )),
                  ),
                ],
                title: Column(
                  children: [
                    SvgPicture.asset(
                      "Assets/images/user Support.svg",
                      width: 50.0,
                      height: 50.0,
                      color: Colors.white,
                    ),
                    Text(
                      LocaleKeys.bottomNavItemsName6.tr(),
                      style: TextStyle(fontSize: 25, height: 1.0),
                    ),
                  ],
                ),
              ),
              body: WillPopScope(
                onWillPop: () async {
                  cubit.resetFalse();
                  return true;
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 5.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: purpleColor,
                            radius: 80,
                            child:
                                Image.network("${cubit.companyModel!.photo}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "أسم شركتك",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ),
                                    ),
                                    child: TextFormField(
                                      enabled: cubit.enableUpdateNameCompany,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Name must be not empty";
                                        }
                                        return null;
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                      cursorHeight: 30.0,
                                      controller: cubit.updateNameController,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              right: Radius.circular(10.0),
                                              left: Radius.circular(10.0),
                                            ),
                                            borderSide: BorderSide(
                                                color:
                                                    cubit.enableUpdateEmailCompany ==
                                                            false
                                                        ? Colors.black
                                                        : purpleColor,
                                                width: 1.2)),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.enableUpdateNameCompanyFun();
                                  },
                                  child: Container(
                                    color: yellowColor,
                                    width: 30,
                                    height: 30,
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "رقم المويايل",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ),
                                    ),
                                    child: TextFormField(
                                      enabled: cubit.enableUpdatePhoneCompany,
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "phone number must be not empty";
                                        }
                                        if (value.length != 11 ||
                                            value.startsWith("01") == false) {
                                          return "wrong phone number";
                                        }
                                        if (value.contains(" ")) {
                                          return "number must not has spaces";
                                        }
                                        if (value.contains(",")) {
                                          return "number must not has any character";
                                        }
                                        return null;
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                      cursorHeight: 30.0,
                                      controller: cubit.updatePhoneController,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              right: Radius.circular(10.0),
                                              left: Radius.circular(10.0),
                                            ),
                                            borderSide: BorderSide(
                                                color:
                                                    cubit.enableUpdateEmailCompany ==
                                                            false
                                                        ? Colors.black
                                                        : purpleColor,
                                                width: 1.2)),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.enableUpdatePhoneCompanyFunc();
                                  },
                                  child: Container(
                                    color: yellowColor,
                                    width: 30,
                                    height: 30,
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "البريد الالكترونى",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ),
                                    ),
                                    child: TextFormField(
                                      enabled: cubit.enableUpdateEmailCompany,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "email address must be not empty";
                                        }
                                        if (value.contains("@") == false ||
                                            value.contains(".com") == false) {
                                          return "email address is not valid one";
                                        }
                                        return null;
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                      cursorHeight: 30.0,
                                      controller: cubit.updateEmailController,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              right: Radius.circular(10.0),
                                              left: Radius.circular(10.0),
                                            ),
                                            borderSide: BorderSide(
                                                color:
                                                    cubit.enableUpdateEmailCompany ==
                                                            false
                                                        ? Colors.black
                                                        : purpleColor,
                                                width: 1.2)),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.enableUpdateEmailCompanyFunc();
                                  },
                                  child: Container(
                                    color: yellowColor,
                                    width: 30,
                                    height: 30,
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          cubit.checkIfOneTrue()
                              ? ButtonCustomDesign(
                                  width: 200.0,
                                  text: Text(
                                    "تأكيد التعديل",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  inkwellFunc: () {
                                    // post and get (update profile data)
                                    },
                                  containerColor: purpleColor)
                              : Text(""),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          fallback: (context) {
            return Scaffold(
              backgroundColor: greyColor,
              appBar: generateAppBarForCompanyMainScreens(
                mainScreen: false,
                context: context,
                title: LocaleKeys.bottomNavItemsName6.tr(),
                svgPath: "user Support",
              ),
              body: Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}
