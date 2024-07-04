import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclify/models/user_profile.dart';
import 'package:recyclify/services/alert_service.dart';
import 'package:recyclify/services/auth_service.dart';
import 'package:recyclify/services/database.dart';
import 'package:recyclify/services/media_service.dart';
import 'package:recyclify/services/navigation_service.dart';
import 'package:recyclify/services/storage_service.dart';
import 'package:recyclify/widgets/consts.dart';
import 'package:recyclify/widgets/custom_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GetIt _getIt = GetIt.instance;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  late AuthService _authService;
  late MediaService _mediaService;
  late NavigationService _navigationService;
  late StorageService _storageService;
  late DatabaseService _databaseService;
  late AlertService _alertService;
  String? email, password, name;
  File? selectedImage;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _mediaService = _getIt.get<MediaService>();
    _navigationService = _getIt.get<NavigationService>();
    _authService = _getIt.get<AuthService>();
    _storageService = _getIt.get<StorageService>();
    _databaseService = _getIt.get<DatabaseService>();
    _alertService = _getIt.get<AlertService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 59, 65, 243),
              Color.fromARGB(255, 107, 235, 235),
            ],
          ),
        ),
        child: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
        ),
        child: Column(
          children: [
            _headerText(),
            if (!isLoading) SingleChildScrollView(child: _registerForm()),
            if (!isLoading) _LoginAccountLink(),
            if (isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _headerText() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Let's get going!",
              style: GoogleFonts.roboto(
                fontSize: 32.0,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 255, 243, 25),
              ),
            ),
          ),
          Center(
            child: Text(
              "Registration form ↓",
              style: GoogleFonts.roboto(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 252, 252, 252),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerForm() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.05,
      ),
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pfpSelectionField(),
            SizedBox(height: 10),
            Text(
              'Note: The first letter should be capital',
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            CustomFormField(
              hintText: "Name",
              height: MediaQuery.sizeOf(context).height * 0.1,
              validationRegEx: NAME_VALIDATION_REGEX,
              onSaved: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            
            CustomFormField(
              hintText: "E-mail",
              height: MediaQuery.sizeOf(context).height * 0.1,
              validationRegEx: EMAIL_VALIDATION_REGEX,
              onSaved: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            CustomFormField(
              hintText: "Password",
              height: MediaQuery.sizeOf(context).height * 0.1,
              validationRegEx: PASSWORD_VALIDATION_REGEX,
              obscureText: true,
              onSaved: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            Text(
              'Note: Must contain 8 letters with at least one capital, one small, one digit, and one special character',
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            _registerButton(),
          ],
        ),
      ),
    );
  }

  Widget _pfpSelectionField() {
    return GestureDetector(
      onTap: () async {
        File? file = await _mediaService.getImageFromGallery();
        if (file != null) {
          setState(() {
            selectedImage = file;
          });
        }
      },
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.20,
        backgroundImage: selectedImage != null
            ? FileImage(selectedImage!)
            : AssetImage('assets/images/seb image.png') as ImageProvider,
      ),
    );
  }

  Widget _registerButton() {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        color: Color.fromARGB(255, 252, 180, 85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          try {
            if (_registerFormKey.currentState?.validate() ?? false) {
              if (selectedImage == null) {
                throw Exception("Please select a profile picture");
              }
              _registerFormKey.currentState?.save();

              // Check if the email is already in use
              /*bool emailAlreadyInUse = await _authService.isEmailInUse(email!);
            if (emailAlreadyInUse) {
              throw Exception("Email already in use");
            }*/

              // Create the user account
              bool result = await _authService.signup(email!, password!);
              if (result) {
                // Handle successful registration
                String? pfpURL = await _storageService.uploadUserPfp(
                  file: selectedImage!,
                  uid: _authService.user!.uid,
                );
                if (pfpURL != null) {
                  await _databaseService.createUserProfile(
                    userProfile: UserProfile(
                      uid: _authService.user!.uid,
                      name: name,
                      pfpURL: pfpURL,
                    ),
                  );
                  _alertService.showToast(
                    text: "User Registered Successfully",
                    icon: Icons.check,
                  );
                  _navigationService.pushReplacementNamed("/login");
                  //_navigationService.pushReplacementNamed("/home");
                } else {
                  throw Exception("Unable to upload user pfp!");
                }
                // print("registered successfully");
              } else {
                throw Exception("Unable to register user!");
              }
            }
          } catch (e) {
            print(e);
            _alertService.showToast(
              text: "Registration failed, \n $e",
              icon: Icons.error,
            );
          }

          setState(() {
            isLoading = false;
          });
        },
        child: const Text(
          "SignUP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _LoginAccountLink() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Do you already have an account?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 252, 252, 252),
            ),
          ),
          GestureDetector(
            onTap: () {
              _navigationService.pushReplacementNamed('/login');
            },
            child: Text(
              " Login",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 255, 243, 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
