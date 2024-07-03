import 'package:flutter/material.dart';

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
