import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/states.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/padge_two.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class CalculateChargeScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculateChargingCubitClass, CalculateChargingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CalculateChargingCubitClass.get(context);
        return Scaffold(
          appBar: generateAppBar(
            title: LocaleKeys.bottomNavItemsName3.tr(),
            svgPath: "wallet",
            context: context,
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
                              padding: EdgeInsets.all(8.0),
                              child: Text(LocaleKeys.calculateScreenTabs1.tr()),
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
                              padding: EdgeInsets.all(8.0),
                              child: Text(LocaleKeys.calculateScreenTabs2.tr()),
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
                              padding: EdgeInsets.all(8.0),
                              child: Text(LocaleKeys.calculateScreenTabs3.tr()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                cubit.leftChoice
                    ? const ChargeKind()
                    : cubit.middleChoice
                        ?const ChargeTo()
                        :const ChargeFrom()
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChargeKind extends StatelessWidget {
  const ChargeKind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculateChargingCubitClass, CalculateChargingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CalculateChargingCubitClass.get(context);
        return Container(
          color: greyColor,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              cubit.right
                  ? ToggleCustomDesign(
                sizedBoxWidthForDownPart: lang == "en" ?10: 30,
                      downOnTapFunction: () {
                        cubit.toggleLeft();
                      },
                      upOnTapFunction: () {
                        cubit.toggleRight();
                      },
                      containerColor: greyColor,
                      upContainerColor: yellowColor,
                      downContainerColor: purpleColor,
                      upIcon: const Icon(Icons.inbox_sharp),
                      downIcon:const Icon(
                        Icons.inbox_sharp,
                        color: Colors.white,
                      ),
                      upText: Text(
                        LocaleKeys.calculateScreenTab3Details1.tr(),
                        style:TextStyle(fontSize: 25,),
                      ),
                      downText:  Text(
                        LocaleKeys.calculateScreenTab3Details2.tr(),
                        style: TextStyle(color: Colors.white, fontSize: 25),
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
                      upIcon: const Icon(
                        Icons.inbox_sharp,
                        color: Colors.white,
                      ),
                      downIcon: const Icon(
                        Icons.inbox_sharp,
                      ),
                      upText:  Text(
                        LocaleKeys.calculateScreenTab3Details1.tr(),
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      downText:  Text(
                        LocaleKeys.calculateScreenTab3Details2.tr(),
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                hintText: cubit.longHintWords,
                controller: cubit.longController,
                postWidget: DropdownButton(
                    underline: const SizedBox(),
                    focusColor: Colors.black,
                    dropdownColor: yellowColor,
                    autofocus: true,
                    hint:  Text(LocaleKeys.cm.tr(), style: TextStyle(color: Colors.black)),
                    onTap: () {},
                    value: cubit.lengthSelected,
                    onChanged: (newVal) {
                      cubit.selectLengthChoice(newVal);
                    },
                    items: cubit.menuList.map((val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList()),
              ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                hintText: cubit.widthHintWords,
                controller: cubit.widthController,
                postWidget: DropdownButton(
                    underline: const SizedBox(),
                    focusColor: Colors.black,
                    dropdownColor: yellowColor,
                    autofocus: true,
                    hint:  Text(LocaleKeys.cm.tr(), style: TextStyle(color: Colors.black)),
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
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList()),
              ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                hintText: cubit.weightHintWords,
                controller: cubit.weightController,
                postWidget:  DropdownButton(
                    underline: const SizedBox(),
                    focusColor: Colors.black,
                    dropdownColor: yellowColor,
                    autofocus: true,
                    hint:  Text(LocaleKeys.weight1.tr(), style: TextStyle(color: Colors.black)),
                    onTap: () {},
                    value: cubit.weightSelected,
                    onChanged: (newVal) {
                      cubit.selectWeightChoice(newVal);
                    },
                    items: cubit.menu1List.map((val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  children: [
                     Text(LocaleKeys.toggle.tr()),
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
                            upText:  Text(LocaleKeys.no.tr()),
                            downText:  Text(LocaleKeys.yes.tr()),
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
                      upText:  Text(LocaleKeys.no.tr()),
                      downText:  Text(LocaleKeys.yes.tr()),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ButtonCustomDesign(
                  text:  Text(
                    LocaleKeys.calculateShipping.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  inkwellFunc: () {
                    navigateAndBack(context,
                        layout: CalculateChargeSecondScreen(fromCity: cubit.selectedPosition,toCity: cubit.selectedCity,));
                  },
                  containerColor: purpleColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChargeTo extends StatelessWidget {
  const ChargeTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculateChargingCubitClass, CalculateChargingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CalculateChargingCubitClass.get(context);
        return Container(
          color: greyColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    alignment: AlignmentDirectional.bottomCenter,
                      underline: put_line(),
                      focusColor: Colors.black,
                      dropdownColor: yellowColor,
                      isExpanded: true,
                      hint:  Text(LocaleKeys.calculateScreenChoose.tr(),
                          style: TextStyle(color: Colors.black)),
                      onTap: () {},
                      value: cubit.selectedCity,
                      onChanged: (newVal) {
                        cubit.selectFromCityChoices(newVal);
                      },
                      items: cubit.cityList.map((val) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: val,
                          child: Text(
                            val,
                            style: const TextStyle(color: Colors.black),
                            //textAlign: TextAlign.right,
                          ),
                        );
                      }).toList()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
                child: ButtonCustomDesign(
                  text:  Text(
                    LocaleKeys.calculateScreenNext.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  inkwellFunc: () {
                    cubit.chooseLeft();
                  },
                  containerColor: purpleColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
class ChargeFrom extends StatelessWidget {
  const ChargeFrom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculateChargingCubitClass, CalculateChargingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CalculateChargingCubitClass.get(context);
        return Container(
          color: greyColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    alignment: AlignmentDirectional.bottomCenter,
                      underline: put_line(),
                      focusColor: Colors.black,
                      dropdownColor: yellowColor,
                      isExpanded: true,
                      hint:  Text(LocaleKeys.calculateScreenChoose.tr(),
                          style: TextStyle(color: Colors.black)),
                      onTap: () {},
                      value: cubit.selectedPosition,
                      onChanged: (newVal) {
                        cubit.selectFromPositionChoices(newVal);
                      },
                      items: cubit.cityList.map((val) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: val,
                          child: Text(
                            val,
                            style: const TextStyle(color: Colors.black),
                            //textAlign: TextAlign.right,
                          ),
                        );
                      }).toList()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
                child: ButtonCustomDesign(
                  text:  Text(
                    LocaleKeys.calculateScreenNext.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  inkwellFunc: () {
                    cubit.chooseMiddle();
                  },
                  containerColor: purpleColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
