import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclify/components/device_list.dart';
import 'package:recyclify/components/donationscreen.dart';
import 'package:recyclify/components/profilescreen.dart';
import 'package:recyclify/components/settings.dart';
import 'package:recyclify/models/colors.dart';
import 'package:recyclify/services/database.dart';
import 'models/device_categories.dart';
import 'services/auth_service.dart';
import 'services/alert_service.dart';
import 'services/navigation_service.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
  }) : super(key: key);

  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService _authService = AuthService();
  AlertService _alertService = AlertService();
  GetIt _getIt = GetIt.instance;
  NavigationService _navigationService = NavigationService();
  String userName = '';
  double _welcomeOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _navigationService = _getIt.get<NavigationService>();
    _alertService = _getIt.get<AlertService>();

    // Retrieve the user's name
    userName = _authService.user?.displayName ?? '';

    // Delay to animate the 'Welcome' text
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _welcomeOpacity = 1.0;
      });
    });
  }

  List<NavigationDestination> navBarDestinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
      icon: Icon(Icons.wallet_giftcard_sharp),
      label: 'Donations',
      selectedIcon: Icon(Icons.wallet),
    ),
    NavigationDestination(
      icon: Icon(Icons.person_2_outlined),
      label: 'Profile',
      selectedIcon: Icon(Icons.person_2),
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_applications_outlined),
      label: 'Settings',
      selectedIcon: Icon(Icons.settings_applications),
    ),
  ];

  final pages = [
    DeviceListView(devicelist: devices),
    const DonationsScreen(),
    const Profilescreen(),
    const Settings(),
  ];

  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ReCyclify',
          style: GoogleFonts.recursive(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.blueAccent,
          ),
        ),
        actions: [
          ThemeButton(
            changeThemeMode: widget.changeTheme,
          ),
          IconButton(
            onPressed: () async {
              bool result = await _authService.logout();
              if (result) {
                _alertService.showToast(
                  text: "Logged Out!",
                  icon: Icons.check_circle,
                );
                _navigationService.pushReplacementNamed('/login');
              }
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.lightBlueAccent,  // Set background color here
      body: Column(
        children: [
          if (tab == 0) ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedOpacity(
                opacity: _welcomeOpacity,
                duration: Duration(milliseconds: 1000),
                child: Text(
                  'W e l c o m e !',
                  style: GoogleFonts.robotoSlab(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              
              child: Text(
                "John Doe",
                style: GoogleFonts.recursive(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 152, 255, 120),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text(
                "Choose your device :-",
                style: GoogleFonts.recursive(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _authService.user != null ? _authService.user!.displayName ?? '' : '',
                style: GoogleFonts.recursive(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
          Expanded(
            child: IndexedStack(
              index: tab,
              children: pages,
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color.fromARGB(255, 115, 255, 0),  // Set navigation bar color here
        selectedIndex: tab,
        animationDuration: const Duration(milliseconds: 100),
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        destinations: navBarDestinations,
        indicatorShape: const CircleBorder(eccentricity: 0),
      ),
    );
  }
}
