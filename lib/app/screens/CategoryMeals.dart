import 'package:flutter/material.dart';
import 'package:meals_app/app/widgets/MealItem.dart';

import '../models/Category.dart';
import '../models/Meal.dart';

class CategoryMeals extends StatefulWidget {
  static const ROUTE_NAME = '/category-meals';

  final List<Meal> availableMeals;
  final List<Meal> favoriteMeals;
  final Function addFavorite;
  final Function removeFavorite;

  CategoryMeals(
      {this.availableMeals,
      this.favoriteMeals,
      this.addFavorite,
      this.removeFavorite});

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  Category category;
  List<Meal> displayMeals;
  bool _loadedInitialData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_loadedInitialData == true) {
      return;
    }

    category = ModalRoute.of(context).settings.arguments as Category;

    displayMeals = widget.availableMeals
        .where((Meal element) => element.categories.contains(category.id))
        .toList();

    _loadedInitialData = true;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: displayMeals[index], removeItem: removeMeal);
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
