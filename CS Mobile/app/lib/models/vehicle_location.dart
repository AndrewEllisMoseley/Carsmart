class VehicleLocation {
  final String id;
  final dynamic longitude;
  final dynamic latitude;
  final dynamic heading;

  VehicleLocation({this.id, this.longitude, this.latitude, this.heading});

  factory VehicleLocation.fromJson(dynamic json) {
    return VehicleLocation(
      id: json['id'],
      longitude: json['longitude']["value"],
      latitude: json['latitude']["value"],
      heading: json['heading']["value"],
    );
  }

  @override
  String toString() => 'User { id: $id, latitude: $latitude}';
}
