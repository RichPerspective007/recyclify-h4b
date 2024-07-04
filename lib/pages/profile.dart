import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recyclify/components/text_box.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> editField(String field) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PETER SORCAR"),
        //titleTextStyle: TextStyle(color: Colors.white),
        actions: [Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.logout),
        )],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Icon(
            Icons.person,
            size: 72,
          ),
          Text(
            "Normal Name",
            //
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "My Details",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          MyTextBox(
            text: 'PETER SORCAR',
            sectionName: 'username',
            onPressed: () => editField('username'),
          ),
          MyTextBox(
            text: 'part time vigilante',
            sectionName: 'bio',
            onPressed: () => editField('bio'),
          )
        ],
      ),
    );
  }
}
