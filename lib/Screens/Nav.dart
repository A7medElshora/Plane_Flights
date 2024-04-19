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
      appBar: AppBar(
        title: Text('Bottom Navigation Example'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/home_icon.png', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/flights_icon.png', width: 24, height: 24),
            label: 'Flights',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/fav_icon.png', width: 24, height: 24),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/profile_icon.png', width: 24, height: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

