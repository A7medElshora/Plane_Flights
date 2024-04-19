import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:plane_flights/Logins/Number.dart';
import 'package:plane_flights/Splaches/Connections.dart';

import 'package:plane_flights/main.dart';


class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      checkInternetAndNavigate();
    });
  }

  Future<void> checkInternetAndNavigate() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NoConnectionPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PhoneNumberInput()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: Image.asset("assets/icons/plane.png")
        // CircularProgressIndicator(),
      ),
    );
  }
}