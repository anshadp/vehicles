import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vechicles/add_vehicles/add_vehicle.dart';

class AddVehicle extends StatefulWidget {
  AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final TextEditingController _vehicleNo = TextEditingController();

  List<String> vehicleBrandCars = [
    'BMW',
    'Benz',
    'WolksWagon',
    'Audi',
    'RangeRover',
    'LandRover',
    'Supra'
  ];
  List<String> vehicleBrandBikes = [
    'BMW',
    'RE',
    'Yamaha',
    'Bajaj',
    'Java',
    'Honda'
  ];

  List<String> vehicleTypes = ['Bike', 'Car'];
  List<String> fuelTypes = ['Petrol', 'Diesel'];

  String? selectedVehicleType;
  String? selectedVehicleBrand;
  String? selectedFuelType;

  final VehicleBloc _vBloc =
      VehicleBloc(firebaseRepository: FirebaseRepository());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _vBloc,
      child: BlocListener<VehicleBloc, VehicleState>(
        listener: (context, state) {
          if (state is VehicleAddedSuccess) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Vehicle Form'),
          ),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: ListView(
                children: [
                  const Text(
                    'Vehicle No',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextFormField(
                    controller: _vehicleNo,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Vehicle No',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  CDrop(
                    items: vehicleTypes,
                    title: 'Vehicle Type',
                    value: selectedVehicleType,
                    onChanged: (a) {
                      setState(() {
                        selectedVehicleType = a;
                      });
                    },
                  ),
                  CDrop(
                    items: (selectedVehicleType == 'Car')
                        ? vehicleBrandCars
                        : vehicleBrandBikes,
                    title: 'Brand Name',
                    value: selectedVehicleBrand,
                    onChanged: (a) {
                      setState(() {
                        selectedVehicleBrand = a;
                      });
                    },
                  ),
                  CDrop(
                    items: fuelTypes,
                    title: 'Fuel Type',
                    value: selectedFuelType,
                    onChanged: (a) {
                      setState(() {
                        selectedFuelType = a;
                      });
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _vBloc.add(
                            AddVehicleData(
                              vehicleData: VehicleModel(
                                vehicleBrand: selectedVehicleBrand!,
                                vehicleType: selectedVehicleType!,
                                vehicleNo: _vehicleNo.text,
                                fuelType: selectedFuelType!,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
