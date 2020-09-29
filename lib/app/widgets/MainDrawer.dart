import 'package:flutter/material.dart';
import 'package:meals_app/app/screens/Categories.dart';
import 'package:meals_app/app/screens/Settings.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  DrawerItem(this.title, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotCondensed')),
      onTap: onTap,
    );
  }
}

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon) {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
          child: Text('Cooking up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor)),
        ),
        SizedBox(
          height: 20,
        ),
        DrawerItem(
            'Meals',
            Icons.restaurant,
            () => Navigator.of(context)
                .pushReplacementNamed(Categories.ROUTE_NAME)),
        DrawerItem(
            'Settings',
            Icons.settings,
            () => Navigator.of(context)
                .pushReplacementNamed(Settings.ROUTE_NAME)),
      ],
    ));
  }
}
