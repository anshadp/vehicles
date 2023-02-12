import 'package:flutter/material.dart';

class CDrop extends StatelessWidget {
  CDrop({
    Key? key,
    required this.items,
    required this.title,
    this.dropdownValue,
    this.onChanged,
    this.value,
  }) : super(key: key);

  List<String> items;
  String title;

  String? dropdownValue;
  Function(String?)? onChanged;
  String? value;
  @override
  Widget build(BuildContext context) {
    print(value);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: DropdownButton(
                hint: Text('Dropdown'),
                onChanged: onChanged,
                value: value,
                items: items.map<DropdownMenuItem<String>>((String data) {
                  return DropdownMenuItem<String>(
                    value: data,
                    child: Text(data),
                  );
                }).toList(),
                isExpanded: true, //make true to take width of parent widget
                underline: Container(), //empty line
                style: TextStyle(fontSize: 18, color: Colors.grey),
                iconEnabledColor: Colors.grey, //Icon color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
