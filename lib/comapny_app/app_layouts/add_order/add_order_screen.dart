import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/add_order/bloc/add_order_cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/add_order/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

class AddOrder extends StatelessWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubitClass, AddOrderStates>(
      listener: (context, states) {},
      builder: (context, state) {
        var cubit = AddOrderCubitClass.get(context);
        return Scaffold(
          backgroundColor: greyColor,
          appBar: generateAppBarForCompanyMainScreens(
            mainScreen: true,
            context: context,
            title: "أضافة طلب",
            svgPath: "noun-customer-demand-3437164",
            imageSize: 80.0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "بيانات الطلب",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CustomDesignUnActive(
                      height: 70,
                      borderColor: purpleColor,
                      containerColor: Colors.transparent,
                      text: DropdownButton(
                          underline: const SizedBox(),
                          focusColor: yellowColor,
                          dropdownColor: greyColor,
                          focusNode: FocusNode(
                            descendantsAreFocusable: false,
                          ),
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
                            child: Text("أختر نوع الطلب",
                                style: TextStyle(color: purpleColor)),
                          ),
                          onTap: () {},
                          value: cubit.orderSelected,
                          onChanged: (newVal) {
                            cubit.selectKind(newVal);
                          },
                          items: cubit.orderKind.map((val) {
                            return DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: val,
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 10.0),
                                child: Text(
                                  val,
                                  style: TextStyle(color: purpleColor),
                                  //textAlign: TextAlign.right,
                                ),
                              ),
                            );
                          }).toList()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CustomDesignUnActive(
                      height: 70,
                      borderColor: purpleColor,
                      containerColor: Colors.transparent,
                      text: DropdownButton(
                          underline: const SizedBox(),
                          focusColor: yellowColor,
                          dropdownColor: greyColor,
                          focusNode: FocusNode(
                            descendantsAreFocusable: false,
                          ),
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
                            child: Text("أختر وسيلة النقل",
                                style: TextStyle(color: purpleColor)),
                          ),
                          onTap: () {},
                          value: cubit.trasnportSelected,
                          onChanged: (newVal) {
                            cubit.selectTransport(newVal);
                          },
                          items: cubit.transport.map((val) {
                            return DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: val,
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 10.0),
                                child: Text(
                                  val,
                                  style: TextStyle(color: purpleColor),
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
                      controller: cubit.productNumber,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: purpleColor),
                          hintText: "عدد الشحنات",
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
                      controller: cubit.orderContain,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: purpleColor),
                          hintText: "محتوي الطلب",
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
                  InkWell(
                    onTap: () {
                      myShowDialogForMarketing(
                          context: context,
                          alertDialog: CustomAlertDialogForMarketing(
                            bodyColor: purpleColor,
                            imageBackColor: purpleColor,
                            backGroundImageColor: Colors.white,
                            smallCircleRaduis: 60.0,
                            bigCircleRaduis: 68.0,
                            bottomSmallPicPadding: 453,
                            mainWidgetText: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "تم أرسال طلبك بنجاح",
                                  style: lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "سيتم التواصل معك من خلال فريق الشركة",
                                  style: lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: CustomDesignUnActive(
                                      text: Text(
                                        "الذهاب الي عروض الشحن",
                                        style: lightTheme.textTheme.bodyText1?.copyWith(
                                          fontSize: 20,
                                          color: purpleColor,
                                          fontWeight: FontWeight.bold
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
                            topImage: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 45,
                              child: CircleAvatar(
                                backgroundColor: purpleColor,
                                radius: 35,
                                child: const Icon(
                                  Icons.check,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 30.0),
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 0.8,
                            color: purpleColor,
                          )),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 40.0),
                        child: Text(
                          "أتمام الطلب",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
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
