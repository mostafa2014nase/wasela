class CreateShipment {
  final List? shipmentData;

  CreateShipment({
    required this.shipmentData,
  });

  Map<String, dynamic> toMap() {
    return {
      "data_client": shipmentData,
    };
  }
}
