import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/states.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/ship_data.dart';

import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/constants/themes.dart';

import 'bloc/cubit_class.dart';

class AddShipFromMobileApp extends StatelessWidget {
  const AddShipFromMobileApp({Key? key}) : super(key: key);

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
                      "بيانات المرسل اليه الشحنة",
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
                        controller: cubit.receiverName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "أسم المرسل اليه",
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
                        controller: cubit.cost,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "COD المبلغ المستحق",
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomDesignUnActive(
                            height: 50,
                            borderColor: purpleColor,
                            containerColor: Colors.transparent,
                            text: DropdownButton(
                                alignment: AlignmentDirectional.bottomCenter,
                                underline: SizedBox(),
                                focusColor: Colors.black,
                                dropdownColor: yellowColor,
                                icon: CustomDesignUnActive(
                                  width: 40.0,
                                  borderRadius: 5.0,
                                  containerColor: purpleColor,
                                  borderColor: purpleColor,
                                  text: Icon(Icons.arrow_drop_down,
                                      color: Colors.white, size: 30.0),
                                ),
                                isExpanded: true,
                                hint: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 10.0),
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
                                        style: const TextStyle(
                                            color: Colors.black),
                                        //textAlign: TextAlign.right,
                                      ),
                                    ),
                                  );
                                }).toList()),
                          ),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Expanded(
                          child: CustomDesignUnActive(
                            height: 50,
                            borderColor: purpleColor,
                            containerColor: Colors.transparent,
                            text: DropdownButton(
                                alignment: AlignmentDirectional.bottomCenter,
                                underline: SizedBox(),
                                focusColor: Colors.black,
                                dropdownColor: yellowColor,
                                icon: CustomDesignUnActive(
                                  width: 40.0,
                                  borderRadius: 5.0,
                                  containerColor: purpleColor,
                                  borderColor: purpleColor,
                                  text: Icon(Icons.arrow_drop_down,
                                      color: Colors.white, size: 30.0),
                                ),
                                isExpanded: true,
                                hint: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 10.0),
                                  child: Text("المنطقة",
                                      style: TextStyle(color: purpleColor)),
                                ),
                                onTap: () {},
                                value: cubit.selectedArea,
                                onChanged: (newVal) {
                                  cubit.selectFromAreaChoices(newVal);
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
                        controller: cubit.mobile,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "موبايل 1",
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
                        controller: cubit.mobile2,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "موبايل 2 ( أختياري )",
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
                        controller: cubit.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: purpleColor),
                            hintText: "البريد الألكتروني",
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
                    InkWell(
                      onTap: (){
                        navigateAndBack(context, layout: ShipData());
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40.0),
                        decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 0.8,
                              color: purpleColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 8.0),
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    backgroundColor: purpleColor,
                                    radius: 18,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.0,),
                              Text(
                                "الذهاب لأضافة بيانات الشحنة",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
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
