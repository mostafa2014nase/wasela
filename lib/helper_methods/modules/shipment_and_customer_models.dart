import 'dart:io';

class CustomerModel {
  int? customerId;
  String? name;
  String? address;
  String? city;
  String? area;
  String? phone;
  String? phone_2;
  String? email;
  String? googleLocation;
  File? photo;
  int? companyId;

  CustomerModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.customerId,
    required this.phone_2,
    required this.email,
    required this.googleLocation,
    required this.companyId,
    required this.photo,
    this.city,
    this.area,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    customerId = json["client"]["id"];
    name = json["client"]["name"];
    address = json["client"]["address"];
    phone = json["client"]["phone"];
    phone_2 = json["client"]["phone_2"];
    email = json["client"]["email"];
    googleLocation = json["client"]["google_location"];
    companyId = json["client"]["user_id"];
    photo = json["client"]["photo"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": customerId,
      "name": name,
      "address": address,
      "phone": phone,
      "phone_2": phone_2,
      "email": email,
      "googleLocation": googleLocation,
      "companyId": companyId,
      "photo": photo,
      "area": area,
      "city": city,
    };
  }
}

class ShipsDataModel {
  int? shipmentId;
  String? nameShipment;
  String? description;
  int? customerCode;
  int? collectionAmount;
  double? shippingPrice;
  double? weight;
  double? size;
  int? count;
  String? notes;
  int? customerId;
  int? areaId;
  int? serviceTypeId;
  int? representativeId;
  int? companyId;

  ShipsDataModel({
    this.shipmentId,
    required this.nameShipment,
    required this.description,
    this.customerCode,
    this.collectionAmount,
    required this.shippingPrice,
    required this.weight,
    required this.size,
    required this.count,
    required this.notes,
    this.customerId,
    this.areaId,
    this.serviceTypeId,
    this.representativeId,
    required this.companyId,
  });

  ShipsDataModel.fromJson(Map<String, dynamic> json) {
    shipmentId = json["id"];
    nameShipment = json["name_shipment"];
    description = json["description"];
    customerCode = json["customer_code"];
    collectionAmount = json["collection_amount"];
    shippingPrice = json["shipping_price"];
    weight = json["weight"];
    size = json["size"];
    count = json["count"];
    notes = json["notes"];
    customerId = json["client_id"];
    areaId = json["area_id"];
    serviceTypeId = json["service_type_id"];
    representativeId = json["representative_id"];
    companyId = json["sender_id"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": shipmentId,
      "name_shipment": nameShipment,
      "description": description,
      "customer_code": customerCode,
      "collection_amount": collectionAmount,
      "shipping_price": shippingPrice,
      "weight": weight,
      "size": size,
      "count": count,
      "notes": notes,
      "client_id": customerId,
      "area_id": serviceTypeId,
      "service_type_id": shipmentId,
      "representative_id": representativeId,
      "sender_id": companyId,
    };
  }
}

class CreateShipmentModel {
  int? customerId;
  String? name;
  String? address;
  String? city;
  String? area;
  String? phone;
  String? phone_2;
  String? email;
  String? googleLocation;
  File? photo;
  int? companyId;
  int? shipmentId;
  String? nameShipment;
  String? description;
  int? customerCode;
  int? collectionAmount;
  double? shippingPrice;
  String? weight;
  String? size;
  int? count;
  String? notes;
  int? areaId;
  int? serviceTypeId;
  int? representativeId;
  String? deliveryDate;

  CreateShipmentModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.customerId,
    required this.phone_2,
    required this.email,
     this.googleLocation,
    required this.companyId,
     this.photo,
    this.city,
    this.area,
    this.shipmentId,
    required this.nameShipment,
    required this.description,
    this.customerCode,
    this.collectionAmount,
    required this.shippingPrice,
    required this.weight,
    required this.size,
    required this.count,
    required this.notes,
    required this.areaId,
    this.serviceTypeId,
    this.representativeId,
    required this.deliveryDate,
  });

  CreateShipmentModel.fromJson(Map<String, dynamic> json) {
    customerId = json["client_id"];
    name = json["name"];
    address = json["address"];
    phone = json["phone"];
    phone_2 = json["phone_2"];
    email = json["email"];
    googleLocation = json["google_location"];
    companyId = json["user_id"];
    photo = json["photo"];
    shipmentId = json["id"];
    nameShipment = json["name_shipment"];
    description = json["description"];
    customerCode = json["customer_code"];
    collectionAmount = json["collection_amount"];
    shippingPrice = json["shipping_price"];
    weight = json["weight"];
    size = json["size"];
    count = json["count"];
    notes = json["notes"];
    customerId = json["client_id"];
    areaId = json["area_id"];
    serviceTypeId = json["service_type_id"];
    representativeId = json["representative_id"];
    companyId = json["sender_id"];
    deliveryDate = json["delivery_date"];
  }

  Map<String, dynamic> toMap() {
    return {
      "client_id": customerId,
      "name": name,
      "address": address,
      "phone": phone,
      "phone_2": phone_2,
      "email": email,
      "google_location": googleLocation,
      "company_id": companyId,
      "photo": photo,
      "area": area,
      "city": city,
      "id": shipmentId,
      "name_shipment": nameShipment,
      "description": description,
      "customer_code": customerCode,
      "collection_amount": collectionAmount,
      "shipping_price": shippingPrice,
      "weight": weight,
      "size": size,
      "count": count,
      "notes": notes,
      "area_id": areaId,
      "service_type_id": serviceTypeId,
      "representative_id": representativeId,
      "sender_id": companyId,
      "delivery_date": deliveryDate,
    };
  }
}
class EditShipmentModel {
  int? customerId;
  String? name;
  String? address;
  String? city;
  String? area;
  String? phone;
  String? phone_2;
  String? email;
  String? googleLocation;
  File? photo;
  int? companyId;
  int? shipmentId;
  String? nameShipment;
  String? description;
  int? customerCode;
  int? collectionAmount;
  num? shippingPrice;
  String? weight;
  String? size;
  num? count;
  String? notes;
  num? areaId;
  num? serviceTypeId;
  num? representativeId;
  String? deliveryDate;

  EditShipmentModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.customerId,
    required this.phone_2,
    required this.email,
     this.googleLocation,
    required this.companyId,
     this.photo,
    this.city,
    this.area,
    this.shipmentId,
    required this.nameShipment,
    required this.description,
    this.customerCode,
    this.collectionAmount,
    required this.shippingPrice,
    required this.weight,
    required this.size,
    required this.count,
    required this.notes,
    required this.areaId,
    this.serviceTypeId,
    this.representativeId,
    required this.deliveryDate,
  });

  EditShipmentModel.fromJson(Map<String, dynamic> json) {
    customerId = json["client_id"];
    name = json["client"]["name"];
    address = json["client"]["address"];
    phone = json["client"]["phone"];
    phone_2 = json["client"]["phone_2"]?? "";
    email = json["client"]["email"];
    googleLocation = json["google_location"];
    companyId = json["user_id"];
    photo = json["photo"];
    shipmentId = json["id"];
    nameShipment = json["name_shipment"];
    description = json["description"];
    customerCode = json["customer_code"];
    collectionAmount = json["collection_amount"];
    shippingPrice = json["shipping_price"];
    weight = json["weight"];
    size = json["size"];
    count = json["count"];
    notes = json["notes"];
    customerId = json["client_id"];
    areaId = json["area"]["id"];
    serviceTypeId = json["service_type_id"];
    representativeId = json["representative_id"];
    companyId = json["sender_id"];
    deliveryDate = json["delivery_date"];
  }

  Map<String, dynamic> toMap() {
    return {
      "client_id": customerId,
      "name": name,
      "address": address,
      "phone": phone,
      "phone_2": phone_2,
      "email": email,
      "google_location": googleLocation,
      "company_id": companyId,
      "photo": photo,
      "area": area,
      "city": city,
      "id": shipmentId,
      "name_shipment": nameShipment,
      "description": description,
      "customer_code": customerCode,
      "collection_amount": collectionAmount,
      "shipping_price": shippingPrice,
      "weight": weight,
      "size": size,
      "count": count,
      "notes": notes,
      "area_id": areaId,
      "service_type_id": serviceTypeId,
      "representative_id": representativeId,
      "sender_id": companyId,
      "delivery_date": deliveryDate,
    };
  }
}

