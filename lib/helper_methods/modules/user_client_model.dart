import 'dart:io';

class UserDataModel {
  String? phone;
  String? email;

  UserDataModel({
    required this.email,
    required this.phone,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    email = json["user"]["email"];
    phone = json["user"]["user_data"]["phone"];
  }
}

class CompanyModel {
  String? email;
  String? name;
  String? phoneNumber;
  String? photo;
  String? image;
  String? city;
  String? address;
  int? id;
  int? userId;
  File? profileImage;

  CompanyModel({
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.photo,
    required this.image,
    required this.id,
    required this.city,
    required this.address,
    required this.profileImage,
    required this.userId,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    name = json["user_data"]["name"];
    photo = json["user_data"]["photo"];
    phoneNumber = json["phone_number"];
    image = json["user_data"]["image_path"];
    id = json["user_data"]["id"];
    userId = json["user_data"]["user_id"];
    city = json["user_data"]["city"];
    address = json["user_data"]["address"];
    profileImage = json["user_data"]["photo"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phoneNumber,
    };
  }
}

class ClientModel {
  String? email;
  String? name;
  String? phoneNumber;
  String? photo;
  String? image;
  String? city;
  String? address;
  int? id;
  File? profileImage;

  ClientModel({
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.photo,
    required this.image,
    required this.id,
    required this.city,
    required this.address,
    required this.profileImage,
  });

  ClientModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    name = json["user_data"]["name"];
    photo = json["user_data"]["photo"];
    phoneNumber = json["phone_number"];
    image = json["user_data"]["image_path"];
    id = json["user_data"]["id"];
    city = json["user_data"]["city"];
    address = json["user_data"]["address"];
    profileImage = json["user_data"]["photo"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phoneNumber,
    };
  }

  @override
  String toString() {
    return 'fffffffffffffffffffffffffffffffffffffffff';
  }
}
