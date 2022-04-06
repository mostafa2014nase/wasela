class AllCities{
  List? province;


  AllCities({
    required this.province,
  });

  AllCities.fromJson(Map<String, dynamic> json) {
    province = json["province"];
  }

  Map<String, dynamic> toMap() {
    return {
      "province": province,
    };
  }

}

class CityModel{
  int? id;
  String? name;
  int? price;
  List? itsAreas;


  CityModel({
    required this.id,
    required this.name,
    required this.price,
    required this.itsAreas,
  });

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    itsAreas = json["areas"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id ,
      "name": name ,
      "price": price ,
      "areas": itsAreas,
    };
  }

}

class AreaModel{
  int? id;
  String? name;
  int? price;
  int? provinceId;


  AreaModel({
    required this.id,
    required this.name,
    required this.price,
    required this.provinceId,
  });

  AreaModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    provinceId = json["province_id"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id ,
      "name": name ,
      "price": price ,
      "province_id": provinceId,
    };
  }

}