import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/states.dart';

import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/constants/themes.dart';

import 'bloc/cubit_class.dart';

class ShipData extends StatelessWidget {
  const ShipData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewShipCubitClass, AddNewShipStates>(
      listener: (context, state) {
        if (state is DataSentLoadingState) {
          var cubit = AddNewShipCubitClass.get(context);
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
                      child: InkWell(
                        child: Text(
                          "جاري رفع بيانات الشحنة",
                          style: lightTheme.textTheme.bodyText1?.copyWith(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          cubit.makeDataSent();
                        },
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
        } else if (state is DataSentSuccessState) {
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
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: CustomDesignUnActive(
                          text: Text(
                            "الذهاب للشحنات",
                            style: lightTheme.textTheme.bodyText1?.copyWith(
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
          appBar:generateAppBarForCompanyMainScreens(
            title: "أضافة شحنة جديدة",
            svgPath: "noun-application-1603837",
            context: context,
            imageSize: 80.0,
            mainScreen: false,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Padding(
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
                        controller: cubit.productName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "اسم المنتج",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: purpleColor, width: 1.5),
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
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: cubit.weight,
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
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
                                      borderRadius: BorderRadius.horizontal(
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
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: cubit.size,
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
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
                                      borderRadius: BorderRadius.horizontal(
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
                        controller: cubit.number,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "العدد",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: purpleColor, width: 1.5),
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
                        keyboardType:  TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "وصف المنتج",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: purpleColor, width: 1.5),
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
                    CustomDesignUnActive(
                      height: 70,
                      borderWidth: 1.5,
                      borderColor: purpleColor,
                      containerColor: Colors.transparent,
                      text: DropdownButton(
                          alignment: AlignmentDirectional.bottomCenter,
                          underline: const SizedBox(),
                          focusColor: Colors.black,
                          dropdownColor: yellowColor,
                          icon: CustomDesignUnActive(
                            width: 50.0,
                            height: 70.0,
                            borderRadius: 5.0,
                            containerColor: purpleColor,
                            borderColor: purpleColor,
                            text: const Icon(Icons.arrow_drop_down,
                                color: Colors.white, size: 30.0),
                          ),
                          isExpanded: true,
                          hint: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 10.0),
                            child: Text("المدينة",
                                style: TextStyle(color: purpleColor)),
                          ),
                          onTap: () {},
                          value: cubit.selectedCity,
                          onChanged: (newVal) {
                            cubit.selectFromCityChoices(newVal);
                          },
                          items: cubit.cityList.map((val) {
                            return DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: val,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 10.0),
                                child: Text(
                                  val,
                                  style: const TextStyle(color: Colors.black),
                                  //textAlign: TextAlign.right,
                                ),
                              ),
                            );
                          }).toList()),
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
                        textAlign: TextAlign.start,
                        maxLines: 8,
                        textAlignVertical: TextAlignVertical.top,
                        controller: cubit.mobile,
                        keyboardType:  TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 20.0),
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "ملاحظات",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: purpleColor, width: 1.5),
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
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            //margin: const EdgeInsets.symmetric(horizontal: 40.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  width: 0.8,
                                  color: purpleColor,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: purpleColor,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 17,
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 8.0),
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
                                    "أضافة منتج جديد",
                                    style: TextStyle(
                                        fontSize: 17, color: purpleColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              cubit.loadingFun();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: purpleColor,
                                  borderRadius: BorderRadius.circular(10.0),
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
            ),
          ),
        );
      },
    );
  }
}
