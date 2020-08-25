import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        // we used expanded to wrap list view to take finite space not all space like parent column
        Expanded(
          child: ListView(
            children: [
              buildSwitchListTile(
                'Gluten-Free',
                'Only include gluten-free',
                _glutenFree,
                (bool value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
              ),
              buildSwitchListTile(
                'Lactose-Free',
                'Only include Lactose-free',
                _lactoseFree,
                (bool value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegan-Free',
                'Only include vegan-free',
                _vegan,
                (bool value) {
                  setState(() {
                    _vegan = value;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegetarian-Free',
                'Only include vegetarian-free',
                _vegetarian,
                (bool value) {
                  setState(() {
                    _vegetarian = value;
                  });
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }

  SwitchListTile buildSwitchListTile(String title, String subtitle, bool value,
      Null Function(bool value) fun) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: fun,
    );
  }
}
