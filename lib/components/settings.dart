import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        leadingWidth: 100, // Adjust width as needed
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "SETTINGS",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
                  ListTile(
                    leading: Icon(Icons.person,size: 30),
                    title: Padding(
                      padding: EdgeInsets.only(left:10),
                      child: Text("ACCOUNT",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.language),
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("LANGUAGE",
                  style: TextStyle(
                    fontSize: 20,
                        fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("DATE & TIME",
                  style: TextStyle(
                    fontSize: 20,
                        fontWeight: FontWeight.bold
                  ),),
                ),
              ),     
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.book),
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("TERMS AND CONDITIONS",
                  style: TextStyle(
                    fontSize: 20,
                        fontWeight: FontWeight.bold
                  ),),
                ),
              ),               
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.logout),
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("LOG OUT",
                  style: TextStyle(
                    fontSize: 20,
                        fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.delete),
                title: Padding(
                  padding: EdgeInsets.only(left: 10
                  ),
                  child: Text("DELETE ACCOUNT",
                  style: TextStyle(
                    fontSize: 20,
                        fontWeight: FontWeight.bold
                  ),),
                ),
              ),      // Add more settings widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
