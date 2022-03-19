import 'package:easy_localization/easy_localization.dart';
import 'package:wasela/comapny_app/app_layouts/injunction/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/injunction/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class InjunctionsScreenForCompanyApp extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InjunctionsAppCubitClass, InjunctionsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InjunctionsAppCubitClass.get(context);
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
                              paddingValue: 8,
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
                              paddingValue: 8,
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
                              paddingValue: 8,
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
                        ? const ChargeTo()
                        : const ChargeFrom()
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
    return BlocConsumer<InjunctionsAppCubitClass, InjunctionsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InjunctionsAppCubitClass.get(context);
        return Container(
          color: greyColor,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 175,
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40.0),
                    alignment: AlignmentDirectional.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(50.0),
                        left: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "Assets/images/placeholder.svg",
                            color: Colors.black,
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            LocaleKeys.calculateScreenTab3Details1.tr(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    )),
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
                    hint: Text(LocaleKeys.cm.tr(),
                        style: TextStyle(color: Colors.black)),
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
                    hint: Text(LocaleKeys.cm.tr(),
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
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList()),
              ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                hintText: cubit.weightHintWords,
                controller: cubit.weightController,
                postWidget: DropdownButton(
                    underline: const SizedBox(),
                    focusColor: Colors.black,
                    dropdownColor: yellowColor,
                    autofocus: true,
                    hint: Text(LocaleKeys.weight1.tr(),
                        style: TextStyle(color: Colors.black)),
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
              CustomTextFormField(
                keyboardType: TextInputType.number,
                hintText: cubit.heightHintWords,
                controller: cubit.heightController,
                postWidget: DropdownButton(
                    underline: const SizedBox(),
                    focusColor: Colors.black,
                    dropdownColor: yellowColor,
                    autofocus: true,
                    hint: Text(LocaleKeys.cm.tr(),
                        style: TextStyle(color: Colors.black)),
                    onTap: () {},
                    value: cubit.heightSelected,
                    onChanged: (newVal) {
                      cubit.selectHeightChoice(newVal);
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: DropdownButton(
                    isExpanded: true,
                    menuMaxHeight: 250.0,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                    focusColor: Colors.black,
                    dropdownColor: yellowColor,
                    autofocus: true,
                    hint: Text(LocaleKeys.kind.tr(),
                        style: TextStyle(color: Colors.black)),
                    onTap: () {},
                    value: cubit.shipSelected,
                    onChanged: (newVal) {
                      cubit.selectShipKindChoice(newVal);
                    },
                    items: cubit.shippingKindMenu.map((val) {
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
                            upText: Text(LocaleKeys.no.tr()),
                            downText: Text(LocaleKeys.yes.tr()),
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
                            upText: Text(LocaleKeys.no.tr()),
                            downText: Text(LocaleKeys.yes.tr()),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ButtonCustomDesign(
                  text: Text(
                    LocaleKeys.calculateShipping.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  inkwellFunc: () {},
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
    return BlocConsumer<InjunctionsAppCubitClass, InjunctionsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InjunctionsAppCubitClass.get(context);
        return Container(
          color: greyColor,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                      alignment: AlignmentDirectional.bottomCenter,
                      underline: put_line(),
                      focusColor: Colors.black,
                      dropdownColor: yellowColor,
                      isExpanded: true,
                      hint: Text(LocaleKeys.calculateScreenChoose.tr(),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: ButtonCustomDesign(
                  text: Text(
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
    return BlocConsumer<InjunctionsAppCubitClass, InjunctionsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InjunctionsAppCubitClass.get(context);
        return Container(
          color: greyColor,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                      alignment: AlignmentDirectional.bottomCenter,
                      underline: put_line(),
                      focusColor: Colors.black,
                      dropdownColor: yellowColor,
                      isExpanded: true,
                      hint: Text(LocaleKeys.calculateScreenChoose.tr(),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: ButtonCustomDesign(
                  text: Text(
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
