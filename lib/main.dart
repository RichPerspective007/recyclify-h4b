import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclify/components/settings.dart';
import 'package:recyclify/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recyclify/pages/login_page.dart';
import 'package:recyclify/pages/register_page.dart';
import 'package:recyclify/services/database.dart';
import 'package:recyclify/services/auth_service.dart'; 
import 'package:recyclify/services/navigation_service.dart';
import 'package:recyclify/utils.dart'; 

void main() async {
  await setup();
  runApp(
    MyApp(),
  );
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupFirebase();
  await registerServices();
}

class MyApp extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;
  late NavigationService _navigationService;
  late AuthService _authService;
  MyApp({super.key}) {
    _navigationService = _getIt.get<NavigationService>();
    _authService = _getIt.get<AuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigationService.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      initialRoute: _authService.user != null ? "/home": "/login", 
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomeScreen(),
        "/register": (context) => RegisterPage(),
        "/settings": (context) => Settings(),
      }, // Add this
    );
  }
}
