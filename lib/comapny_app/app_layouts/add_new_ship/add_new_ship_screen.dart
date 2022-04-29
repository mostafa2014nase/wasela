import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/add_ship_form_app.dart';
import 'package:wasela/comapny_app/app_layouts/add_new_ship/bloc/states.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'bloc/cubit_class.dart';



class AddNewShipForCompanyApp extends StatefulWidget {
    AddNewShipForCompanyApp({Key? key}) : super(key: key);

   static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
     final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port')!;
     send.send([id, status, progress]);
   }

  @override
  State<AddNewShipForCompanyApp> createState() => _AddNewShipForCompanyAppState();
}

class _AddNewShipForCompanyAppState extends State<AddNewShipForCompanyApp> {
   final ReceivePort _port = ReceivePort();

   @override
   void initState() {
     super.initState();
     IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
     _port.listen((dynamic data) {
       // String id = data[0];
       // DownloadTaskStatus status = data[1];
       // int progress = data[2];
     });

     FlutterDownloader.registerCallback(AddNewShipForCompanyApp.downloadCallback);
   }

   @override
   void dispose() {
     IsolateNameServer.removePortNameMapping('downloader_send_port');
     super.dispose();
   }

   void download(String url) async {

     final status = await Permission.storage.request();

     if(status.isGranted) {
       final externalDir = await getExternalStorageDirectory();

       await FlutterDownloader.enqueue(
         url: url,
         savedDir: externalDir!.path,
         showNotification: true,
         openFileFromNotification: true,
       );
     } else {
       log('Permission Denied');
     }
   }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewShipCubitClass, AddNewShipStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = AddNewShipCubitClass.get(context);
        return Scaffold(
          appBar: generateAppBarForCompanyMainScreens(
            title: "أضافة شحنة جديدة",
            svgPath: "noun-shipping-3484992",
            context: context,
            imageSize: 80.0,
            mainScreen: true,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "أختر طريقة أدخال الشحنة",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "Assets/images/noun-csv-file-305198.svg",
                                width: 100,
                                height: 100,
                                color: purpleColor,
                              ),
                              InkWell(
                                onTap: () async {
                                  download("https://firebasestorage.googleapis.com/v0/b/wasela-e3eba.appspot.com/o/Shipping_Form.csv?alt=media&token=9221214e-e6a2-4304-95bf-7ebd493930cc");
                                  // final statue = await Permission.storage.request();
                                  // if (statue.isGranted) {
                                  //   final externalDir = await getExternalStorageDirectory();
                                  //   await FlutterDownloader.enqueue(
                                  //     url: "https://firebasestorage.googleapis.com/v0/b/wasela-e3eba.appspot.com/o/Shipping_Form.csv?alt=media&token=9221214e-e6a2-4304-95bf-7ebd493930cc",
                                  //     savedDir: externalDir!.path,
                                  //     fileName: "shipping file",
                                  //     showNotification: true,
                                  //     openFileFromNotification: true,
                                  //     saveInPublicStorage: true,
                                  //   );
                                  // } else {
                                  //   log("access denied");
                                  // }
                                },
                                child: CustomDesignUnActive(
                                  containerColor: Colors.transparent,
                                  borderColor: purpleColor,
                                  borderWidth: 2,
                                  borderRadius: 5,
                                  text: Text(
                                    "تحميل نسخة الأكسيل الأفتراضية",
                                    style: TextStyle(
                                        color: purpleColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "Assets/images/noun-excel-2788108.svg",
                                width: 100,
                                height: 100,
                                color: purpleColor,
                              ),
                              InkWell(
                                onTap: () {
                                  cubit.selectFile();
                                },
                                child: CustomDesignUnActive(
                                  containerColor: Colors.transparent,
                                  borderColor: purpleColor,
                                  borderWidth: 2,
                                  borderRadius: 5,
                                  text: Text(
                                    "رفع بيانات الشحنة",
                                    style: TextStyle(
                                        color: purpleColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  height: 50,
                                ),
                              ),
                              Text(
                                cubit.fileName,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              if(cubit.file != null)
                                ConditionalBuilder(
                                  condition: state is ! SendFileLoadingState,
                                  builder: (context){
                                    return state is ! SendFileSuccessState ? state is  SendFileErrorState ?
                                    const Text(
                                      "خطأ فى نوع الملف ",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ):
                                    InkWell(
                                      onTap: () {
                                        cubit.sendExcelFile();
                                      },
                                      child: CustomDesignUnActive(
                                        containerColor: purpleColor,
                                        borderColor: purpleColor,
                                        borderWidth: 2,
                                        borderRadius: 5,
                                        text: const Text(
                                          "ارسال الملف",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        height: 50,
                                      ),
                                    ) :
                                    const Text(
                                      "تم ارسال الملف بنجاح",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    );
                                  },
                                  fallback: (context){
                                    return const Center(child: CircularProgressIndicator(),);
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        "Assets/images/noun-application-1603837.svg",
                        width: 100,
                        height: 100,
                        color: purpleColor,
                      ),
                      InkWell(
                        onTap: () {
                          navigateAndBack(context,
                              layout: AddShipFromMobileApp());
                        },
                        child: CustomDesignUnActive(
                          width: 180,
                          containerColor: Colors.transparent,
                          borderColor: purpleColor,
                          borderWidth: 2,
                          borderRadius: 5,
                          text: Text(
                            "أضافة شحنة من على التطبيق",
                            style: TextStyle(
                                color: purpleColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


