import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vechicles/add_vehicles/add_vehicle.dart';
import 'package:vechicles/home/view/widgets/vehicle%20card.dart';

class DisplayVehicles extends StatelessWidget {
  DisplayVehicles({Key? key, required this.vehicleType}) : super(key: key);

  String vehicleType;

  // CollectionReference vehiclesRef =
  //     FirebaseFirestore.instance.collection('vehicles_collection');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleBloc(firebaseRepository: FirebaseRepository())
        ..add(FetchVehicleData(vehicleType: vehicleType)),
      child: Scaffold(
        body: BlocBuilder<VehicleBloc, VehicleState>(
          builder: (context, state) {
            if (state is FetchVehicleDataSuccess) {
              if (state.vehicleDetails.isEmpty) {
                return emptyCard();
              } else {
                return ListView.builder(
                  itemCount: state.vehicleDetails.length,
                  itemBuilder: (context, index) {
                    return VehicleCard(
                      vehicleData: state.vehicleDetails[index],
                    );
                  },
                );
              }
            }
            return Container();
          },
        ),
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
