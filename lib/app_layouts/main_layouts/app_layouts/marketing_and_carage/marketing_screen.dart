import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/basket_screen.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/cubit_class.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/bloc/states.dart';
import 'package:wasela/app_layouts/main_layouts/app_layouts/marketing_and_carage/detailed_category.dart';
import 'package:wasela/helper_methods/constants/endpoints.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';

class MarketingScreen extends StatelessWidget {
  const MarketingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarketingCubitClass,MarketingStates>(
    listener: (context,state){},
      builder: (context,state){
        var cubit = MarketingCubitClass.get(context);
        return Scaffold(
          appBar: generateAppBar(
            context: context,
            title: "تسوق وأشحن",
            svgPath: "wallet",
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "أختر فئة المنتجات",
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
