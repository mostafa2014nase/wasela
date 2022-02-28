import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/states.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/padge_two.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

class CalculateChargeScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculateChargingCubitClass, CalculateChargingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CalculateChargingCubitClass.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                //backToPrevious(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                  ))
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 175,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Column(
                          children: [
                            TransportCustomDesign(
                              onTap: () {
                                cubit.chooseRight();
                              },
                              icon: Icon(
                                Icons.car_repair,
                                color: cubit.rightChoice
                                    ? Colors.white
                                    : Colors.black,
                                size: 80,
                              ),
                              containerColor:
                                  cubit.rightChoice ? purpleColor : greyColor,
                              paddingValue: 10,
                              borderRadius: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("الشحنة من"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TransportCustomDesign(
                              onTap: () {
                                cubit.chooseMiddle();
                              },
                              icon: Icon(
                                Icons.car_repair,
                                color: cubit.middleChoice
                                    ? Colors.white
                                    : Colors.black,
                                size: 80,
                              ),
                              containerColor:
                                  cubit.middleChoice ? purpleColor : greyColor,
                              paddingValue: 10,
                              borderRadius: 15,
                              iconColor: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("الشحنة الي"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TransportCustomDesign(
                              onTap: () {
                                cubit.chooseLeft();
                              },
                              icon: Icon(
                                Icons.car_repair,
                                color: cubit.leftChoice
                                    ? Colors.white
                                    : Colors.black,
                                size: 80,
                              ),
                              containerColor:
                                  cubit.leftChoice ? purpleColor : greyColor,
                              paddingValue: 10,
                              borderRadius: 15,
                              iconColor: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("نوع الشحنة"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: greyColor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      cubit.right
                          ? ToggleCustomDesign(
                              downOnTapFunction: () {
                                cubit.toggleLeft();
                              },
                              upOnTapFunction: () {
                                cubit.toggleRight();
                              },
                              containerColor: greyColor,
                              upContainerColor: yellowColor,
                              downContainerColor: purpleColor,
                              upIcon: Icon(Icons.inbox_sharp),
                              downIcon: Icon(
                                Icons.inbox_sharp,
                                color: Colors.white,
                              ),
                              upText: Text(
                                "طرود",
                                style: TextStyle(fontSize: 25),
                              ),
                              downText: Text(
                                "مستندات",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            )
                          : ToggleCustomDesignUpdate(
                              downOnTapFunction: () {
                                cubit.toggleLeft();
                              },
                              upOnTapFunction: () {
                                cubit.toggleRight();
                              },
                              containerColor: greyColor,
                              upContainerColor: purpleColor,
                              downContainerColor: yellowColor,
                              upIcon: Icon(
                                Icons.inbox_sharp,
                                color: Colors.white,
                              ),
                              downIcon: Icon(
                                Icons.inbox_sharp,
                              ),
                              upText: Text(
                                "طرود",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              downText: Text(
                                "مستندات",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        hintText: cubit.longHintWords,
                        controller: cubit.longController,
                        preWidget: DropdownButton(
                            underline: SizedBox(),
                            focusColor: Colors.black,
                            dropdownColor: yellowColor,
                            autofocus: true,
                            hint: Text('cm',
                                style: TextStyle(color: Colors.black)),
                            onTap: () {},
                            value: cubit.lengthSelected,
                            onChanged: (newVal) {
                              cubit.selectLenghthChoice(newVal);
                              print(cubit.menuList);
                            },
                            items: cubit.menuList.map((val) {
                              return DropdownMenuItem(
                                value: val,
                                child: Text(
                                  val,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList()),
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        hintText: cubit.widthHintWords,
                        controller: cubit.widthController,
                        preWidget: DropdownButton(
                            underline: SizedBox(),
                            focusColor: Colors.black,
                            dropdownColor: yellowColor,
                            autofocus: true,
                            hint: Text('cm',
                                style: TextStyle(color: Colors.black)),
                            onTap: () {},
                            value: cubit.widthSelected,
                            onChanged: (newVal) {
                              cubit.selectWidthChoice(newVal);
                            },
                            items: cubit.menuList.map((val) {
                              return DropdownMenuItem(
                                value: val,
                                child: Text(
                                  val,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList()),
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        hintText: cubit.weightHintWords,
                        controller: cubit.weightController,
                        preWidget: DropdownButton(
                            underline: SizedBox(),
                            focusColor: Colors.black,
                            dropdownColor: yellowColor,
                            autofocus: true,
                            hint: Text('cm',
                                style: TextStyle(color: Colors.black)),
                            onTap: () {},
                            value: cubit.weightSelected,
                            onChanged: (newVal) {
                              cubit.selectWeightChoice(newVal);
                            },
                            items: cubit.menuList.map((val) {
                              return DropdownMenuItem(
                                value: val,
                                child: Text(
                                  val,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList()),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text("القابلية للكسر "),
                            cubit.no
                                ? ToggleNoIconCustomDesign(
                                    downOnTapFunction: () {
                                      cubit.performYes();
                                    },
                                    upOnTapFunction: () {
                                      cubit.performNo();
                                    },
                                    containerColor: greyColor,
                                    upContainerColor: yellowColor,
                                    downContainerColor: darkGreyColor,
                                    upText: Text("لا"),
                                    downText: Text("نعم"),
                                  )
                                : ToggleNoIconCustomDesignUpdate(
                                    downOnTapFunction: () {
                                      cubit.performYes();
                                    },
                                    upOnTapFunction: () {
                                      cubit.performNo();
                                    },
                                    containerColor: greyColor,
                                    upContainerColor: darkGreyColor,
                                    downContainerColor: yellowColor,
                                    upText: Text("لا"),
                                    downText: Text("نعم"),
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ButtonCustomDesign(
                          text: Text(
                            "أحسب شحنتك",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          inkwellFunc: () {
                            navigateAndBack(
                                context,  layout: CalculateChargeSecondScreen());
                          },
                          containerColor: purpleColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
