class StorageModel {
  int ? id;
  String ? title;
  String ? description;
  String ? createdAt;
  String ? updatedAt;

  StorageModel({
    required this.id,
     this.title,
     this.description,
     this.createdAt,
     this.updatedAt,
  });

  StorageModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toMap() {
    return {
      "storage_system_id": id,
    };
  }
}

class AllEnrollOStorage{
  List ? storages;

  AllEnrollOStorage({
    required this.storages,
  });

  AllEnrollOStorage.fromJson(Map<String, dynamic> json) {
    storages = json["storage_system"];
  }

  Map<String, dynamic> toMap() {
    return {
      "storage_system": storages,
    };
  }
}

class OfferModel {
  int ? id;
  String ? title;
  String ? createdAt;
  String ? updatedAt;

  OfferModel({
    required this.id,
     this.title,
     this.createdAt,
     this.updatedAt,
  });

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

Map<String, dynamic> toMap() {
  return {
    "offer_id": id,
  };
}
}

class AllEnrollOffers{
  List ? offers;
  AllEnrollOffers({
    required this.offers,
  });

  AllEnrollOffers.fromJson(Map<String, dynamic> json) {
    offers = json["offer"];
  }

Map<String, dynamic> toMap() {
  return {
    "offer": offers,
  };
}
}