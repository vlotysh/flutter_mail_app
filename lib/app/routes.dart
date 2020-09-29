/*import 'package:flutter/cupertino.dart';
import 'package:meals_app/app/models/Meal.dart';
import 'package:meals_app/app/screens/Settings.dart';
import 'package:meals_app/app/screens/Tabs.dart';

import 'screens/Categories.dart';
import 'screens/CategoryMeals.dart';
import 'screens/MealDetail.dart';

Map<String, WidgetBuilder> applicationRoutes(List<Meal> favoriteMeals,
    Map<String, bool> filters, Function setFilters, List<Meal> availableMeals) {
  return {
    Categories.ROUTE_NAME: (_) => Tabs(),
    CategoryMeals.ROUTE_NAME: (_) => CategoryMeals(
        favoriteMeals: favoriteMeals, availableMeals: availableMeals),
    MealDetail.ROUTE_NAME: (_) => MealDetail(),
    Settings.ROUTE_NAME: (_) =>
        Settings(filter: filters, saveFilter: setFilters),
  };
}
*/
