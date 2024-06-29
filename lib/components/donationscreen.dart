import 'package:flutter/material.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Change background color her
      body: Center(
            child: Padding(
              padding: const EdgeInsets.only(left:70),
              child: Text(
                'THIS PAGE IS UNDER DEVELOPMENT!!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
    );
  }
}