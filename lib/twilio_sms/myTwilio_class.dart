import 'messages.dart';

class MyTwilio {
  final String _accountSid;
  final String _authToken;

  const MyTwilio(this._accountSid, this._authToken);

  Messages get messages => Messages(accountSid: _accountSid,authToken:  _authToken);
}