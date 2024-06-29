import 'package:flutter/material.dart';
class SettingItem extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final Function() onTap;
  final String value;
  const SettingItem({super.key,
  required this.title,
  required this.bgColor,
  required this.iconColor,
  required this.onTap,
  required this.value});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}