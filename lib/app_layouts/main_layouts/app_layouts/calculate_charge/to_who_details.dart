import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/states.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/calculate_charge/paying_methods.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import '../../../../helper_methods/functions/functions_needed.dart';

class ToWhoDataDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculateChargingCubitClass, CalculateChargingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CalculateChargingCubitClass.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: purpleColor,
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 40),
                    child: Text(
                      LocaleKeys.toWhoScreenAddress.tr(),
                      style: TextStyle(fontSize: 25, height: 1.5),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none,
                        size: 40,
                      )),
                ],
              ),
            ),
            leading: IconButton(
              onPressed: () {
                backToPrevious(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ScreenItemsBuilder(
                    name: cubit.completeName,
                    phone: cubit.phoneNumber,
                    email: cubit.email,
                    msg: cubit.message,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            //primary : const Color(0xff6201ee),
                            primary: yellowColor,
                            background: Colors.red,
                            secondary: yellowColor,
                            primaryContainer: Colors.yellow,
                            onPrimary: Colors.black,
                            // header background color
                            onSurface: Colors.white,
                          ),
                          dialogTheme: DialogTheme(
                            backgroundColor: purpleColor,
                          ),
                          textSelectionTheme: TextSelectionThemeData(
                            cursorColor: yellowColor,
                            selectionColor: Colors.red,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              primary: Colors.white, // button text color
                            ),
                          ),
                        ),
                        child: DatePickerDialog(
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 30)),
                          cancelText: "",
                          confirmText: "",
                          selectableDayPredicate: (time) {
                            return true;
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        child: ButtonCustomDesign(
                          width: 300,
                          text: Text(
                            LocaleKeys.toWhoScreenButton.tr(),
                            style: TextStyle(
                              color: purpleColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          inkwellFunc: () {
                            navigateAndBack(context,
                                layout: ContineuPayingMethod());
                          },
                          containerColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ScreenItemsBuilder extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController msg;

  const ScreenItemsBuilder({
    Key? key,
    required this.name,
    required this.phone,
    required this.email,
    required this.msg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        children: [
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
              controller: name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10.0),
                    child: SvgPicture.asset(
                      "Assets/images/placeholder.svg",
                      color: purpleColor,
                      width: 25,
                      height: 25,
                    ),
                  ),
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: purpleColor),
                  hintText: LocaleKeys.from.tr(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
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
              controller: name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10.0),
                    child: SvgPicture.asset(
                      "Assets/images/placeholder.svg",
                      color: purpleColor,
                      width: 25,
                      height: 25,
                    ),
                  ),
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: purpleColor),
                  hintText: LocaleKeys.to.tr(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
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
              controller: name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: purpleColor),
                  hintText: LocaleKeys.receiverName.tr(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
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
              controller: phone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: purpleColor),
                  hintText: LocaleKeys.receiverPhone.tr(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
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
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              scrollPadding: EdgeInsets.symmetric(vertical: 50),
              maxLines: 20,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              minLines: 1,
              strutStyle: StrutStyle(
                forceStrutHeight: true,
              ),
              controller: msg,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 50.0),
                  hintText: LocaleKeys.notes.tr(),
                  hintStyle: TextStyle(color: purpleColor),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: purpleColor),
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
        ],
      ),
    );
  }
}
