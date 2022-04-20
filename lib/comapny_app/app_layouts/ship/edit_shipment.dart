import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'bloc/cubit_class.dart';

class EditShipmentData extends StatelessWidget {
  EditShipmentData({Key? key}) : super(key: key);
  var formValidEditShipment = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShipForCompanyAppCubitClass, ShipStates>(
      listener: (context, state) {
        var cubit = ShipForCompanyAppCubitClass.get(context);
        if (state is EditShipmentOrderLoadingState) {
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
                        "جاري تعديل بيانات الشحنة",
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
        else if(state is ShowErrorEditMsgInSnackBar){
          Navigator.pop(context);
          showToast(context, cubit.completeShowMsg, ToastStates.warning,textColor: Colors.black);
        }
        else if(state is ShowErrorEditMsgRedInSnackBar){
          Navigator.pop(context);
          showToast(context, cubit.completeShowMsg, ToastStates.error,);
        }
        else if (state is EditShipmentOrderSuccessState) {
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
                      "تم تعديل بيانات الشحنة بنجاح",
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
                        var shipCubit = ShipForCompanyAppCubitClass.get(context);
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              backToPrevious(context);
                              backToPrevious(context);
                              //shipCubit.tempList.length = 0;
                              shipCubit.getAllShipmentsData();
                              cubit.resetAllData();
                              cubit.resetDropDownData();
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
        var cubit = ShipForCompanyAppCubitClass.get(context);
        return Scaffold(
          appBar: generateAppBarForCompanyMainScreens(
            title: "تعديل الشحنة",
            svgPath: "noun-application-1603837",
            context: context,
            imageSize: 80.0,
            mainScreen: true,
          ),
          body: WillPopScope(
            onWillPop: () async {
               cubit.resetAllData();
               cubit.resetDropDownData();
              return true;
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Form(
                  key: formValidEditShipment,
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
                              style: TextStyle(color: Colors.black, fontSize: 25),
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
                                    hintText: "COD المبلغ المستحق",
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
                                        borderRadius: const BorderRadius.horizontal(
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
                                      menuMaxHeight: 350.0,
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
                                          text: const Icon(Icons.arrow_drop_down,
                                              color: Colors.white, size: 30.0),
                                        ),
                                        isExpanded: true,
                                        hint: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.only(
                                              start: 10.0),
                                          child: Text(cubit.cityHint == "" ?"المدينة":cubit.cityHint,
                                              style:
                                              TextStyle(color: purpleColor)),
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
                                            alignment:
                                            AlignmentDirectional.centerStart,
                                            value: val,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .only(start: 10.0),
                                              child: Text(
                                                val,
                                                style: const TextStyle(
                                                    color: Colors.black , fontWeight: FontWeight.bold,fontSize: 18.0),
                                                //textAlign: TextAlign.right,
                                              ),
                                            ),
                                          );
                                        }).toList()),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30.0,
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
                                        icon: CustomDesignUnActive(
                                          width: 40.0,
                                          borderRadius: 5.0,
                                          containerColor: purpleColor,
                                          borderColor: purpleColor,
                                          text: const Icon(Icons.arrow_drop_down,
                                              color: Colors.white, size: 30.0),
                                        ),
                                        isExpanded: true,
                                        hint: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.only(
                                              start: 10.0),
                                          child: Text(cubit.areaHint == "" ?"المنطقة":cubit.areaHint,
                                              style:
                                              TextStyle(color: purpleColor)),
                                        ),
                                        onTap: () {},
                                        value: cubit.selectedArea,
                                        onChanged: (newVal) {
                                          cubit.selectFromAreaChoices(newVal);
                                        },
                                        menuMaxHeight: 250.0,
                                        items: cubit.areaList.map((val) {
                                          return DropdownMenuItem(
                                            alignment:
                                            AlignmentDirectional.centerStart,
                                            value: val,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .only(start: 10.0),
                                              child: Text(
                                                val,
                                                style: const TextStyle(
                                                    color: Colors.black , fontWeight: FontWeight.bold,fontSize: 18.0),
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
                              style: TextStyle(color: Colors.black, fontSize: 25),
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
                                    margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      controller: cubit.weight,
                                      keyboardType:
                                      TextInputType.text,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          hintStyle:
                                          TextStyle(color: purpleColor),
                                          hintText: "الوزن",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: purpleColor, width: 1.5),
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
                                    margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      controller: cubit.size,
                                      keyboardType:
                                      TextInputType.text,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          hintStyle:
                                          TextStyle(color: purpleColor),
                                          hintText: "الحجم",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: purpleColor, width: 1.5),
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
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                                      padding:
                                      const EdgeInsetsDirectional.only(
                                          start: 10.0),
                                      child: Text(cubit.serviceHint == "" ? "اختر نوع الخدمة":cubit.serviceHint,
                                          style:
                                          TextStyle(color: purpleColor)),
                                    ),
                                    onTap: () {
                                      //cubit.resetAllAreas();
                                    },
                                    value: cubit.selectedService,
                                    onChanged: (newVal) {
                                      cubit.selectFromServiceChoices(newVal);
                                    },
                                    menuMaxHeight: 250.0,
                                    items: cubit.serviceTypes.map((val) {
                                      return DropdownMenuItem(
                                        alignment:
                                        AlignmentDirectional.centerStart,
                                        value: val,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .only(start: 10.0),
                                          child: Text(
                                            val,
                                            style: const TextStyle(
                                                color: Colors.black , fontWeight: FontWeight.bold,fontSize: 18.0),
                                            //textAlign: TextAlign.right,
                                          ),
                                        ),
                                      );
                                    }).toList()),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    maxTime: DateTime(2025, 6, 7), onChanged: (date) {
                                      log('change $date');
                                    }, onConfirm: (date) {
                                      cubit.getDeliveryDate(myDate: date);
                                    },
                                    currentTime: DateTime.now(),);
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 70.0,
                                        width: 150.0,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: purpleColor,
                                          borderRadius: const BorderRadiusDirectional.horizontal(
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
                                      const SizedBox(width: 10.0,),
                                      Expanded(
                                        child: Container(
                                            height: 70.0,
                                            width: 150.0,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: purpleColor
                                              ),
                                              borderRadius: const BorderRadiusDirectional.horizontal(
                                                start: Radius.circular(10.0),
                                                end: Radius.circular(10.0),
                                              ),
                                            ),
                                            child:cubit.stringDeliveryDate == "" ?
                                            Text(
                                              "لم يتم تحديد تاريخ الوصول بعد",
                                              style: TextStyle(color: textGreyTwoColor,fontSize: 15.0),
                                              textAlign: TextAlign.center,
                                            ):
                                            Text(
                                              DateFormat("y/MM/dd").format(
                                                  cubit.deliveryDate!),
                                              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),
                                              textAlign: TextAlign.center,
                                            )
                                        ),
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
                                controller: cubit.mainNotes,
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
                              onTap: () {
                                if(formValidEditShipment.currentState!.validate()){
                                  cubit.editShipment(shipmentIdSent: cubit.shipmentId);
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
                                    "تأكيد تعديل بيانات الشحنة",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
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
          ),
        );
      },
    );
  }
}

Widget starSuffixIcon() {
  return Icon(
    Icons.star,
    color: yellowColor,
    size: 15.0,
  );
}
