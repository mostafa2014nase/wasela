import 'dart:async';
import 'dart:developer';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/translations/localeKeys.g.dart';

class FollowShippingOnMapScreen extends StatefulWidget {

  @override
  State<FollowShippingOnMapScreen> createState() => _FollowShippingOnMapScreenState();
}

class _FollowShippingOnMapScreenState extends State<FollowShippingOnMapScreen> {

   Completer<GoogleMapController> completer = Completer();

   Future<Position> getCurrentLocation() async {
    bool isLocationServicesEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationServicesEnabled) {
      await Geolocator.requestPermission();
      log("position in Perm = ${position.toString()}");
      return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    }
    log("position in return = ${position.toString()}");
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
   void getMyCurrentLocation() {
     getCurrentLocation().then((value) {
       position = value;
       log("position after assign value = ${position.toString()}");
     });
   }

   static Position ? position ;

   static final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
     bearing: 0.0,
     tilt: 0.0,
     zoom: 18.0,
     target: LatLng(position!.latitude, position!.latitude),
   );

  @override
  void initState() {
    log("perform function");
    getMyCurrentLocation();
    log("perform function");
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipForCompanyAppCubitClass, ShipStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //var cubit = ShipForCompanyAppCubitClass.get(context);
        return Scaffold(
          backgroundColor: greyColor,
          appBar: generateAppBarForCompanyMainScreens(
            mainScreen: false,
            title: LocaleKeys.followShippingAddress.tr(),
            svgPath: "track",
            context: context,
            textHeight: 2.0,
            imageSize: 85,
          ),
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Container(
                    color: purpleColor,
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                      left: 10.0,
                      bottom: 20.0,
                      top: 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "Assets/images/telephone.svg",
                                  width: 30,
                                  height: 30,
                                  color: purpleColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "مصطفى نصر",
                                  style:
                                      lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "Assets/images/headphones.svg",
                                  width: 30,
                                  height: 30,
                                  color: purpleColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "01208834037",
                                  style:
                                      lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.callCenter.tr(),
                                  style:
                                      lightTheme.textTheme.bodyText1?.copyWith(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  "Assets/images/headphones.svg",
                                  width: 30,
                                  height: 30,
                                  color: purpleColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: purpleColor,
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const SizedBox(
                          child: MySeparator(
                            color: Colors.white,
                            height: 1.7,
                          ),
                          width: 300,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DoneCircularAvatar(
                              underText: LocaleKeys.shippingQueSteps1.tr(),
                              textColor: Colors.white,
                              iconColor: purpleColor,
                              backGroundColor: Colors.white,
                              frontGroundColor: Colors.white,
                            ),
                            DoneCircularAvatar(
                              underText: LocaleKeys.shippingQueSteps2.tr(),
                              textColor: Colors.white,
                              iconColor: purpleColor,
                              backGroundColor: Colors.white,
                              frontGroundColor: Colors.white,
                            ),
                            NotYetYellowContainer(
                              underText: LocaleKeys.shippingQueSteps3.tr(),
                              textColor: Colors.white,
                              borderColor: Colors.white,
                              containerColor: purpleColor,
                            ),
                            NotYetYellowContainer(
                              underText: LocaleKeys.shippingQueSteps4.tr(),
                              textColor: Colors.white,
                              borderColor: Colors.white,
                              containerColor: purpleColor,
                            ),
                            NotYetYellowContainer(
                              underText: LocaleKeys.shippingQueSteps5.tr(),
                              textColor: Colors.white,
                              borderColor: Colors.white,
                              containerColor: purpleColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.center,
                    color: purpleColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        LocaleKeys.followShipping1.tr(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ConditionalBuilder(
                      condition: _FollowShippingOnMapScreenState.position != null,
                      builder: (context) {
                        return  GoogleMap(
                          initialCameraPosition:_FollowShippingOnMapScreenState.myCurrentLocationCameraPosition,
                          mapType: MapType.normal,
                          zoomControlsEnabled: false,
                          myLocationButtonEnabled: true,
                          myLocationEnabled: true,
                          onMapCreated: (controller){
                            completer.complete(controller);
                          },
                        );
                      },
                      fallback: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  // foregroundColor: Colors.white,
                  child: CustomDesignUnActive(
                    containerColor: Colors.white,
                    borderColor: purpleColor,
                    borderWidth: 2,
                    height: 100,
                    borderRadius: 90,
                    text: SvgPicture.asset(
                      "Assets/images/user Support.svg",
                      color: purpleColor,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
                bottom: 525,
              ),
            ],
          ),
        );
      },
    );
  }
}

