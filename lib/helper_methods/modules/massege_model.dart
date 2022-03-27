class MessageModel {
  String? text;
  String? senderId;
  String? receiverId;
  DateTime? dateTime;

  MessageModel({
    required this.text,
    required this.senderId,
    required this.receiverId,
    required this.dateTime,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    text = json["text"];
    senderId = json["senderId"];
    receiverId = json["receiverId"];
    dateTime = json["dateTime"];
  }

  Map<String, dynamic> toMap() {
    return {
      "text": text,
      "senderId": senderId,
      "receiverId": receiverId,
      "dateTime": dateTime,

    };
  }
}

