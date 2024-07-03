import 'package:flutter/material.dart';
import 'package:recyclify/components/custom_text_field.dart';
import 'package:recyclify/components/custom_dropdown.dart';

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

class ConfirmationPage extends StatelessWidget {
  final String? selectedRAM;
  final String? selectedSSD;
  final String? selectedHDD;
  final String? selectedGPU;
  final String? selectedWarranty;
  final String? selectedOS;
  final String age;

  const ConfirmationPage({
    Key? key,
    this.selectedRAM,
    this.selectedSSD,
    this.selectedHDD,
    this.selectedGPU,
    this.selectedWarranty,
    this.selectedOS,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Table(
          border: TableBorder.all(),
          children: [
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Device Type:'),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Laptop'),
              ),
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('RAM'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedRAM ?? 'N/A'),
              ),
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Age of the device'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(age),
              ),
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('SSD'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedSSD ?? 'N/A'),
              ),
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('HDD'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedHDD ?? 'N/A'),
              ),
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('GPU'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedGPU ?? 'N/A'),
              ),
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Warranty'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedWarranty ?? 'N/A'),
              ),
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Operating System'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedOS ?? 'N/A'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
