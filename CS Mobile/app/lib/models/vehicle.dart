class Vehicle {
  final String id;
  final String licenseplate;
  final String salesdesignation;
  final String finorvin;
  final String nickname;
  final String modelyear;
  final String colorname;
  final String fueltype;
  final String powerhp;
  final String powerkw;
  final String numberofdoors;
  final String numberofseats;

  Vehicle(
      {this.id,
      this.licenseplate,
      this.salesdesignation,
      this.finorvin,
      this.nickname,
      this.modelyear,
      this.colorname,
      this.fueltype,
      this.powerhp,
      this.powerkw,
      this.numberofdoors,
      this.numberofseats});

  factory Vehicle.fromJson(dynamic json) {
    return Vehicle(
      id: json['id'],
      licenseplate: json['licenseplate'],
      salesdesignation: json['salesdesignation'],
      finorvin: json['finorvin'],
      nickname: json['nickname'],
      modelyear: json['modelyear'],
      colorname: json['colorname'],
      fueltype: json['fueltype'],
      powerhp: json['powerhp'],
      powerkw: json['powerkw'],
      numberofdoors: json['numberofdoors'],
      numberofseats: json['numberofseats'],
    );
  }

  @override
  String toString() => 'User { id: $id, licenseplate: $licenseplate}';
}
