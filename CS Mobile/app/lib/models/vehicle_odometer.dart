class VehicleOdometer {
  final int reading;

  VehicleOdometer({this.reading});

  factory VehicleOdometer.fromJson(dynamic json) {
    int reading = json["odometer"]["value"];
    return VehicleOdometer(
      reading: reading,
    );
  }
}
