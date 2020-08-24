import 'package:flutter/material.dart';
import 'package:meals/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            ),
          ),
          SizedBox(height: 20),
          buildDrawerListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildDrawerListTile('Filters', Icons.filter_list, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }

  ListTile buildDrawerListTile(
      String text, IconData iconData, Function function) {
    return ListTile(
      onTap: function,
      leading: Icon(iconData),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
    );
  }
}
