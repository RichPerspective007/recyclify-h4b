import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _navigationService = _getIt.get<NavigationService>();
    _alertService = _getIt.get<AlertService>();
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
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          ThemeButton(
            changeThemeMode: widget.changeTheme,
          ),
          ColorButton(
            changeColor: widget.changeColor,
            colorSelected: widget.colorSelected,
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
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        animationDuration: const Duration(milliseconds: 1000),
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