import 'package:flutter/material.dart';
import 'package:recyclify/components/device_card.dart';
import 'package:recyclify/models/device_categories.dart';

class DeviceListView extends StatelessWidget {
  const DeviceListView({
    super.key,
    required this.devicelist  
  });

  final List<Devices> devicelist;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: devicelist.length,
        itemBuilder: (context, index) {
          return DeviceCard(device: devicelist[index]);
        }
      ),
    );
  }
}