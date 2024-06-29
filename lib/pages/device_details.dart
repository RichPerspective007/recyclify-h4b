import 'package:flutter/material.dart';
import 'package:recyclify/components/laptopdesktop.dart';
import 'package:recyclify/components/phone_tab.dart';
import 'package:recyclify/models/device_categories.dart';

class DeviceDetailslForm extends StatefulWidget {
  const DeviceDetailslForm({
    super.key,
    required this.device,
  });

  final Devices device;
  @override
  State<DeviceDetailslForm> createState() => _DeviceDetailslFormState();
}

class _DeviceDetailslFormState extends State<DeviceDetailslForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Widget formType = (widget.device.device_id % 8 == 0 || widget.device.device_id % 8 == 1)
    ?PhoneTabForm():(widget.device.device_id % 8 == 2 || widget.device.device_id % 8 == 3)?LapDeskForm();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back)),
         centerTitle: true,
         title: Text('${widget.device.type} Details', style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: formType,
          )
        ),
      );
  }
}