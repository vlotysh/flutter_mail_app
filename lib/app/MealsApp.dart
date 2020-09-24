import 'package:flutter/material.dart';

import './screens/Categories.dart';

import './routes.dart';
import './theme.dart';

class MealsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: applicationRoutes(),
      theme: applicationTheme(),
      title: 'Meals App',
      //home: Categories(title: 'Meals App'),
    );
  }
}
