import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

import '../../../../../helper_methods/constants/endpoints.dart';
import '../../../../../translations/localeKeys.g.dart';
import '../bloc/cubit_class.dart';
import '../bloc/states.dart';

class CompleteBuyingData extends StatelessWidget {
  const CompleteBuyingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarketingCubitClass, MarketingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MarketingCubitClass.get(context);
          return Scaffold(
              backgroundColor: greyColor,
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
                title: Padding(
                  padding: isArabic!
                      ? const EdgeInsetsDirectional.only(start: 40)
                      : const EdgeInsetsDirectional.only(start: 60),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            "Assets/images/wallet.svg",
                            width: 40,
                            height: 40,
                            color: Colors.white,
                          ),
                          Text(
                            LocaleKeys.completeShoppingAddress.tr(),
                            style: TextStyle(fontSize: 25, height: 1.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, top: 50.0, bottom: 10.0),
                      child: CustomDesignUnActive(
                        borderColor: textGreyColor,
                        height: 80,
                        text: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "Assets/images/wallet.svg",
                              color: Colors.black,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              LocaleKeys.fastShipping.tr(),
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        containerColor: Colors.white,
                        borderRadius: 5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        myShowDialogForMarketing(
                            context: context,
                            alertDialog: CustomAlertDialogForMarketing(
                              backGroundImageColor: purpleColor,
                              mainWidgetText: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    child: SizedBox(
                                      height: 80,
                                      child: TextFormField(
                                        controller: cubit.addressController,
                                        validator: (value) {
                                          if (value?.isEmpty == true) {
                                            return "Please add the address shipping";
                                          }
                                        },
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                bottom: 5,
                                                top: 5,
                                                right: 10,
                                                left: 10),
                                            // disabledBorder: OutlineInputBorder(
                                            //     gapPadding: 80
                                            // ),
                                            // enabledBorder: OutlineInputBorder(
                                            //   gapPadding: 80,
                                            // ),
                                            border: InputBorder.none,
                                            hintText:
                                                LocaleKeys.addAddress.tr(),
                                            hintStyle:
                                                lightTheme.textTheme.caption,
                                            constraints: BoxConstraints(
                                              maxHeight: 80,
                                              minHeight: 80,
                                            )),
                                        maxLines: 4,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        minLines: 1,
                                        strutStyle: StrutStyle(
                                          forceStrutHeight: true,
                                        ),
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Material(
                                    child: InkWell(
                                      onTap: () {
                                        cubit.replaceAddress();
                                        backToPrevious(context);
                                      },
                                      child: CustomDesignUnActive(
                                        text: Text(
                                          "تأكيد العنوان",
                                          style: lightTheme.textTheme.bodyText1
                                              ?.copyWith(
                                            fontSize: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                        containerColor: purpleColor,
                                        borderColor: purpleColor,
                                        height: 60,
                                        borderRadius: 10,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              topImage: SvgPicture.asset(
                                "Assets/images/wallet.svg",
                                width: 40,
                                height: 40,
                                color: purpleColor,
                              ),
                            ));
                      },
                      child: cubit.replace
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                cubit.addressController.text,
                                style: TextStyle(fontSize: 25),
                              ),
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_box_outlined,
                                  color: Colors.black,
                                  size: 50,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  LocaleKeys.addAddress.tr(),
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 300,
                      color: Colors.black,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, bottom: 30.0, left: 20, right: 20.0),
                        child: CustomDesignUnActive(
                          borderColor: purpleColor,
                          text: Text(
                            LocaleKeys.finishShopping.tr(),
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          containerColor: purpleColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
