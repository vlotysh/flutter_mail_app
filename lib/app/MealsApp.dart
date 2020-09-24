import 'package:flutter/material.dart';
import './pages/Categories.dart';
import './pages/Home.dart';

class MealsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Categories(title: 'Meals App'),
    );
  }
}

