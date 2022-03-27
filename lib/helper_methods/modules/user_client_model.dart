
class UserDataModel {
  String? email;
  int? isActive;

  UserDataModel({
    required this.email,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    isActive = json["is_active"];
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "is_active": isActive,
    };
  }
}

class ClientModel{
  int? userId;
  int? isCompany;
  String? name;
  String? phone;
  String? image;

  ClientModel({
    required this.userId,
    required this.isCompany,
    required this.name,
    required this.phone,
    required this.image,
  });

  ClientModel.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    name = json["name"];
    image = json["image_path"];
    phone = json["phone"];
    isCompany = json["is_company"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "image_path": image,
      "phone": phone,
    };
  }

}


class CompanyModel{
  String? email;
  String? name;
  String? phoneNumber;
  String? photo;
  String? image;
  int? id;

  CompanyModel({
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.photo,
    required this.image,
    required this.id,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    name = json["company"]["name"];
    photo = json["company"]["photo"];
    phoneNumber = json["phone_number"];
    image = json["company"]["image_path"];
    id = json["company"]["id"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "photo": photo,
      "phone": phoneNumber,
    };
  }

}
