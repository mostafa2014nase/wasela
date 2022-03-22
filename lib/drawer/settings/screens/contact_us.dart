import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/notifications/notifications_screen.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import '../bloc/cubit_class.dart';
import '../bloc/states.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubitClass, DrawerStates>(
      listener: (context, state) {
        print("state now is $state");
      },
      builder: (context, state) {
        var cubit = DrawerCubitClass.get(context);
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
            title: Padding(
              padding: const EdgeInsetsDirectional.only(start: 80),
              // : const EdgeInsetsDirectional.only(start: 80),
              child: Row(
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        "Assets/images/settings (3).svg",
                        width: 40,
                        height: 40,
                        color: Colors.white,
                      ),
                      Text(
                        LocaleKeys.settings4.tr(),
                        style: TextStyle(fontSize: 25, height: 1.5),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: greyColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                cubit.swapToCallAnswer();
                              },
                              child: Icon(
                                cubit.isCall
                                    ? Icons.adjust_sharp
                                    : Icons.circle_outlined,
                                color: purpleColor,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              LocaleKeys.contactUs1.tr(),
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  cubit.swapToEmailAnswer();
                                },
                                child: Icon(
                                  cubit.isCall
                                      ? Icons.circle_outlined
                                      : Icons.adjust_sharp,
                                  color: purpleColor,
                                  size: 40,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              LocaleKeys.contactUs2.tr(),
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  cubit.isCall
                      ? CallAnswer(
                          name: cubit.completeName,
                          phone: cubit.phoneNumber,
                          email: cubit.email,
                          msg: cubit.message,
                        )
                      : EmailAnswer(
                          name: cubit.completeName,
                          email: cubit.email,
                          msg: cubit.message,
                        ),
                  ButtonCustomDesign(
                    width: 300,
                    text: Text(
                      LocaleKeys.dialogSend.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    inkwellFunc: () {},
                    containerColor: purpleColor,
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

class CallAnswer extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController msg;

  const CallAnswer(
      {Key? key,
      required this.name,
      required this.phone,
      required this.email,
      required this.msg})
      : super(key: key);

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
                  fillColor: Colors.white,
                  hintText: LocaleKeys.contactUsCall1.tr(),
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
                  hintText: LocaleKeys.contactUsCall2.tr(),
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
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: LocaleKeys.contactUsCall3.tr(),
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
                  hintText: LocaleKeys.contactUsCall4.tr(),
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

class EmailAnswer extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController msg;

  const EmailAnswer(
      {Key? key, required this.name, required this.email, required this.msg})
      : super(key: key);

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
                  fillColor: Colors.white,
                  hintText: LocaleKeys.contactUsCall1.tr(),
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
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: LocaleKeys.contactUsCall3.tr(),
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
                  hintText: LocaleKeys.contactUsCall4.tr(),
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
