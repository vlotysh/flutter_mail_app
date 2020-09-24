import 'package:flutter/material.dart';
import '../models/Category.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;

  CategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(_category.title),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [_category.color.withOpacity(0.7), _category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
    );
  }
}
