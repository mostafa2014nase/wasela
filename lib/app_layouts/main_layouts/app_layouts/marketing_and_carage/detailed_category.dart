import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/states.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/detailed_specific%20_item.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';

import '../../../../helper_methods/functions/functions_needed.dart';
import '../../../../translations/localeKeys.g.dart';

class DetailedCategory extends StatelessWidget {
  final int index;

  const DetailedCategory({Key? key, required this.index}) : super(key: key);

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
                    color: Colors.white,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ],
            title: Column(
              children: [
                SvgPicture.asset(
                  "${cubit.gridIcons[index]}",
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
                Text(
                  "${cubit.gridTexts[index]}",
                  style: TextStyle(fontSize: 25, height: 1.5),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Text(
                    LocaleKeys.marketingCategory1.tr(),
                    style: TextStyle(color: purpleColor, fontSize: 20),
                  ),
                  put_line(line_width: 70, color: yellowColor, line_height: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 5.0),
                    child: GridView.builder(
                      itemBuilder: (context, indexis) {
                        return InkWell(
                          onTap: () {
                            navigateAndFinish(context,
                                layout: DetailedItemScreen(
                                  categoryIndex: index,
                                  itemIndex: indexis,
                                  isAlreadyClicked: false,
                                ));
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            fit: StackFit.expand,
                            children: [
                              CustomDesign(
                                borderRadius: 20,
                                text: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                ),
                                containerColor: purpleColor,
                              ),
                              Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomDesignUnActive(
                                        text: Text("صورة المنتج"),
                                        containerColor: Colors.transparent,
                                        borderWidth: 2,
                                        borderRadius: 15,
                                        borderColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0, bottom: 8.0),
                                    child: CustomDesignUnActive(
                                      text: Text(
                                        " 200 ${LocaleKeys.pound.tr()}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      containerColor: yellowColor,
                                      borderRadius: 30,
                                      borderColor: Colors.white,
                                      borderWidth: 5,
                                      height: 50,
                                      width: 120,
                                    ),
                                  ),
                                  CustomDesign(
                                    text: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "تيشرت رجالى بولو",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: CustomDesign(
                                              containerColor: purpleColor,
                                              borderRadius: 20,
                                              height: 40,
                                              text: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      LocaleKeys.marketingCategory2.tr(),
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: CircleAvatar(
                                                          child:
                                                              SvgPicture.asset(
                                                            "Assets/images/menu.svg",
                                                            color: purpleColor,
                                                                width: 10,
                                                                height: 10,
                                                          ),
                                                          backgroundColor:
                                                              yellowColor,
                                                          radius: 10,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    borderRadius: 1,
                                    containerColor: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 30,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
