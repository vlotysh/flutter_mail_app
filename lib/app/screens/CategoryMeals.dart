import 'package:flutter/material.dart';
import 'package:meals_app/app/widgets/MealItem.dart';

import '../data/dummy_data.dart';
import '../models/Category.dart';
import '../models/Meal.dart';

class CategoryMeals extends StatelessWidget {
  static const ROUTE_NAME = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    List<Meal> categoryMeals = DUMMY_MEALS
        .where((Meal element) => element.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
