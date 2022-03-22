import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'bloc/cubit_class.dart';
import 'bloc/states.dart';

class NotificationsForCompanyApp extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubitClass, NotificationStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //var cubit = NotificationCubitClass.get(context);
        return Scaffold(
          backgroundColor: greyColor,
          appBar: generateAppBarForCompanyMainScreens(
            mainScreen: false,
              title: "الأشعارات",
              svgPath: "noun-notification-4625948",
              context: context,
              imageSize: 80.0,
          ),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الأشعارات",
                        style: TextStyle(
                          color: purpleColor,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          put_line(
                              line_height: 5.0,
                              color: yellowColor,
                              line_width: 100.0),
                          Expanded(
                              child: put_line(
                                line_height: 5.0,
                                color: Colors.black38,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return DecoratedContainerWithShadow(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(Icons.check_circle_outline),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      " تم تغير حالة الشحنة لتصبح ( تسليم ناجح ) الشحنة مرسلة الى ( مصطفي تركي ) فى ( الهرم )",
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5.0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            "Assets/images/noun-time-1015010.svg",
                                            color: purpleColor,
                                            width: 25.0,
                                            height: 25.0,
                                          ),
                                          SizedBox(width: 5.0,),
                                          Text("منذ 8 أيام",style: TextStyle(
                                            color: purpleColor,
                                          ),),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){

                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5.0),
                                        child:  CustomContainerForDetails(
                                          text1: "حذف",
                                          icon: SvgPicture.asset(
                                            "Assets/images/noun-trash-2908521.svg",
                                            color: Colors.white,
                                            width: 30.0,
                                            height: 30.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
// Column(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 20.0, vertical: 20.0),
// child: Row(
// children: [
// TransportCustomDesign(
// onTap: () {},
// icon: const Icon(
// Icons.account_balance_sharp,
// color: Colors.white,
// size: 80,
// ),
// containerColor: purpleColor,
// paddingValue: 10,
// borderRadius: 15,
// ),
// const SizedBox(
// width: 20,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Text(
// "الشحنة من ",
// style: TextStyle(
// fontSize: 17, color: textGreyTwoColor),
// ),
// put_line(
// color: yellowColor,
// line_width: 90,
// ),
// Text(
// "القاهرة الجديدة",
// style: TextStyle(
// fontSize: 15, color: textGreyColor),
// ),
// ],
// ),
// const SizedBox(
// width: 20,
// ),
// Expanded(
// child: YellowButtonCustomDesign(
// height: 50,
// textSize: 20,
// text: "تعديل",
// inkwellFunc: () {},
// ),
// ),
// ],
// textDirection: TextDirection.rtl,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 20.0, vertical: 20.0),
// child: Row(
// children: [
// TransportCustomDesign(
// onTap: () {},
// icon: const Icon(
// Icons.account_balance_sharp,
// color: Colors.white,
// size: 80,
// ),
// containerColor: purpleColor,
// paddingValue: 10,
// borderRadius: 15,
// ),
// const SizedBox(
// width: 20,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Text(
// "الشحنة الي",
// style: TextStyle(
// fontSize: 17, color: textGreyTwoColor),
// ),
// put_line(
// color: yellowColor,
// line_width: 90,
// ),
// Text(
// "القاهرة الجديدة",
// style: TextStyle(
// fontSize: 15, color: textGreyColor),
// ),
// ],
// ),
// const SizedBox(
// width: 20,
// ),
// Expanded(
// child: YellowButtonCustomDesign(
// height: 50,
// textSize: 20,
// text: "تعديل",
// inkwellFunc: () {},
// ),
// ),
// ],
// textDirection: TextDirection.rtl,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 20.0, vertical: 20.0),
// child: Row(
// children: [
// TransportCustomDesign(
// onTap: () {},
// icon: const Icon(
// Icons.account_balance_sharp,
// color: Colors.white,
// size: 80,
// ),
// containerColor: purpleColor,
// paddingValue: 10,
// borderRadius: 15,
// ),
// const SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Text(
// "نوع الشحنة",
// style: TextStyle(
// fontSize: 17, color: textGreyTwoColor),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20.0),
// child: Column(
// children: [
// Text(
// "طرد 50 كيلو",
// style: TextStyle(
// fontSize: 15, color: textGreyColor,height: 1,),
// ),
// Text(
// "طرد 50 كيلو",
// style: TextStyle(
// fontSize: 15, color: textGreyColor,height: 1),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// textDirection: TextDirection.rtl,
// ),
// ),
// ],
// ),
