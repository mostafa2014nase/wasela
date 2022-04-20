import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import '../bloc/cubit_class.dart';
import '../bloc/states.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  var formValid = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubitClass, DrawerStates>(
      listener: (context, state) {
         if (DrawerCubitClass.get(context).responseMessage == "تم تغيير كلمة المرور بنجاح") {
          showToast(context, DrawerCubitClass.get(context).responseMessage,
              ToastStates.success);
            if(state is ResetControllersSuccessState){
              backToPrevious(context);
          }
        }
        else if(DrawerCubitClass.get(context).responseMessage =="كلمة المرور الحالية غير صحيحة"){
          showToast(context, DrawerCubitClass.get(context).responseMessage,
              ToastStates.error);
        }
      },
      builder: (context, state) {
        var cubit = DrawerCubitClass.get(context);
        return Scaffold(
          appBar: generateAppBarForCompanyMainScreens(
            title: "تغيير كلمة المرور",
            svgPath: "password",
            imageSize: 70.0,
            context: context,
            mainScreen: false,
          ),
          backgroundColor: greyColor,
          body: Form(
            key: formValid,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10.0),
                            left: Radius.circular(10.0),
                          ),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password must be not empty";
                            }
                            if (value.length < 8) {
                              return "password must be 8 at least characters";
                            }
                            return null;
                          },
                          controller: cubit.currentPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "كلمة المرور الحالية",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: purpleColor, width: 1.2)),
                            hintStyle: TextStyle(color: purpleColor),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10.0),
                            left: Radius.circular(10.0),
                          ),
                        ),
                        child: TextFormField(
                          obscureText: cubit.isPassword ? true : false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password must be not empty";
                            }
                            if (value.length < 8) {
                              return "password must be 8 at least characters";
                            }
                            return null;
                          },
                          controller: cubit.newPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              child: Icon(!cubit.isPassword
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye),
                              onTap: () {
                                cubit.makeItReadAble();
                              },
                            ),
                            fillColor: Colors.white,
                            hintText: "كلمة المرور الجديدة",
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                const BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: purpleColor, width: 1.2)),
                            hintStyle: TextStyle(color: purpleColor),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child:Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10.0),
                            left: Radius.circular(10.0),
                          ),
                        ),
                        child: TextFormField(
                          obscureText: cubit.isPassword ? true : false,
                          validator: (value) {
                            if (cubit.reNewPasswordController.text !=
                                cubit.newPasswordController.text) {
                              return "password must be the same";
                            }
                            return null;
                          },
                          controller: cubit.reNewPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              child: Icon(!cubit.isPassword
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye),
                              onTap: () {
                                cubit.makeItReadAble();
                              },
                            ),
                            fillColor: Colors.white,
                            hintText: "تأكيد كلمة المرور الجديدة",
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                const BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: purpleColor, width: 1.2)),
                            hintStyle: TextStyle(color: purpleColor),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ConditionalBuilder(
                      condition: state is! ChangePasswordLoadingState,
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      builder: (context) => ButtonCustomDesign(
                        width: 300,
                        text: const Text(
                          "تأكيد",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        inkwellFunc: () {
                          if (formValid.currentState!.validate()) {
                            cubit.changePassword();
                          }
                        },
                        containerColor: purpleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
