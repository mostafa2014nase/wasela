import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/states.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/constants/themes.dart';

import 'bloc/cubit_class.dart';

class AddShipFromMobileApp extends StatelessWidget {
  AddShipFromMobileApp({Key? key}) : super(key: key);
  var formValidCreateShipment = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewShipCubitClass, AddNewShipStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AddNewShipCubitClass.get(context);
        return Scaffold(
          appBar: generateAppBarForCompanyMainScreens(
            title: "أضافة شحنة جديدة",
            svgPath: "noun-application-1603837",
            context: context,
            imageSize: 80.0,
            mainScreen: false,
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
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      underline: const SizedBox(),
                                      focusColor: Colors.black,
                                      dropdownColor: yellowColor,
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
                                        child: Text("المدينة",
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
                                                  color: Colors.black),
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
                                      dropdownColor: yellowColor,
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
                                        child: Text("المنطقة",
                                            style:
                                                TextStyle(color: purpleColor)),
                                      ),
                                      onTap: () {},
                                      value: cubit.selectedArea,
                                      onChanged: (newVal) {
                                        cubit.selectFromAreaChoices(newVal);
                                      },
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
                                                  color: Colors.black),
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
                                  dropdownColor: yellowColor,
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
                                    child: Text("اختر نوع الخدمة",
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
                                              color: Colors.black),
                                          //textAlign: TextAlign.right,
                                        ),
                                      ),
                                    );
                                  }).toList()),
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
                                        pageBuilder: (BuildContext buildContext,
                                            Animation animation,
                                            Animation secondaryAnimation) {
                                          return Container(
                                            height: 200.0,
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 20.0,
                                              vertical: 250.0,
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
                                                    "أضافة شحنة جديدة تلغى إمكانية تعديل بيانات الشحنة الحالية لذا برجاء التأكد من صحة البيانات قبل الضغط على ( تأكيد )",
                                                    style: lightTheme
                                                        .textTheme.bodyText1!
                                                        .copyWith(
                                                      color: yellowColor,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 15.0,
                                                    vertical: 15.0,
                                                  ),
                                                  child: Text(
                                                    "هل انت متأكد من إضافة شحنة جديدة ؟",
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
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10.0,
                                                                    horizontal:
                                                                        50.0),
                                                            child: Text(
                                                              "الغاء",
                                                              style: lightTheme
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                fontSize: 20,
                                                                color:
                                                                    purpleColor,
                                                              ),
                                                              textAlign:
                                                                  TextAlign.end,
                                                            ),
                                                          ),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color: Colors.white,
                                                      ),
                                                      Material(
                                                        child: InkWell(
                                                          onTap: () {
                                                            cubit.collectShipmentsOrder();
                                                            cubit.resetAllData();
                                                            backToPrevious(context);
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
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
                                                                  TextAlign.end,
                                                            ),
                                                          ),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
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
                                child: ConditionalBuilder(
                                  condition: state is ! CreateNewShipmentOrderLoadingState,
                                  builder: (context){
                                    return InkWell(
                                      onTap: () {
                                        if(formValidCreateShipment.currentState!.validate()){
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
                                                fontSize: 20, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  fallback: (context)=>const Center(child: CircularProgressIndicator(),),
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
  return Icon(
    Icons.star,
    color: yellowColor,
    size: 20.0,
  );
}
