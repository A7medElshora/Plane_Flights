import 'dart:async';
import 'package:flutter/material.dart';
import 'package:plane_flights/Splaches/loading.dart';

class NoConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 250,),
            Image.asset("assets/icons/wifi.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              'No Connection!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                "        No internet connection,\n check the connection and try again",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),),
            SizedBox(height: 250),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoadingPage()),
                );
              },
              child:Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.fromLTRB(100, 7, 100, 7),
                  child: Text(
                    '   Try again',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

