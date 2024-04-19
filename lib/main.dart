import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:plane_flights/Splaches/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'Login Page',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
