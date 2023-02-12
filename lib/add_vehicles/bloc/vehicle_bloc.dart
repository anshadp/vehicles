import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:vechicles/add_vehicles/add_vehicle.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc({required this.firebaseRepository}) : super(VehicleInitial()) {
    on<AddVehicleData>(_addVehicleDetails);
    on<FetchVehicleData>(_fetchVehicleDetails);
    on<DeleteVehicleData>(_deleteVehicleDetails);
  }

  final FirebaseRepository firebaseRepository;

  FutureOr<void> _addVehicleDetails(
      AddVehicleData event, Emitter<VehicleState> emit) {
    firebaseRepository.addVehicles(event.vehicleData);
    emit(VehicleAddedSuccess());
  }

  FutureOr<void> _fetchVehicleDetails(
      FetchVehicleData event, Emitter<VehicleState> emit) async {
    var data = await firebaseRepository.fetchVehicles(event);
    emit(FetchVehicleDataSuccess(vehicleDetails: data));
  }

  FutureOr<void> _deleteVehicleDetails(
      DeleteVehicleData event, Emitter<VehicleState> emit) {
    firebaseRepository.deleteVehicle(event);
    emit(VehicleDeletedSuccessfully());
  }
}
