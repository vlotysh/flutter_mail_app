import 'package:flutter/material.dart';

import '../screens/CategoryMeals.dart';
import '../models/Category.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;

  CategoryItem(this._category);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMeals.ROUTE_NAME, arguments: _category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child:
            Text(_category.title, style: Theme.of(context).textTheme.subtitle1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [_category.color.withOpacity(0.7), _category.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
