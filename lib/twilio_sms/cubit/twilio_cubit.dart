import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/twilio_sms/cubit/twilio_states.dart';
import 'dart:io' show Platform;

import 'package:wasela/twilio_sms/myTwilio_class.dart';

class TwilioCubitClass extends Cubit<TwilioStates> {
  TwilioCubitClass() : super(TwilioInitState());

  static TwilioCubitClass get(context) => BlocProvider.of(context);

  var accountSid = Platform.environment['ACe32949f43961acfde247208f438db94c'];
  var authToken = Platform.environment['9a721a217d8c26d9915e279aa9099d00'];

  // Send a text message
  // Returns a Map object (key/value pairs)
  void sendSmsMessage(String phone) async {
    accountSid ??= 'ACe32949f43961acfde247208f438db94c';
    authToken ??= '9a721a217d8c26d9915e279aa9099d00';

    var client =  MyTwilio(accountSid!, authToken!);
    Map message = await client.messages.create({
      'body': 'Hello from Dart! this is a verify code here : ',
      'from': '+19843053513', // a valid Twilio number
      'to': '+20$phone' // your phone number
    });

    log(message.toString());
    emit(SendSmsCodeFromTwilioSuccessState());

  }

}