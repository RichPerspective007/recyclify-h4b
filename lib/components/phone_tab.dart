import 'package:flutter/material.dart';
import 'package:recyclify/components/custom_dropdown.dart';
import 'package:recyclify/components/custom_text_field.dart';

class PhoneTabForm extends StatefulWidget {
  const PhoneTabForm({super.key});

  @override
  State<PhoneTabForm> createState() => _PhoneTabFormState();
}

class _PhoneTabFormState extends State<PhoneTabForm> {
  final TextEditingController ram = TextEditingController();
  final TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20.0),
        shrinkWrap: true,
        children: [
          CustomTextField(inputLabel: 'Age of the device', controller: age),
          CustomDropDownField(part: 'RAM', sizeList: ['2','3','4','8','12','16','24','32','64'], onChanged: (value) {  },),
        ],
      );
  }
}