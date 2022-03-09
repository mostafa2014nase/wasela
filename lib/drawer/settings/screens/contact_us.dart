import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

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
//backToPrevious(context);
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
                  child: SvgPicture.asset(
                    "Assets/images/menu.svg",
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            title: Padding(
              padding: isArabic!
                  ? const EdgeInsetsDirectional.only(start: 80)
                  : const EdgeInsetsDirectional.only(start: 80),
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
                        "تواصل معنا",
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
                              "الرد عن طريق مكالمة",
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
                              "الرد عن طريق الأيميل",
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
                      "إرسال",
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
                  hintText: "الاسم بالكامل",
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
                  hintText: "رقم الهاتف",
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
                  hintText: "البريد الإلكترونى",
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
                  hintText: "نص الرسالة",
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
                  hintText: "الاسم بالكامل",
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
                  hintText: "البريد الإلكترونى",
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
                  hintText: "نص الرسالة",
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
