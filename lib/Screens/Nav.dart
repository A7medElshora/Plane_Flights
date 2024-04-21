import 'package:flutter/material.dart';
import 'package:plane_flights/Screens/HomePage.dart';
import 'package:plane_flights/Screens/ProfilePage.dart';
import 'package:plane_flights/Screens/favPage.dart';
import 'package:plane_flights/Screens/flightsPage.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    FlightsScreen(),
    FavScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue, // Selected item color
        unselectedItemColor: Colors.black87, // Unselected item color
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/routing.png', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/airplane.png', width: 24, height: 24),
            label: 'Flights',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/fave.png', width: 24, height: 24),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/profile.png', width: 24, height: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
