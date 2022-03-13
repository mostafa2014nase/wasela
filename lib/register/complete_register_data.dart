import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/app_layouts/main_layouts/mainscreen/main_nav_screen.dart';
import 'package:wasela/register/bloc/cubit_class.dart';
import 'package:wasela/register/bloc/states.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import '../helper_methods/constants/endpoints.dart';
import '../helper_methods/functions/functions_needed.dart';

class CompleteRegisterData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RegisterCubitClass(),
      child: BlocConsumer<RegisterCubitClass,RegisterStates>(
        listener: (context, state){},
        builder: (context ,state){
          var cubit = RegisterCubitClass.get(context);
          return  Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Column(
                  children: [
                    Image.asset('Assets/images/07.png',width: 300,height: 300,),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.registerScreen1.tr(),
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              controller: cubit.nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint1.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide:
                                    BorderSide(color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              controller: cubit.emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint2.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide:
                                    BorderSide(color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              controller: cubit.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint3.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide:
                                    BorderSide(color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            child: TextFormField(
                              controller: cubit.rePasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: LocaleKeys.registerScreenHint4.tr(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                    borderSide:
                                    BorderSide(color: purpleColor, width: 1.2)),
                                hintStyle: TextStyle(color: purpleColor),
                                border: OutlineInputBorder(),),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                      ),
                      child: ButtonCustomDesign(
                        text: Text(
                          LocaleKeys.registerScreen1.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        inkwellFunc: () {
                          navigateAndFinish(context, layout: MainNavScreen());
                        },
                        containerColor: purpleColor,
                      ),
                    ),
                    // Container(
                    //   height: 50,
                    //   child: Text(
                    //     LocaleKeys.loginScreen1.tr(),
                    //     style: TextStyle(fontSize: 17),
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

