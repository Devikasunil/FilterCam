import 'package:camera_app/Screens/ScreenHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FilterCamApp());
}

class FilterCamApp extends StatelessWidget {
  FilterCamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FilterCam App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.deepPurpleAccent,
      ),
      home: ScreenHome(),
    );
  }
}
