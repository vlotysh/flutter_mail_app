import 'package:flutter/material.dart';
import 'package:meals_app/app/models/Category.dart';

import '../data/dummy_data.dart';
import '../widgets/CategoryItem.dart';

class Categories extends StatefulWidget {
  static const ROUTE_NAME = '/';

  Categories({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map((Category category) => CategoryItem(category))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
