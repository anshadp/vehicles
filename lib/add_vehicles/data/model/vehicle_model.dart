// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) =>
    VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

class VehicleModel {
  VehicleModel({
    required this.vehicleBrand,
    required this.vehicleType,
    required this.vehicleNo,
    required this.fuelType,
  });

  String vehicleBrand;
  String vehicleType;
  String vehicleNo;
  String fuelType;

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        vehicleBrand: json["vehicleBrand"],
        vehicleType: json["vehicleType"],
        vehicleNo: json["vehicleNo"],
        fuelType: json["fuelType"],
      );

  Map<String, dynamic> toJson() => {
        "vehicleBrand": vehicleBrand,
        "vehicleType": vehicleType,
        "vehicleNo": vehicleNo,
        "fuelType": fuelType,
      };
}
