import 'package:flutter/cupertino.dart';
import 'package:meals_app/app/screens/MealDetail.dart';

import 'screens/Categories.dart';
import 'screens/CategoryMeals.dart';

Map<String, WidgetBuilder> applicationRoutes() {
  return {
    Categories.ROUTE_NAME: (_) => Categories(title: 'Meals App'),
    CategoryMeals.ROUTE_NAME: (_) => CategoryMeals(),
    MealDetail.ROUTE_NAME: (_) => MealDetail(),
  };
}
