import 'package:flutter/material.dart';
import 'dart:async';

import 'package:medify/Booking.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.blueAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Booking()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blue[600],
                    radius: 60.0,
                    child: Icon(
                      Icons.local_hospital,
                      color: Colors.white,
                      size: 60.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    "Medify",
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Book an appointment \n  on your finger tips",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15.0,
                      ),
                    )
                  ],
                ))
          ],
        ),
      ],
    ));
  }
}
