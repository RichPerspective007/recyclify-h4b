import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:recyclify/home.dart';
import 'package:recyclify/pages/account.dart';
import 'package:recyclify/pages/date&time.dart';
import 'package:recyclify/pages/language.dart';
import 'package:recyclify/pages/login_page.dart';
import 'package:recyclify/pages/profile.dart';
import 'package:recyclify/pages/term.dart';



class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        leadingWidth: 100, // Adjust width as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                leading: Icon(Icons.person, size: 30),
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                    child: Text(
                      "ACCOUNT",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 60),
                child: Text(
                  "PERSONAL INFO",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.language),
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Languages()));
                    },
                    child: Text(
                      "LANGUAGE",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              

              Padding(
                padding: const EdgeInsets.only(right: 120),
                child: Text(
                  "ENGLISH",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Date_Time()));
                    },
                    child: Text(
                      "DATE & TIME",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.book),
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Terms()));
                    },
                    child: Text(
                      "TERMS AND CONDITIONS",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.logout),
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      "LOGOUT",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.delete),
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "DELETE ACCOUNT",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  }


