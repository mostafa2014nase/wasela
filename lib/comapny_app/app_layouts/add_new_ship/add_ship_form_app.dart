import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/states.dart';
import 'package:wasela/comapny_app/app_layouts/notifications/notifications_screen.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/comapny_app/app_layouts/ship/charge_screen.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'bloc/cubit_class.dart';

class AddShipFromMobileApp extends StatelessWidget {
  AddShipFromMobileApp({Key? key}) : super(key: key);
  var formValidCreateShipment = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewShipCubitClass, AddNewShipStates>(
      listener: (context, state) {
        var cubit = AddNewShipCubitClass.get(context);
        if (state is CreateNewShipmentOrderLoadingState) {
          myShowDialogForMarketing(
              context: context,
              alertDialog: CustomAlertDialogForMarketing(
                bodyColor: purpleColor,
                imageBackColor: purpleColor,
                backGroundImageColor: Colors.white,
                mainWidgetText: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      child: Text(
                        "جاري رفع بيانات الشحنة",
                        style: lightTheme.textTheme.bodyText1?.copyWith(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.transparent,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const CupertinoActivityIndicator(
                      radius: 50.0,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
                topImage: SvgPicture.asset(
                  "Assets/images/noun-excel-2788108.svg",
                  width: 80,
                  height: 80,
                  color: Colors.white,
                ),
              ));
        }
        else if (state is ShowErrorMsgInSnackBar) {
          Navigator.pop(context);
          showToast(context, cubit.completeShowMsg, ToastStates.warning,
              textColor: Colors.black);
        }
        else if (state is ShowErrorMsgRedInSnackBar) {
          Navigator.pop(context);
          showToast(
            context,
            cubit.completeShowMsg,
            ToastStates.error,
          );
        }
        else if (state is CreateNewShipmentOrderSuccessState) {
          Navigator.pop(context);
          myShowDialogForMarketing(
              context: context,
              alertDialog: CustomAlertDialogForMarketing(
                bodyColor: purpleColor,
                imageBackColor: purpleColor,
                backGroundImageColor: Colors.white,
                mainWidgetText: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "تم رفع بيانات الشحنة بنجاح",
                      style: lightTheme.textTheme.bodyText1?.copyWith(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 80.0,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    BlocConsumer<ShipForCompanyAppCubitClass, ShipStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var shipCubit =
                            ShipForCompanyAppCubitClass.get(context);
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              backToPrevious(context);
                              backToPrevious(context);
                              shipCubit.tempList.length = 0;
                              shipCubit.getAllShipmentsData();
                              navigateAndFinish(context,
                                  layout: ShipScreenForCompanyApp());
                              cubit.resetAllData();
                            },
                            child: CustomDesignUnActive(
                              text: Text(
                                "الذهاب للشحنات",
                                style: lightTheme.textTheme.bodyText1!.copyWith(
                                  fontSize: 25,
                                  color: purpleColor,
                                ),
                              ),
                              borderColor: Colors.white,
                              containerColor: Colors.white,
                              borderRadius: 10.0,
                              width: 200.0,
                              height: 60.0,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
                topImage: SvgPicture.asset(
                  "Assets/images/wallet.svg",
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
              ));
        }
      },
      builder: (context, state) {
        var cubit = AddNewShipCubitClass.get(context);
        return Scaffold(
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
                  cubit.resetAllData();
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
                  "Assets/images/noun-application-1603837.svg",
                  width: 80.0,
                  height: 80.0,
                  color: Colors.white,
                ),
                Text(
                  "أضافة شحنة جديدة",
                  style: TextStyle(fontSize: 25, height: 1.5),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Form(
                key: formValidCreateShipment,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "بيانات المرسل اليه الشحنة",
                            style:
                            TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "this field must be not empty";
                                }
                                return null;
                              },
                              controller: cubit.receiverName,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  suffixIcon: starSuffixIcon(),
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "أسم المرسل اليه",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "phone must be not empty";
                                }
                                if (value.length != 11) {
                                  return "phone number is not correct";
                                }
                                return null;
                              },
                              controller: cubit.mobile,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  suffixIcon: starSuffixIcon(),
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "موبايل ",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty == false) {
                                  if (value.length != 11) {
                                    return "phone number is not correct";
                                  }
                                  if (value == cubit.mobile.text) {
                                    return "phone number must be different or leave it empty";
                                  }
                                }
                                return null;
                              },
                              controller: cubit.mobile2,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "موبايل 2 ( أختياري )",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "this field must be not empty";
                                }
                                return null;
                              },
                              controller: cubit.email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  suffixIcon: starSuffixIcon(),
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "البريد الألكتروني",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomDesignUnActive(
                                  height: 50,
                                  borderColor: purpleColor,
                                  containerColor: Colors.transparent,
                                  text: DropdownButton(
                                      menuMaxHeight: 300.0,
                                      alignment:
                                      AlignmentDirectional.bottomCenter,
                                      underline: const SizedBox(),
                                      focusColor: Colors.black,
                                      dropdownColor: greyColortwoo,
                                      icon: CustomDesignUnActive(
                                        width: 40.0,
                                        borderRadius: 5.0,
                                        containerColor: purpleColor,
                                        borderColor: purpleColor,
                                        text: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 30.0),
                                      ),
                                      isExpanded: true,
                                      hint: Padding(
                                        padding:
                                        const EdgeInsetsDirectional.only(
                                            start: 10.0),
                                        child: Text("المدينة",
                                            style: TextStyle(
                                                color: purpleColor,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      onTap: () {
                                        //cubit.resetAllAreas();
                                      },
                                      value: cubit.selectedCity,
                                      onChanged: (newVal) {
                                        cubit.selectFromCityChoices(newVal);
                                      },
                                      items: cubit.cityList.map((val) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional
                                              .centerStart,
                                          value: val,
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional
                                                .only(start: 10.0),
                                            child: Text(
                                              val,
                                              style: TextStyle(
                                                  color: purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                              //textAlign: TextAlign.right,
                                            ),
                                          ),
                                        );
                                      }).toList()),
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                child: CustomDesignUnActive(
                                  height: 50,
                                  borderColor: purpleColor,
                                  containerColor: Colors.transparent,
                                  text: DropdownButton(
                                      alignment:
                                      AlignmentDirectional.bottomCenter,
                                      underline: const SizedBox(),
                                      focusColor: Colors.black,
                                      dropdownColor: greyColortwoo,
                                      menuMaxHeight: 250.0,
                                      icon: CustomDesignUnActive(
                                        width: 40.0,
                                        borderRadius: 5.0,
                                        containerColor: purpleColor,
                                        borderColor: purpleColor,
                                        text: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 30.0),
                                      ),
                                      isExpanded: true,
                                      hint: Padding(
                                        padding:
                                        const EdgeInsetsDirectional.only(
                                            start: 10.0),
                                        child: Text("المنطقة",
                                            style: TextStyle(
                                                color: purpleColor,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      onTap: () {},
                                      value: cubit.selectedArea,
                                      onChanged: (newVal) {
                                        cubit.selectFromAreaChoices(newVal);
                                      },
                                      items: cubit.areaList.map((val) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional
                                              .centerStart,
                                          value: val,
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional
                                                .only(start: 10.0),
                                            child: Text(
                                              val,
                                              style: TextStyle(
                                                  color: purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                              //textAlign: TextAlign.right,
                                            ),
                                          ),
                                        );
                                      }).toList()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "this field must be not empty";
                                }
                                return null;
                              },
                              controller: cubit.address,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  suffixIcon: starSuffixIcon(),
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "العنوان بالتفصيل",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: cubit.customerCode,
                              keyboardType:
                              const TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "كود العميل",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "بيانات الشحنة",
                            style:
                            TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "this field must be not empty";
                                }
                                return null;
                              },
                              controller: cubit.shipmentName,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  suffixIcon: starSuffixIcon(),
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "أسم المنتجات",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "this field must be not empty";
                                }
                                return null;
                              },
                              controller: cubit.cost,
                              keyboardType:
                              const TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                  suffixIcon: starSuffixIcon(),
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "سعر المنتجات بالجنيه",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(10.0),
                                          left: Radius.circular(10.0),
                                        ),
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: TextFormField(
                                        controller: cubit.weight,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(),
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            hintStyle:
                                            TextStyle(color: purpleColor),
                                            hintText: "الوزن",
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: purpleColor,
                                                    width: 1.5),
                                                borderRadius:
                                                const BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                )),
                                            border: const OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(10.0),
                                          left: Radius.circular(10.0),
                                        ),
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: TextFormField(
                                        controller: cubit.size,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            hintStyle:
                                            TextStyle(color: purpleColor),
                                            hintText: "الحجم",
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: purpleColor,
                                                    width: 1.5),
                                                borderRadius:
                                                const BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                )),
                                            border: const OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.horizontal(
                                                  right: Radius.circular(10.0),
                                                  left: Radius.circular(10.0),
                                                ))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if(cubit.limitWeight != null && cubit.unLimitPriceForWeightUnite != null)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("اقصى وزن بدون رسوم ${cubit.limitWeight} كيلو جرام ",style: TextStyle(color: Colors.green),),
                                    Text("سعر الكيلو الزائد ${cubit.unLimitPriceForWeightUnite} جنيه ",style: TextStyle(color: yellowColor)),
                                  ],
                                ),
                            ],
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "this field must be not empty";
                                }
                                return null;
                              },
                              controller: cubit.count,
                              keyboardType:
                              const TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                  suffixIcon: starSuffixIcon(),
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "العدد",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(vertical: 10.0),
                            child: CustomDesignUnActive(
                              height: 70,
                              borderColor: purpleColor,
                              containerColor: Colors.transparent,
                              text: DropdownButton(
                                  alignment:
                                  AlignmentDirectional.bottomCenter,
                                  underline: const SizedBox(),
                                  focusColor: Colors.black,
                                  dropdownColor: greyColortwoo,
                                  icon: CustomDesignUnActive(
                                    width: 40.0,
                                    height: 70,
                                    borderRadius: 5.0,
                                    containerColor: purpleColor,
                                    borderColor: purpleColor,
                                    text: const Icon(Icons.arrow_drop_down,
                                        color: Colors.white, size: 30.0),
                                  ),
                                  isExpanded: true,
                                  hint: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 10.0),
                                    child: Text("اختر نوع الخدمة",
                                        style: TextStyle(
                                            color: purpleColor,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  onTap: () {
                                    //cubit.resetAllAreas();
                                  },
                                  value: cubit.selectedService,
                                  onChanged: (newVal) {
                                    cubit.selectFromServiceChoices(newVal);
                                  },
                                  items: cubit.serviceTypes.map((val) {
                                    return DropdownMenuItem(
                                      alignment:
                                      AlignmentDirectional.centerStart,
                                      value: val,
                                      child: Padding(
                                        padding:
                                        const EdgeInsetsDirectional.only(
                                            start: 10.0),
                                        child: Text(
                                          val,
                                          style: TextStyle(
                                              color: purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                          //textAlign: TextAlign.right,
                                        ),
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0),
                                child: CustomDesignUnActive(
                                  height: 70,
                                  borderColor: purpleColor,
                                  containerColor: Colors.transparent,
                                  text: DropdownButton(
                                      alignment:
                                      AlignmentDirectional.bottomCenter,
                                      underline: const SizedBox(),
                                      focusColor: Colors.black,
                                      dropdownColor: greyColortwoo,
                                      icon: CustomDesignUnActive(
                                        width: 40.0,
                                        height: 70,
                                        borderRadius: 5.0,
                                        containerColor: purpleColor,
                                        borderColor: purpleColor,
                                        text: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 30.0),
                                      ),
                                      isExpanded: true,
                                      hint: Padding(
                                        padding:
                                        const EdgeInsetsDirectional.only(
                                            start: 10.0),
                                        child: Text("اختر الخدمة الإضافية",
                                            style: TextStyle(
                                                color: purpleColor,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      onTap: () {
                                        //cubit.resetAllAreas();
                                      },
                                      value: cubit
                                          .selectedAdditionalServiceTypes,
                                      onChanged: (newVal) {
                                        cubit
                                            .selectFromAdditionalServiceTypesChoices(
                                            newVal);
                                      },
                                      items: cubit.additionalServiceTypes
                                          .map((val) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional
                                              .centerStart,
                                          value: val,
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional
                                                .only(start: 10.0),
                                            child: Text(
                                              val,
                                              style: TextStyle(
                                                  color: purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                              //textAlign: TextAlign.right,
                                            ),
                                          ),
                                        );
                                      }).toList()),
                                ),
                              ),
                              if (cubit.additionalServiceTypesCostNow != null)
                                Text(
                                  "سعر الخدمة ${cubit.additionalServiceTypesCostNow} جنيه ",
                                  style: TextStyle(color: Colors.green),
                                )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                              onTap: () {
                                DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2025, 6, 7),
                                  onChanged: (date) {
                                    log('change $date');
                                  },
                                  onConfirm: (date) {
                                    cubit.getDate(myDate: date);
                                  },
                                  currentTime: DateTime.now(),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 70.0,
                                      width: 150.0,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: purpleColor,
                                        borderRadius:
                                        const BorderRadiusDirectional
                                            .horizontal(
                                          start: Radius.circular(10.0),
                                          end: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'تاريخ وصول الشحنة',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                          height: 70.0,
                                          width: 150.0,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: purpleColor),
                                            borderRadius:
                                            const BorderRadiusDirectional
                                                .horizontal(
                                              start: Radius.circular(10.0),
                                              end: Radius.circular(10.0),
                                            ),
                                          ),
                                          child: cubit.stringDate == ""
                                              ? Text(
                                            "لم يتم تحديد تاريخ الوصول بعد",
                                            style: TextStyle(
                                                color: textGreyTwoColor,
                                                fontSize: 15.0),
                                            textAlign: TextAlign.center,
                                          )
                                              : Text(
                                            DateFormat("y/MM/dd")
                                                .format(cubit.date!),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18.0),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: cubit.description,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "وصف المنتج",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              maxLines: 8,
                              textAlignVertical: TextAlignVertical.top,
                              controller: cubit.notes,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 20.0),
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "ملاحظات",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius:
                                      const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ))),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: (){
                              AddNewShipCubitClass.get(context).calculateShipmentsCostsDetails();
                            },
                            child: Container(
                              width: 200.0,
                              alignment: Alignment.center,
                              //margin: const EdgeInsets.symmetric(horizontal: 40.0),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 0.8,
                                    color: purpleColor,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "معرقة التكلفة",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: purpleColor),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: purpleColor,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 16,
                                        child: Icon(
                                          Icons.arrow_downward,
                                          color: purpleColor,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if(cubit.shippingCost != null&& cubit.totalCost != null)
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text("تكلفة الشحن",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: purpleColor,
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                              border: Border.all(
                                                width: 0.8,
                                                color: Colors.white,
                                              )),
                                          child:  Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Text(
                                              "${cubit.shippingCost}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Text("جنيه",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text("الاجمالى",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: purpleColor,
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                              border: Border.all(
                                                width: 0.8,
                                                color: Colors.white,
                                              )),
                                          child:  Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Text(
                                              "${cubit.totalCost}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Text("جنيه",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    if (formValidCreateShipment.currentState!
                                        .validate()) {
                                      showGeneralDialog(
                                        context: context,
                                        pageBuilder: (BuildContext
                                        buildContext,
                                            Animation animation,
                                            Animation secondaryAnimation) {
                                          return Container(
                                            height: 200.0,
                                            margin:
                                            const EdgeInsets.symmetric(
                                              horizontal: 20.0,
                                              vertical: 300.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: purpleColor,
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 15.0,
                                                    vertical: 15.0,
                                                  ),
                                                  child: Text(
                                                    "برجاء التأكد من صحة كافة بيانات الشحنة قبل الضغط على ( تأكيد )",
                                                    style: lightTheme
                                                        .textTheme.bodyText1!
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Material(
                                                        child: InkWell(
                                                          onTap: () {
                                                            backToPrevious(
                                                                context);
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical:
                                                                10.0,
                                                                horizontal:
                                                                20.0),
                                                            child: Text(
                                                              "مراجعة البيانات ",
                                                              style: lightTheme
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                fontSize: 20,
                                                                color:
                                                                purpleColor,
                                                              ),
                                                              textAlign:
                                                              TextAlign
                                                                  .end,
                                                            ),
                                                          ),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            10.0),
                                                        color: Colors.white,
                                                      ),
                                                      Material(
                                                        child: InkWell(
                                                          onTap: () {
                                                            cubit
                                                                .collectShipmentsOrder();
                                                            cubit
                                                                .resetAllData();
                                                            backToPrevious(
                                                                context);
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical:
                                                                10.0,
                                                                horizontal:
                                                                50.0),
                                                            child: Text(
                                                              "تأكيد",
                                                              style: lightTheme
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                fontSize: 20,
                                                                color:
                                                                purpleColor,
                                                              ),
                                                              textAlign:
                                                              TextAlign
                                                                  .end,
                                                            ),
                                                          ),
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            10.0),
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }

                                    // if (formValidCreateShipment.currentState!
                                    //     .validate()) {
                                    //   cubit.collectShipmentsOrder();
                                    //   cubit.resetAllData();
                                    // }
                                  },
                                  child: Container(
                                    //margin: const EdgeInsets.symmetric(horizontal: 40.0),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.8,
                                          color: purpleColor,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6.0, horizontal: 4.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20.0,
                                            backgroundColor: purpleColor,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 16,
                                              child: Padding(
                                                padding:
                                                const EdgeInsetsDirectional
                                                    .only(start: 8.0),
                                                child: Icon(
                                                  Icons.arrow_back_ios,
                                                  color: purpleColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            "أضافة شحنة جديدة",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: purpleColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    if (formValidCreateShipment.currentState!
                                        .validate()) {
                                      cubit.createShipments();
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: purpleColor,
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.8,
                                          color: Colors.white,
                                        )),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text(
                                        "أتمام الشحنة",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ],
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

Widget starSuffixIcon() {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: SvgPicture.asset(
      "Assets/images/noun-required-1371268.svg",
      color: yellowColor,
      width:10.0,
      height: 10.0,
    ),
  );
}
