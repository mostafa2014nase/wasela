import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/offers/offers_screen.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'bloc/cubit_class.dart';
import 'bloc/states.dart';

class StoreStyleDetails extends StatelessWidget {
  final String storeStyleName;
  final String storeStyleDescribe;
  final int index;

  const StoreStyleDetails({Key? key,required this.storeStyleName,required this.storeStyleDescribe,required this.index,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TradeStoreSystemCubitClass, TradeStoreSystemStates>(
      listener: (context, state) {
        if(state is EnrollStorageSuccessState){
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
                        onTap: () {
                          backToPrevious(context);
                          navigateAndFinish(context, layout: OffersScreenForCompanyApp());
                        },
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
        }
      },
      builder: (context, state) {
        var cubit = TradeStoreSystemCubitClass.get(context);
        return Scaffold(
          backgroundColor: greyColor,
          appBar: generateAppBarForCompanyMainScreens(
            mainScreen: false,
              title: "نظام التخزين للتجار",
              svgPath: "noun-inventory-3377901",
              context: context,
              imageSize: 80.0,
       ),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0,),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DecoratedContainerWithShadow(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(storeStyleName),
                          put_line(line_height: 5.0,color: Colors.black26),
                          const SizedBox(
                            height: 40,
                          ),
                           Text(storeStyleDescribe),
                          const SizedBox(
                            height: 70,
                          ),
                          cubit.isChecked[index] ?
                          const CustomDesignUnActive(
                            width: 200,
                            height: 50,
                            text: Text("سيتم التواصل فى أقرب وقت",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                            borderColor: Colors.black38,
                            containerColor: Colors.black38,
                          )
                              :
                          InkWell(
                            onTap: () {
                              cubit.enrollNow(index: index);
                            },
                            child: CustomDesignUnActive(
                              width: 200,
                              containerColor: purpleColor,
                              borderColor: purpleColor,
                              text: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("التواصل مع ادارة التخزين",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
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
