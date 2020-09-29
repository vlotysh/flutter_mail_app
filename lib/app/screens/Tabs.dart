import 'package:flutter/material.dart';
import 'package:meals_app/app/models/Meal.dart';
import 'package:meals_app/app/screens/Categories.dart';
import 'package:meals_app/app/screens/Favorite.dart';
import 'package:meals_app/app/widgets/MainDrawer.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favoriteMeals;
  final Function toggleFavorite;

  Tabs({this.favoriteMeals, this.toggleFavorite});

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;
  List<Map<String, Object>> _pages;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': Categories(), 'title': 'Categories'},
      {
        'page': Favorite(
          favoriteMeals: widget.favoriteMeals,
          toggleFavorite: widget.toggleFavorite,
        ),
        'title': 'Favorites'
      }
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categorties'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorite'),
            )
          ]),
    );
  }
}
