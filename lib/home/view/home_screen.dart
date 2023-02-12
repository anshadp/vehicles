import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vechicles/add_vehicles/add_vehicle.dart';
import 'package:vechicles/add_vehicles/view/add_vehicle.dart';
import 'package:vechicles/home/home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextStyle tabBarStyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Vehicle Details'),
          bottom: TabBar(
            tabs: [
              Text(
                'Bike',
                style: tabBarStyle,
              ),
              Text(
                'Car',
                style: tabBarStyle,
              ),
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
        color: Colors.teal,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Add A Vehicle',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
