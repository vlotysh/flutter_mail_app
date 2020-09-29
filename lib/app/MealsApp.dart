import 'package:flutter/material.dart';
import 'package:meals_app/app/data/dummy_data.dart';
import 'package:meals_app/app/models/Meal.dart';
import 'package:meals_app/app/screens/Categories.dart';
import 'package:meals_app/app/screens/CategoryMeals.dart';
import 'package:meals_app/app/screens/MealDetail.dart';
import 'package:meals_app/app/screens/Settings.dart';
import 'package:meals_app/app/screens/Tabs.dart';

import './theme.dart';

class MealsApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MealsAppState createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((Meal meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    final existIndex =
        _favoriteMeals.indexWhere((favoriteMeal) => favoriteMeal.id == meal.id);

    setState(() {
      existIndex >= 0
          ? _favoriteMeals.removeAt(existIndex)
          : _favoriteMeals.add(meal);
    });

    /* setState(() {
      if (!_favoriteMeals.contains(meal)) {
        _favoriteMeals
            .removeWhere((favoriteMeal) => favoriteMeal.id == meal.id);
      } else {
        _favoriteMeals.add(meal);
      }
    }); */
  }

  bool isFavorite(Meal meal) {
    return _favoriteMeals.any((favoriteMeal) => favoriteMeal.id == meal.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        Categories.ROUTE_NAME: (_) => Tabs(
            toggleFavorite: _toggleFavorite, favoriteMeals: _favoriteMeals),
        CategoryMeals.ROUTE_NAME: (_) => CategoryMeals(
            favoriteMeals: _favoriteMeals, availableMeals: _availableMeals),
        MealDetail.ROUTE_NAME: (_) => MealDetail(isFavorite, _toggleFavorite),
        Settings.ROUTE_NAME: (_) =>
            Settings(filter: _filters, saveFilter: _setFilters),
      },
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
