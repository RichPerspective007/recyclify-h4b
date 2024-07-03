import 'package:flutter/material.dart';
import 'package:recyclify/components/custom_text_field.dart';
import 'package:recyclify/components/custom_dropdown.dart';
import 'package:recyclify/pages/confirmation.dart';

class LapDeskForm extends StatefulWidget {
  const LapDeskForm({super.key});

  @override
  State<LapDeskForm> createState() => _LapDeskFormState();
}

class _LapDeskFormState extends State<LapDeskForm> {
  final TextEditingController age = TextEditingController();

  String? selectedRAM;
  String? selectedSSD;
  String? selectedHDD;
  String? selectedGPU;
  String? selectedWarranty;
  String? selectedOS;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: [
        CustomDropDownField(
          part: 'RAM',
          sizeList: ['please select','2', '4', '8', '12', '16', '24', '32', '64'],
          onChanged: (value) {
            setState(() {
              selectedRAM = value;
            });
          },
        ),
        CustomTextField(inputLabel: 'Age of the device', controller: age),
        CustomDropDownField(
          part: 'SSD',
          sizeList: ['please select','0', '128', '256', '512', '1024', '2048', '3072', '4096'],
          onChanged: (value) {
            setState(() {
              selectedSSD = value;
            });
          },
        ),
        CustomDropDownField(
          part: 'HDD',
          sizeList: ['please select','0', '128', '256', '512', '1024', '2048', '3072', '4096'],
          onChanged: (value) {
            setState(() {
              selectedHDD = value;
            });
          },
        ),
        CustomDropDownField(
          part: 'GPU',
          sizeList: ['please select','Integrated GPU only', 'Integrated + Dedicated GPU'],
          onChanged: (value) {
            setState(() {
              selectedGPU = value;
            });
          },
        ),
        CustomDropDownField(
          part: 'Is it under warranty?',
          sizeList: ['please select','Yes', 'No'],
          onChanged: (value) {
            setState(() {
              selectedWarranty = value;
            });
          },
        ),
        CustomDropDownField(
          part: 'Operating System',
          sizeList: ['please select','Windows', 'MacOS', 'Linux', 'Chrome OS', 'Fuchsia'],
          onChanged: (value) {
            setState(() {
              selectedOS = value;
            });
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmationPage(
                  selectedRAM: selectedRAM,
                  selectedSSD: selectedSSD,
                  selectedHDD: selectedHDD,
                  selectedGPU: selectedGPU,
                  selectedWarranty: selectedWarranty,
                  selectedOS: selectedOS,
                  age: age.text,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 13, 133, 208),
          ),
          child: const Text('Continue'),
        ),
      ],
    );
  }
}

