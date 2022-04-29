import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/cubit_class.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';
import 'package:wasela/helper_methods/constants/themes.dart';
import 'package:wasela/helper_methods/functions/functions_needed.dart';
import 'package:wasela/helper_methods/modules/massege_model.dart';
import 'package:wasela/helper_methods/sharedpref/shared_preference.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        ShipForCompanyAppCubitClass.get(context).getAllMessages(
            sender: SharedCashHelper.getValue(key: "companyId").toString(), receiver: "0receiver12here3");
        return BlocConsumer<ShipForCompanyAppCubitClass, ShipStates>(
          listener: (context, state) {
            if(state is SendMessageSuccessState)
              {
                ShipForCompanyAppCubitClass.get(context).resetWrittenMsg();
              }
          },
          builder: (context, state) {
            var cubit = ShipForCompanyAppCubitClass.get(context);
            return Scaffold(
              backgroundColor: greyColor,
              appBar: generateAppBarForCompanyMainScreens(
                title: "المحادثة",
                svgPath: "noun-accounting-4679331",
                context: context,
                mainScreen: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context,index){
                        var message = cubit.messages[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
                          child: Column(
                            children: [
                              const ServiceChatComponent(),
                              CompanyChatComponent(
                                model:message,),
                            ],
                          ),
                        );
                      },
                      itemCount: cubit.messages.length,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          color: greyColor,
                          width: double.infinity,
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10.0),
                                      left: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: TextFormField(
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    controller: cubit.messageController,
                                    keyboardType: TextInputType.text,
                                    onChanged: (message){
                                      cubit.checkControllerIsEmpty();
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintStyle: lightTheme.textTheme.bodyText1
                                          ?.copyWith(
                                          color: textGreyColor, fontSize: 20.0),
                                      hintText: "اكتب رسالتك",
                                      contentPadding: const EdgeInsets.all(8.0),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: greyColortwoo, width: 1.5),
                                          borderRadius: const BorderRadius.horizontal(
                                            right: Radius.circular(10.0),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              cubit.messageControllerIsEmpty ?
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: purpleColor,
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(10.0),
                                  ),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ):
                              InkWell(
                                onTap: () {
                                  cubit.sendMessage(
                                    date: Timestamp.now(),
                                    receiver: "0receiver12here3",
                                    sender: SharedCashHelper.getValue(key: "companyId").toString(),
                                  );
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: purpleColor,
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(10.0),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class ServiceChatComponent extends StatelessWidget {
  const ServiceChatComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Container(
            margin: const EdgeInsetsDirectional.only(start: 15.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 101,
            ),
            decoration: BoxDecoration(
                color: textGreyColor,
                borderRadius: const BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(8.0),
                  topEnd: Radius.circular(8.0),
                  topStart: Radius.circular(8.0),
                )),
            padding: const EdgeInsetsDirectional.all(10.0),
            child: Text(
              "  خرسمةميسنشب خرسمةميسنشب خرسمةميسنشب",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          CircleAvatar(
            radius: 35.0,
            backgroundColor: textGreyColor,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30.0,
              child: Image.asset(
                "Assets/images/01.png",
                height: 40,
                width: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyChatComponent extends StatelessWidget {
  final MessageModel model;

  const CompanyChatComponent({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsetsDirectional.only(end: 15.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 101,
            ),
            decoration: BoxDecoration(
                color: purpleColor,
                borderRadius: const BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(8.0),
                  topStart: Radius.circular(8.0),
                  topEnd: Radius.circular(8.0),
                )),
            padding: const EdgeInsetsDirectional.all(10.0),
            child: Text(
              "${model.text}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          CircleAvatar(
            radius: 35.0,
            backgroundColor: purpleColor,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30.0,
              child: Image.asset(
                "Assets/images/01.png",
                height: 40,
                width: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
