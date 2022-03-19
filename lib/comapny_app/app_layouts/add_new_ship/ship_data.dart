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
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AddNewShipCubitClass.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 140,
            backgroundColor: purpleColor,
            centerTitle: true,
            foregroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                backToPrevious(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications,
                      size: 35,
                    )),
              ),
            ],
            title: Column(
              children: [
                SvgPicture.asset(
                  "Assets/images/noun-application-1603837.svg",
                  width: 100,
                  height: 100,
                  color: Colors.white,
                ),
                Text(
                  "أضافة شحنة جديدة",
                  style: TextStyle(fontSize: 25, height: 0.5),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "بيانات الشحنة",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(10.0),
                          left: Radius.circular(10.0),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
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
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0),
                                )),
                            border: OutlineInputBorder(
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
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: cubit.weight,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "الوزن",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(10.0),
                                    left: Radius.circular(10.0),
                                  ))),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.0),
                                left: Radius.circular(10.0),
                              ),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: cubit.size,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: purpleColor),
                                  hintText: "الحجم",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: purpleColor, width: 1.5),
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      )),
                                  border: OutlineInputBorder(
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(10.0),
                          left: Radius.circular(10.0),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: cubit.number,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "العدد",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: purpleColor, width: 1.5),
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0),
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10.0),
                              left: Radius.circular(10.0),
                            ))),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(10.0),
                          left: Radius.circular(10.0),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: cubit.description,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "وصف المنتج",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: purpleColor, width: 1.5),
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0),
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10.0),
                              left: Radius.circular(10.0),
                            ))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDesignUnActive(
                      height: 70,
                      borderWidth: 1.5,
                      borderColor: purpleColor,
                      containerColor: Colors.transparent,
                      text: DropdownButton(
                          alignment: AlignmentDirectional.bottomCenter,
                          underline: SizedBox(),
                          focusColor: Colors.black,
                          dropdownColor: yellowColor,
                          icon: CustomDesignUnActive(
                            width: 50.0,
                            height: 70.0,
                            borderRadius: 5.0,
                            containerColor: purpleColor,
                            borderColor: purpleColor,
                            text: Icon(Icons.arrow_drop_down,
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
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        maxLines: 8,
                        textAlignVertical: TextAlignVertical.top,
                        controller: cubit.mobile,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 20.0),
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "ملاحظات",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: purpleColor, width: 1.5),
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0),
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10.0),
                              left: Radius.circular(10.0),
                            ))),
                      ),
                    ),
                    SizedBox(
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
                                  SizedBox(
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
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              cubit.makeDataNotSent();
                              myShowDialogForMarketing(
                                  context: context,
                                  alertDialog: CustomAlertDialogForMarketing(
                                    bodyColor: purpleColor,
                                    imageBackColor: purpleColor,
                                    backGroundImageColor: Colors.white,
                                    mainWidgetText: cubit.isDataSent == false
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Material(
                                                child: InkWell(
                                                  child: Text(
                                                    "جاري رفع بيانات الشحنة",
                                                    style: lightTheme
                                                        .textTheme.bodyText1
                                                        ?.copyWith(
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
                                              SizedBox(
                                                height: 30.0,
                                              ),
                                              CupertinoActivityIndicator(
                                                radius: 50.0,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                            ],
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "تم رفع بيانات الشحنة بنجاح",
                                                style: lightTheme
                                                    .textTheme.bodyText1
                                                    ?.copyWith(
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30.0,
                                              ),
                                              Icon(
                                                Icons.check_circle,
                                                color: Colors.white,
                                                size: 80.0,
                                              ),
                                              SizedBox(
                                                height: 30.0,
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: CustomDesignUnActive(
                                                    text:
                                                        Text("الذهاب للشحنات",       style: lightTheme
                                                            .textTheme.bodyText1
                                                            ?.copyWith(
                                                          fontSize: 25,
                                                          color: purpleColor,
                                                        ),),
                                                    borderColor: Colors.white,
                                                    containerColor:
                                                        Colors.white,
                                                    borderRadius: 10.0,
                                                    width: 200.0,
                                                    height: 60.0,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
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
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
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
                    SizedBox(
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
