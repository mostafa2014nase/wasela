import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/cubit_class.dart';
import 'package:wasela/clients_app/app_layouts/main_layouts/app_layouts/calculate_charge/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

class ContineuPayingMethod extends StatelessWidget {
  TextEditingController discountCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculateChargingCubitClass, CalculateChargingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CalculateChargingCubitClass.get(context);
        return Scaffold(
          backgroundColor: greyColor,
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
                    padding: const EdgeInsetsDirectional.only(start: 60),
                    child: Text(
                      "وسائل الدفع",
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "أختر وسيلة الدفع",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: DecoratedContainerWithShadow(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        cubit.payFawry();
                                      },
                                      child: Icon(
                                        cubit.fawry
                                            ? Icons.adjust_sharp
                                            : Icons.circle_outlined,
                                        color: purpleColor,
                                        size: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "فوري",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: purpleColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "الدعم الفنى",
                                          style: lightTheme.textTheme.bodyText1
                                              ?.copyWith(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        SvgPicture.asset(
                                          "Assets/images/headphones.svg",
                                          width: 30,
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: DecoratedContainerWithShadow(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        cubit.payVodCash();
                                      },
                                      child: Icon(
                                        cubit.vodCash
                                            ? Icons.adjust_sharp
                                            : Icons.circle_outlined,
                                        color: purpleColor,
                                        size: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "فودافون كاش",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: purpleColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "الدعم الفنى",
                                          style: lightTheme.textTheme.bodyText1
                                              ?.copyWith(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        SvgPicture.asset(
                                          "Assets/images/headphones.svg",
                                          width: 30,
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: DecoratedContainerWithShadow(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        cubit.payVisa();
                                      },
                                      child: Icon(
                                        cubit.visa
                                            ? Icons.adjust_sharp
                                            : Icons.circle_outlined,
                                        color: purpleColor,
                                        size: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "بطاقة الأئتمان",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: purpleColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "الدعم الفنى",
                                          style: lightTheme.textTheme.bodyText1
                                              ?.copyWith(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        SvgPicture.asset(
                                          "Assets/images/headphones.svg",
                                          width: 30,
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: DecoratedContainerWithShadow(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        cubit.payMandoob();
                                      },
                                      child: Icon(
                                        cubit.mandoob
                                            ? Icons.adjust_sharp
                                            : Icons.circle_outlined,
                                        color: purpleColor,
                                        size: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "مندوب أسهل",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: purpleColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "الدعم الفنى",
                                          style: lightTheme.textTheme.bodyText1
                                              ?.copyWith(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        SvgPicture.asset(
                                          "Assets/images/headphones.svg",
                                          width: 30,
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: DecoratedContainerWithShadow(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        cubit.payCashPay();
                                      },
                                      child: Icon(
                                        cubit.cashPay
                                            ? Icons.adjust_sharp
                                            : Icons.circle_outlined,
                                        color: purpleColor,
                                        size: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "الدفع عند الاستلام",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: purpleColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "الدعم الفنى",
                                          style: lightTheme.textTheme.bodyText1
                                              ?.copyWith(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        SvgPicture.asset(
                                          "Assets/images/headphones.svg",
                                          width: 30,
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 220,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0),
                                ),
                              ),
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: TextFormField(
                                controller: discountCode,
                                keyboardType: TextInputType.numberWithOptions(),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(color: purpleColor),
                                    hintText: "كود الخصم",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: purpleColor),
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
                              width: 10,
                            ),
                            Expanded(
                              child: CustomDesignUnActive(
                                borderColor: purpleColor,
                                borderRadius: 5,
                                text: Text(
                                  "تطبيق الخصم",
                                  style: TextStyle(color: Colors.white),
                                ),
                                containerColor: purpleColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("قبل الخصم"),
                                CustomDesignUnActive(
                                  width: 100,
                                  borderColor: purpleColor,
                                  borderWidth: 0.8,
                                  borderRadius: 5,
                                  text: Text(
                                    "5000 جنية",
                                    style: TextStyle(color: purpleColor),
                                  ),
                                  containerColor: Colors.transparent,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("بعد الخصم"),
                                CustomDesignUnActive(
                                  width: 100,
                                  borderColor: purpleColor,
                                  borderWidth: 0.8,
                                  borderRadius: 5,
                                  text: Text(
                                    "4700 جنية",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  containerColor: purpleColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          alignment: Alignment.center,
                          padding: EdgeInsetsDirectional.only(start: 20),
                          width: 250,
                          height: 60,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: purpleColor,
                              )),
                          child: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(end: 50.0),
                            child: Text(
                              "أستخدم رصيدك",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: purpleColor,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                "Assets/images/confirm.svg",
                                color: purpleColor,
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
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
