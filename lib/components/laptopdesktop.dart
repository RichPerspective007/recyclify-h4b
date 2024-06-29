import 'package:flutter/material.dart';
import 'package:recyclify/components/custom_text_field.dart';
import 'package:recyclify/components/custom_dropdown.dart';
import 'package:recyclify/models/device_categories.dart';
import 'package:recyclify/widgets/custom_form_field.dart';
import 'package:recyclify/models/device_categories.dart';

class LapDeskForm extends StatefulWidget {
  const LapDeskForm({
    super.key,
  });

  @override
  State<LapDeskForm> createState() => _LapDeskFormState();
}

class _LapDeskFormState extends State<LapDeskForm> {
  final TextEditingController age = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(20.0),
        children: [
          CustomDropDownField(part: 'RAM', sizeList: ['2','4','8','12','16','24','32','64']),
          CustomTextField(inputLabel: 'Age of the device', controller: age),
          CustomDropDownField(part: 'SSD', sizeList: ['0','128','256','512','1024','2048','3072','4096']),
          CustomDropDownField(part: 'HDD', sizeList: ['0','128','256','512','1024','2048','3072','4096']),
          CustomDropDownField(part: 'HDD', sizeList: ['Integrated GPU only','Integrated + Dedicated GPU']),
          CustomDropDownField(part: 'Is it under warranty?', sizeList: ['Yes','No']),
          CustomDropDownField(part: 'Operating Systen', sizeList: ['Windows','MacOS','Linux','Chrome OS','Fuchsia']),
        ],
      );
  }
}