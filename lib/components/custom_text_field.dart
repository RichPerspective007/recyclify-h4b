import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.inputLabel,
    required this.controller,
  });
  final TextEditingController controller;
  final String inputLabel;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Color.fromARGB(199, 0, 0, 0),
        decoration: InputDecoration(
          labelText: widget.inputLabel,
          floatingLabelAlignment: FloatingLabelAlignment.start,
        ),
      ),
    );
  }
}