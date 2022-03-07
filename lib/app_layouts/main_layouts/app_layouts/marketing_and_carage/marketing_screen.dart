import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/complete_buying/basket_screen.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/states.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/detailed_category.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class MarketingScreen extends StatelessWidget {
  const MarketingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarketingCubitClass,MarketingStates>(
    listener: (context,state){},
      builder: (context,state){
        var cubit = MarketingCubitClass.get(context);
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
                  child: Icon(
                    Icons.notifications,
                    size: 35,
                  )
                ),
              ),
            ],
            title: Padding(
              padding: isArabic! ? const EdgeInsetsDirectional.only(start: 40):const EdgeInsetsDirectional.only(start: 60),
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
                        LocaleKeys.marketing.tr(),
                        style: TextStyle(fontSize: 25, height: 1.5),
                      ),
                    ],
                  ),
                  SizedBox(width: 30,),
                  IconButton(onPressed: (){
                    navigateAndBack(context, layout: BasketScreen());
                  }, icon: Icon(Icons.shopping_cart),color: Colors.white,iconSize: 40,)
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Text(
                    LocaleKeys.marketingCategories.tr(),
                    style: TextStyle(color: purpleColor, fontSize: 20),
                  ),
                  put_line(line_width: 70, color: yellowColor, line_height: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    child: GridView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            navigateAndBack(context, layout: DetailedCategory(index: index));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: CustomDesignUnActive(
                                  borderColor: purpleColor,
                                  borderWidth: 10,
                                  borderRadius: 20,
                                  text: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      cubit.gridIcons[index],
                                      width: 60,
                                      height: 60,
                                      color: purpleColor,
                                    ),
                                  ),
                                  containerColor: Colors.transparent,
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  cubit.gridTexts[index],
                                  style: TextStyle(
                                    color: purpleColor,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 50,
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.2,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 40,
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
