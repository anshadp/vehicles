import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vechicles/add_vehicles/add_vehicle.dart';
import 'package:vechicles/home/view/widgets/vehicle%20card.dart';

class DisplayVehicles extends StatelessWidget {
  DisplayVehicles({Key? key, required this.vehicleType}) : super(key: key);

  final String vehicleType;

  final CollectionReference vehiclesReference =
      FirebaseFirestore.instance.collection('vehicles_collection');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: vehiclesReference
            .where('vehicleType', isEqualTo: vehicleType)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List vehicleList = snapshot.data!.docs;

            List<VehicleModel> vehiclesObjList = [];

            for (int i = 0; i < vehicleList.length; i++) {
              VehicleModel vehicleObj =
                  VehicleModel.fromJson(vehicleList[i].data());
              vehiclesObjList.add(vehicleObj);
            }

            if (vehiclesObjList.isEmpty) {
              return emptyCard();
            } else {
              return ListView.builder(
                itemCount: vehiclesObjList.length,
                itemBuilder: (BuildContext context, int index) {
                  return VehicleCard(vehicleData: vehiclesObjList[index]);
                },
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Card emptyCard() => const Card(
        margin: EdgeInsets.all(60),
        child: Center(
          child: Text('No vehicle Added'),
        ),
      );
}
