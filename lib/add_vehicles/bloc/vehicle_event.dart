part of 'vehicle_bloc.dart';

abstract class VehicleEvent {}

class AddVehicleData extends VehicleEvent {
  AddVehicleData({required this.vehicleData});
  VehicleModel vehicleData;
}

class FetchVehicleData extends VehicleEvent {
  FetchVehicleData({required this.vehicleType});

  String vehicleType;
}

class DeleteVehicleData extends VehicleEvent {
  DeleteVehicleData({required this.vehicleNo});

  String vehicleNo;
}