class ShipmentsDetailsModel {
  num? shipmentId;
  String? nameShipment;
  String? description;
  num? customerCode;
  num? collectionAmount;
  num? shippingPrice;
  String? weight;
  String? size;
  num? count;
  String? notes;
  num? customerId;
  num? serviceTypeId;
  num? representativeId;
  num? companyId;
  String ? createDate;
  String ? updateDate;
  //area
  String ? areaName;
  num? areaId;
  num ? areaPrice;
  //client
  num ? clientId;
  String ? clientName;
  String ? clientAddress;
  String ? clientPhone;
  String ? clientEmail;
  // service type
  num ? serviceId;
  String ? serviceType;

  ShipmentsDetailsModel({
    this.shipmentId,
    this.createDate,
    this.updateDate,
    required this.nameShipment,
    required this.description,
    this.customerCode,
    this.collectionAmount,
    required this.shippingPrice,
    required this.weight,
    required this.size,
    required this.count,
    required this.notes,
    this.customerId,
    this.areaId,
    this.serviceTypeId,
    this.representativeId,
    required this.companyId,
    required this.areaName,
    required this.areaPrice,
    required this.clientId,
    required this.clientName,
    required this.clientAddress,
    required this.clientPhone,
    required this.clientEmail,
    required this.serviceId,
    required this.serviceType,
  });

  ShipmentsDetailsModel.fromJson(Map<String, dynamic> json) {
    shipmentId = json["id"];
    nameShipment = json["name_shipment"];
    description = json["description"];
    customerCode = json["customer_code"];
    collectionAmount = json["collection_amount"];
    shippingPrice = json["shipping_price"];
    weight = json["weight"];
    size = json["size"];
    count = json["count"];
    notes = json["notes"];
    customerId = json["client_id"];
    serviceTypeId = json["service_type_id"];
    representativeId = json["representative_id"];
    companyId = json["sender_id"];
    createDate = json["created_at"];
    updateDate = json["updated_at"];
    //areaId = json["area_id"];
    areaName = json["area"]["name"];
    areaPrice = json["area"]["price"];
    clientId = json["client"]["id"];
    clientName= json["client"]["name"];
    clientAddress= json["client"]["address"];
    clientPhone= json["client"]["phone"];
    clientEmail= json["client"]["email"];
    serviceId= json["service_type"]["id"];
    serviceType= json["service_type"]["type"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": shipmentId,
      "name_shipment": nameShipment,
      "description": description,
      "customer_code": customerCode,
      "collection_amount": collectionAmount,
      "shipping_price": shippingPrice,
      "weight": weight,
      "size": size,
      "count": count,
      "notes": notes,
      "client_id": customerId,
      "area_id": areaId,
      "service_type_id": serviceTypeId,
      "representative_id": representativeId,
      "sender_id": companyId,
     "created_at":createDate,
     "updated_at":updateDate,
    "area":{
        "price":areaPrice,
    },
    "client":{
        "id":clientId,
        "name":clientName,
        "address":clientAddress,
        "phone":clientPhone,
        "email":clientEmail,
    },
    "service_type":{
    "id":serviceId,
    "type":serviceType,
    },
    };
  }
}

class AllShipmentsData {
  List ? dataList;
  AllShipmentsData({
    this.dataList,
  });

  AllShipmentsData.fromJson(Map<String, dynamic> json) {
    dataList = json["shipment"]["data"];
  }
}