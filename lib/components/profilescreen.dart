import 'package:flutter/material.dart';
import 'package:recyclify/components/text_box.dart';


class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profilescreen> {
  // final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> editField(String field) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ackgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Center(child: Text("Profile",
        style: Theme.of(context).textTheme.titleLarge,)),
        //backgroundColor: Colors.grey[900],
        //titleTextStyle: TextStyle(color: Colors.white),
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
            style: TextStyle(color: Colors.grey[700]),
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
            text: 'part time vigilante in dharmatala-ballygunge',
            sectionName: 'bio',
            onPressed: () => editField('bio'),
          )
        ],
      ),
    );
  }
}
