import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vechicles/add_vehicles/add_vehicle.dart';
import 'package:vechicles/add_vehicles/view/add_vehicle.dart';
import 'package:vechicles/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Vehicle Details'),
          bottom: const TabBar(
            tabs: [
              Text('Bike'),
              Text('Car'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DisplayVehicles(vehicleType: 'Bike'),
            DisplayVehicles(vehicleType: 'Car'),
          ],
        ),
        bottomNavigationBar: addVehicleButton(context),
      ),
    );
  }

  InkWell addVehicleButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddVehicle(),
          )),
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Add A Vehicle',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            Icon(
              Icons.add,
              color: Colors.amber,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
