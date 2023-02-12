import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vechicles/add_vehicles/add_vehicle.dart';

class FirebaseRepository {
  final CollectionReference vehiclesRef =
      FirebaseFirestore.instance.collection('vehicles_collection');

  void addVehicles(VehicleModel event) async {
    await vehiclesRef.doc(event.vehicleNo).set(event.toJson());
  }

  Future<List<DocumentSnapshot>> fetchVehicles(FetchVehicleData event) async {
    QuerySnapshot repliesQuery = await vehiclesRef
        .where('vehicleType', isEqualTo: event.vehicleType)
        .get();

    List<DocumentSnapshot> replyDocs = repliesQuery.docs;
    return replyDocs;
  }

  void deleteVehicle(DeleteVehicleData event) async {
    await vehiclesRef.doc(event.vehicleNo).delete();
  }
}
