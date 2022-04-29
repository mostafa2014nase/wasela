import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/add_order/bloc/add_order_cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/add_order/bloc/states.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/cubit.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

class AddOrder extends StatelessWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubitClass, AddOrderStates>(
      listener: (context, state) {
        if (state is CreatePickUpOrderSuccessState) {
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
                                fontWeight: FontWeight.bold),
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
        }
      },
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
                          dropdownColor: greyColortwoo,
                          menuMaxHeight: 400.0,
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
                            if (newVal == "بيك أب") {
                              cubit.getTransportsData();
                            }
                          },
                          items: cubit.orderName.map((val) {
                            return DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: val,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 10.0),
                                child: Text(
                                  val,
                                  style: TextStyle(
                                      color: purpleColor , fontWeight: FontWeight.bold,fontSize: 20.0),
                                  //textAlign: TextAlign.right,
                                ),
                              ),
                            );
                          }).toList()),
                    ),
                  ),
                  controlChoicesScreen(addOrderCubitClass: cubit),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PickUpChoiceScreen extends StatelessWidget {
  final AddOrderCubitClass cubit;

  const PickUpChoiceScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: CustomDesignUnActive(
            height: 70,
            borderColor: purpleColor,
            containerColor: Colors.transparent,
            text: DropdownButton(
                underline: const SizedBox(),
                focusColor: yellowColor,
                dropdownColor: greyColortwoo,
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
                  padding: const EdgeInsetsDirectional.only(start: 10.0),
                  child: Text("أختر وسيلة النقل",
                      style: TextStyle(color: purpleColor)),
                ),
                onTap: () {},
                value: cubit.transportSelected,
                onChanged: (newVal) {
                  cubit.selectTransport(newVal);
                },
                items: cubit.transportNames.map((val) {
                  return DropdownMenuItem(
                    alignment: AlignmentDirectional.centerStart,
                    value: val,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10.0),
                      child: Text(
                        val,
                        style: TextStyle(
                            color: purpleColor , fontWeight: FontWeight.bold,fontSize: 18.0),
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
                    borderSide: BorderSide(color: purpleColor, width: 1.5),
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
                    borderSide: BorderSide(color: purpleColor, width: 1.5),
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
            cubit.createPickUpOrder();
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
    );
  }
}

class PugetChoiceScreen extends StatelessWidget {
  final AddOrderCubitClass cubit;

  const PugetChoiceScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: InkWell(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 45, horizontal: 30),
                  child: CustomDesignUnActive(
                    height: 200,
                    borderWidth: 5,
                    borderRadius: 0,
                    borderColor: yellowColor,
                    text: Column(
                      children: const [
                        Text(
                          "Balance due",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "الرصيد المستحق",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "عن فترة  1/3/2022   إلى   5/3/2022",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "5000 جنيه",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              height: 1.5),
                        ),
                      ],
                    ),
                    containerColor: yellowColor,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: yellowColor,
                  radius: 50,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      "Assets/images/noun-cash-on-delivery-3881853.svg",
                      color: yellowColor,
                      width: 60,
                      height: 60,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {},
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
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: TextFormField(
            textAlign: TextAlign.start,
            maxLines: 8,
            textAlignVertical: TextAlignVertical.top,
            controller: cubit.notes,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              fillColor: Colors.white,
              hintStyle: lightTheme.textTheme.bodyText1
                  ?.copyWith(color: purpleColor, fontSize: 20.0),
              hintText: "ملاحظات",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: purpleColor, width: 1.5),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(10.0),
                    left: Radius.circular(10.0),
                  )),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            cubit.createPickUpOrder();
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
    );
  }
}

class ReBackChoiceScreen extends StatelessWidget {
  final AddOrderCubitClass cubit;


   ReBackChoiceScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appCubit = AppCubitClass.get(context);
    return Column(
      children: [
        SizedBox(height: 20.0,),
        Container(
          color: yellowColor,
          height: 50.0,
            child: rowWidget([ "رقم الشحنة","تاريخ المرتجع","قيمة المنتج","قيمة المرتجع","تكاليف الشحن","حالة المرتجع"])),
        put_line(),
    Container(
      height: 250.0,
       margin: const EdgeInsets.symmetric(vertical: 10.0,),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return SizedBox(
              height: 50,
              width: 60,
              child: columnWidget(appCubit.collectAll[index]));
        },
        separatorBuilder:(context,index){
          return put_line(line_width: 1.0,line_height: 50.0);
        },
        itemCount: appCubit.collectAll.length,
      ),
    ),
        put_line(),
        const SizedBox(height: 20.0,),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(10.0),
              left: Radius.circular(10.0),
            ),
          ),
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: TextFormField(
            textAlign: TextAlign.start,
            maxLines: 8,
            textAlignVertical: TextAlignVertical.top,
            controller: cubit.notes,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              fillColor: Colors.white,
              hintStyle: lightTheme.textTheme.bodyText1
                  ?.copyWith(color: purpleColor, fontSize: 20.0),
              hintText: "ملاحظات",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: purpleColor, width: 1.5),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(10.0),
                    left: Radius.circular(10.0),
                  )),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            cubit.createPickUpOrder();
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
    );
  }
  Widget columnWidget(dynamic apiListData){
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
      return SizedBox(
          height: 50.0,
          child: Center(
            child: Text(
              "${apiListData[index]}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  height: 1.0,
                  color: purpleColor
              ),
            ),
          ));
    },
      separatorBuilder:(context,index){
        return put_line(line_height: 1.0);

      } ,
      itemCount: apiListData.length,
    );
  }
  Widget rowWidget(dynamic apiListData){
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
      return SizedBox(
          width: 60,
          child: Center(
            child: Text(
              "${apiListData[index]}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  height: 1.0,
                  color: purpleColor
              ),
            ),
          ));
    },
      separatorBuilder:(context,index){
        return put_line(line_width: 1.0,line_height: 50.0);

      } ,
      itemCount: apiListData.length,
    );
  }
}

