import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vechicles/add_vehicles/add_vehicle.dart';

class FirebaseRepository {
  final CollectionReference vehiclesRef =
      FirebaseFirestore.instance.collection('vehicles_collection');

  void addVehicles(VehicleModel event) async {
    await vehiclesRef.doc(event.vehicleNo).set(event.toJson());
  }

  void deleteVehicle(DeleteVehicleData event) async {
    await vehiclesRef.doc(event.vehicleNo).delete();
  }
}
