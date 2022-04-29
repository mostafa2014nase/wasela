import 'dart:convert' show base64, utf8;


String toAuthCredentials(String accountSid, String authToken) =>
    base64.encode(utf8.encode(accountSid + ':' + authToken));