class EditShipmentChoiceScreen extends StatelessWidget {
  final AddOrderCubitClass cubit;

  const EditShipmentChoiceScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(10.0),
              left: Radius.circular(10.0),
            ),
            border: Border.all(color: purpleColor)
          ),
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("برجاء التواصل تليفونيا مع شركة الشحن عبر الارقام التالية :",style: TextStyle(color: purpleColor, fontSize: 15.0,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  Text("0100123445678",style: TextStyle(color: purpleColor, fontSize: 15.0,fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                  Text("0100123445678",style: TextStyle(color: purpleColor, fontSize: 15.0,fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("أو من خلال أرسال ايميل على الايميل التالي :",style: TextStyle(color: purpleColor, fontSize: 15.0,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  Text("operation@waz3lay.com",style: TextStyle(color: purpleColor, fontSize: 15.0,fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                ],
              ),
            ],
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
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: TextFormField(
            textAlign: TextAlign.start,
            maxLines: 8,
            textAlignVertical: TextAlignVertical.top,
            controller: cubit.notes,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              fillColor: Colors.white,
              hintStyle: lightTheme.textTheme.bodyText1
                  ?.copyWith(color: purpleColor, fontSize: 20.0),
              hintText: "ملاحظات",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: purpleColor, width: 1.5),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(10.0),
                    left: Radius.circular(10.0),
                  )),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            cubit.createPickUpOrder();
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
    );
  }
}

class MaterialChoiceScreen extends StatelessWidget {
  final AddOrderCubitClass cubit;

  const MaterialChoiceScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0,),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(.3),
              1: FlexColumnWidth(.7),
              2: FlexColumnWidth(.7),
              3: FlexColumnWidth(.7),
              4: FlexColumnWidth(.7),
              5: FlexColumnWidth(.8),
              6: FlexColumnWidth(.8),
            },
            border: TableBorder.all(
                color: purpleColor
            ),
            children:  [
              TableRow(
                  decoration: BoxDecoration(
                    color: yellowColor,
                  ),
                  children: [
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "م",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "رقم الشحنة",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "تاريخ المرتجع",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "قيمة المرتجع",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "تكايف الشحن",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "حالة المرتجع",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "مكان وجود المرتجع",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                  ]),
              TableRow(
                  children: [
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                  ]),
              TableRow(
                  children: [
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                  ]),
              TableRow(
                  children: [
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                height: 1.0,
                                color: purpleColor
                            ),
                          ),
                        )),
                  ]),
            ],
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
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: TextFormField(
            textAlign: TextAlign.start,
            maxLines: 8,
            textAlignVertical: TextAlignVertical.top,
            controller: cubit.notes,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              fillColor: Colors.white,
              hintStyle: lightTheme.textTheme.bodyText1
                  ?.copyWith(color: purpleColor, fontSize: 20.0),
              hintText: "ملاحظات",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: purpleColor, width: 1.5),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(10.0),
                    left: Radius.circular(10.0),
                  )),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            cubit.createPickUpOrder();
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
    );
  }
}

class OtherChoiceScreen extends StatelessWidget {
  final AddOrderCubitClass cubit;

  const OtherChoiceScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(10.0),
              left: Radius.circular(10.0),
            ),
          ),
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: TextFormField(
            textAlign: TextAlign.start,
            maxLines: 8,
            textAlignVertical: TextAlignVertical.top,
            controller: cubit.notes,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              fillColor: Colors.white,
              hintStyle: lightTheme.textTheme.bodyText1
                  ?.copyWith(color: purpleColor, fontSize: 20.0),
              hintText: "نبذة عن الطلب",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: purpleColor, width: 1.5),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(10.0),
                    left: Radius.circular(10.0),
                  )),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            cubit.createPickUpOrder();
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
    );
  }
}

Widget controlChoicesScreen ({required AddOrderCubitClass addOrderCubitClass}){
  if(addOrderCubitClass.orderSelected == "بيك أب"){
    return PickUpChoiceScreen(cubit: addOrderCubitClass,);
  }
  if(addOrderCubitClass.orderSelected == "حساب"){
    return PugetChoiceScreen(cubit: addOrderCubitClass,);
  }
  if(addOrderCubitClass.orderSelected == "مرتجعات"){
    return ReBackChoiceScreen(cubit: addOrderCubitClass,);
  }
  if(addOrderCubitClass.orderSelected == "تعديل على الشحنة"){
    return EditShipmentChoiceScreen(cubit: addOrderCubitClass,);
  }
  if(addOrderCubitClass.orderSelected == "الخامات والاستوكات"){
    return MaterialChoiceScreen(cubit: addOrderCubitClass,);
  }

  if(addOrderCubitClass.orderSelected ==  "طلبات أخري"){
    return OtherChoiceScreen(cubit: addOrderCubitClass,);
  }
  else{
    return SizedBox();
  }
}

