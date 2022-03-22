import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'bloc/cubit_class.dart';
import 'bloc/states.dart';

class OffersScreenForCompanyApp extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferCubitClass, OfferStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //var cubit = OfferCubitClass.get(context);
        return Scaffold(
          backgroundColor: greyColor,
          appBar: generateAppBarForCompanyMainScreens(
            mainScreen: true,
              title: "العروض",
              svgPath: "noun-offer-1055801",
              context: context,
              imageSize: 80.0,
              ),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 40.0,
                  ),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: DecoratedContainerWithShadow(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("خصم 30 % على كل الشحنات داخل القاهرة"),
                                const SizedBox(
                                  width: 20,
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
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 20.0),
                                    child: CustomDesignUnActive(
                                      width: 150,
                                      height: 50,
                                      text: const Text("أشترك الأن",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                                      borderColor: purpleColor,
                                      containerColor: purpleColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
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
