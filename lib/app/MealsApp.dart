import 'package:flutter/material.dart';
import 'package:meals_app/app/screens/Categories.dart';

import './routes.dart';
import './theme.dart';

class MealsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: applicationRoutes(),
      // ignore: missing_return
      onGenerateRoute: (settings) {
        // ignore: missing_return
        print(settings.arguments);
        // it will be triggered only
        // if route not found and try generate unhandled route from routes by pushNamed

        //return MaterialPageRoute(builder: (_) => CategoryMeals());
      },
      onUnknownRoute: (settings) {
        //Will triggered on any unknown route
        return MaterialPageRoute(
            builder: (ctx) =>
                Categories(title: 'Meals App')); //Default page if not found
      },
      theme: applicationTheme(),
      title: 'Meals App',
      //home: Categories(title: 'Meals App'),
    );
  }
}
