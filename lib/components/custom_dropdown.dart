import 'package:flutter/material.dart';
import 'package:recyclify/models/device_categories.dart';

class CustomDropDownField extends StatefulWidget {
  const CustomDropDownField({
    super.key,
    required this.part,
    required this.sizeList,
  });
  final List sizeList;
  final String part;
  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  late String _selectedVal;
  
  @override
  void initState() {
    super.initState();
    _selectedVal = widget.sizeList[0]; // Initialize _selectedVal in initState
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        value: _selectedVal,
        items: widget.sizeList.map((e) => DropdownMenuItem(child: Text(e), value: e,)).toList(),
        onChanged: (value) {
          setState(() {
            _selectedVal = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle_outlined,
          color: Color.fromARGB(255, 23, 225, 168),
        ),
        dropdownColor: Color.fromARGB(255, 67, 255, 202),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: '${widget.part} size in GB',
        ),
      ),
    );
  }
}