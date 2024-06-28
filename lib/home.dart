import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
    HomeScreen(),
    Container( //DonationsScreen
      color: Colors.blue,
    ),
    Container( // ProfileScreen
      color: Colors.green,
    ),
    Container( // SettingsScreen()
      color: Colors.yellow,
    ),
  ];

  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rEcyclify', style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        animationDuration: const Duration(milliseconds: 1000),
        onDestinationSelected: (index) {
          setState((){
            tab = index;
          });
        },
        destinations: navBarDestinations,
        indicatorShape: const CircleBorder(eccentricity: 0),
      ),
    );
  }
}