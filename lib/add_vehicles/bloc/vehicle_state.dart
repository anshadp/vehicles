part of 'vehicle_bloc.dart';

abstract class VehicleState {}

class VehicleInitial extends VehicleState {}

class VehicleAddedSuccess extends VehicleState {}

class VehicleAddedFailed extends VehicleState {}

class VehicleDeletedSuccessfully extends VehicleState {}
