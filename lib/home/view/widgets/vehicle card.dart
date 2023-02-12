import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vechicles/add_vehicles/add_vehicle.dart';

class VehicleCard extends StatefulWidget {
  const VehicleCard({Key? key, required this.vehicleData}) : super(key: key);

  final VehicleModel vehicleData;

  @override
  State<VehicleCard> createState() => _VehicleCardState();
}

class _VehicleCardState extends State<VehicleCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              cardData(
                'Vehicle No',
                widget.vehicleData.vehicleNo,
              ),
              cardData(
                'Brand Name',
                widget.vehicleData.vehicleBrand,
              ),
              cardData(
                'Vehicle Type',
                widget.vehicleData.vehicleType,
              ),
              cardData(
                'Fuel Type',
                widget.vehicleData.fuelType,
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
                DeleteVehicleData(vehicleNo: widget.vehicleData.vehicleNo),
              );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ],
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
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
