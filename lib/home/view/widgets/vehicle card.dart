import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vechicles/add_vehicles/add_vehicle.dart';

class VehicleCard extends StatelessWidget {
  VehicleCard({Key? key, required this.vehicleData}) : super(key: key);

  DocumentSnapshot<Object?> vehicleData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VehicleBloc(firebaseRepository: FirebaseRepository()),
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                cardData(
                  'Vehicle No',
                  vehicleData['vehicleNo'],
                ),
                cardData(
                  'Brand Name',
                  vehicleData['vehicleBrand'],
                ),
                cardData(
                  'Vehicle Type',
                  vehicleData['vehicleType'],
                ),
                cardData(
                  'Fuel Type',
                  vehicleData['fuelType'],
                ),
              ],
            ),
          ),
          Positioned(
              right: 5,
              top: 1,
              child: IconButton(
                  onPressed: () {
                    BlocProvider.of<VehicleBloc>(context).add(
                        DeleteVehicleData(vehicleNo: vehicleData['vehicleNo']));
                  },
                  icon: Icon(Icons.delete))),
        ],
      ),
    );
  }

  Padding cardData(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
