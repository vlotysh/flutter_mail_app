import 'package:flutter/material.dart';
import 'package:meals_app/app/widgets/MainDrawer.dart';

class Settings extends StatefulWidget {
  static const ROUTE_NAME = '/settings';

  final Map<String, bool> filter;
  final Function saveFilter;

  Settings({this.filter, this.saveFilter});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filter['gluten'];
    _vegetarian = widget.filter['vegetarian'];
    _vegan = widget.filter['vegan'];
    _lactoseFree = widget.filter['lactose'];

    super.initState();
  }

  SwitchListTile _buildSwitchListTile(
      Text title, Text subtitle, bool value, Function onChangeHandler) {
    return SwitchListTile(
        title: title,
        value: value,
        subtitle: subtitle,
        onChanged: onChangeHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Settings'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  Map<String, bool> filterData = {
                    'gluten': _glutenFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                    'lactose': _lactoseFree,
                  };

                  widget.saveFilter(filterData);
                })
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      Text('Gluten-free'),
                      Text('Only include gluten-free meals'),
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(Text('Vegeterian'),
                      Text('Only vegeterian meals'), _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      Text('Vegan'), Text('Only vegan'), _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  _buildSwitchListTile(Text('Lactose-free'),
                      Text('Only lactose free'), _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
