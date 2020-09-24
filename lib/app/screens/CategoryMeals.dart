import 'package:flutter/material.dart';
import 'package:meals_app/app/models/Category.dart';

class CategoryMeals extends StatelessWidget {
  static const ROUTE_NAME = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Category!'),
          ),
          FlatButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
