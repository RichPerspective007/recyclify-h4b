import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclify/main.dart';

class CustomDropDownField extends StatefulWidget {
  final List<String> sizeList;
  final String part;
  final Function(String) onChanged;

  const CustomDropDownField({
    super.key,
    required this.part,
    required this.sizeList,
    required this.onChanged,
  });

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
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        value: _selectedVal,
        items: widget.sizeList.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(),
        onChanged: (value) {
          setState(() {
            _selectedVal = value!;
          });
          widget.onChanged(value!);
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle_outlined,
          color: Color.fromARGB(255, 23, 164, 225),
        ),
        dropdownColor: globalThemeModeVar==ThemeMode.light?Colors.white:Colors.black,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: '${widget.part} size in GB',
        ),
      ),
    );
  }
}
