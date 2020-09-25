import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/Meal.dart';

class MealDetail extends StatelessWidget {
  static const ROUTE_NAME = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context).settings.arguments;

    //assert(meal != null, 'Meal is required');

    Meal meal =
        DUMMY_MEALS.firstWhere((element) => element.id == arguments['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: (meal.steps as List<String>)
            .map((String step) => Text(step))
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: null,
      ),
    );
  }
}
