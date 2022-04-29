import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/comapny_app/app_layouts/trade_store/store_style_details.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

import 'bloc/cubit_class.dart';
import 'bloc/states.dart';

class TradeStoreSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TradeStoreSystemCubitClass, TradeStoreSystemStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TradeStoreSystemCubitClass.get(context);
        return Scaffold(
          backgroundColor: greyColor,
          appBar: generateAppBarForCompanyMainScreens(
            mainScreen: true,
            title: "نظام التخزين للتجار",
            svgPath: "noun-inventory-3377901",
            context: context,
            imageSize: 80.0,
          ),
          resizeToAvoidBottomInset: false,
          body: ConditionalBuilder(
              condition: state is! GetStorageSystemsLoadingState,
              builder: (context) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          cubit.getAllStorageSystems();
                          navigateAndBack(context,
                              layout: TradeStoreEnrolledSystem());
                        },
                        child: CustomDesignUnActive(
                          borderColor: yellowColor,
                          containerColor: yellowColor,
                          width: 160,
                          text: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("الطلبات المرسلة"),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SvgPicture.asset(
                                    "Assets/images/noun-validation-1683882.svg",
                                    width: 35.0,
                                    height: 35.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 20.0,
                        ),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DecoratedContainerWithShadow(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(cubit.storeNameList[index]),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          navigateAndBack(context,
                                              layout: StoreStyleDetails(
                                                index: index,
                                                storeStyleName:
                                                    cubit.storeNameList[index],
                                                storeStyleDescribe: cubit
                                                    .storeDescribeList[index],
                                              ));
                                        },
                                        child: Container(
                                          width: 180,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 5.0),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child:
                                              const CustomContainerForDetails(
                                            text1: "تفاصيل",
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
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
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: cubit.storeNameList.length,
                        ),
                      ),
                    ),
                  ],
                );
              },
              fallback: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        );
      },
    );
  }
}

class TradeStoreEnrolledSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TradeStoreSystemCubitClass, TradeStoreSystemStates>(
      listener: (context, state) {},
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
          body: ConditionalBuilder(
              condition: state is! GetStorageSystemsLoadingState,
              builder: (context) {
                return ConditionalBuilder(
                  condition: cubit.storeEnrolledNameList.isNotEmpty,
                  builder: (context){
                    return Column(
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
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: DecoratedContainerWithShadow(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text(cubit.storeEnrolledNameList[index]),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 350,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 5.0),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child:
                                            Text(cubit.storeEnrolledDescribeList[index]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount: cubit.storeEnrolledNameList.length,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  fallback: (context){
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "Assets/images/noun-not-found-2503986.svg",
                            width: 350.0,
                            height: 350.0,
                            color: textGreyColor,
                          ),
                          Text(
                            "لم يتم الاشتراك فى اى نظام حتى الان",
                            style: TextStyle(
                              color: purpleColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              height: 0.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              fallback: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        );
      },
    );
  }
}
