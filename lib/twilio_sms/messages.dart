// messages.dart

import 'dart:convert' show json;

import 'package:http/http.dart' as http;
import 'package:wasela/helper_methods/constants/end_points_urls_api.dart';
import 'package:wasela/twilio_sms/utils.dart';

class Messages {
  final String accountSid;
  final String authToken;

  const Messages({required this.accountSid,required this.authToken});

  Future<Map> create(data) async {
    var client = http.Client();

    var url =
        Uri.parse('$TWILIO_SMS_API/Accounts/$accountSid/Messages.json');

    try {
      var response = await client.post(url, headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic ' + toAuthCredentials(accountSid, authToken)
      }, body: {
        'From': data['from'],
        'To': data['to'],
        'Body': data['body']
      });

      return (json.decode(response.body));
    } catch (e) {
      return ({'Runtime Error': e});
    } finally {
      client.close();
    }
  }
}