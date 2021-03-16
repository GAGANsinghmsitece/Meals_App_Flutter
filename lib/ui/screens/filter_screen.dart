import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  final Map<String, bool> _filters;
  final Function _setFilters;
  FilterScreen(this._filters, this._setFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

Widget buildSwitchLIst(
    String text, String subtitle, bool currentVal, Function nextVal) {
  return SwitchListTile(
      value: currentVal,
      title: Text(text),
      subtitle: Text(subtitle),
      onChanged: nextVal);
}

class _FilterScreenState extends State<FilterScreen> {
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _glutenFree = false;

  @override
  void initState() {
    _lactoseFree = widget._filters['lactose'];
    _glutenFree = widget._filters['gluten'];
    _vegan = widget._filters['vegan'];
    _vegetarian = widget._filters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _selectedFilter = {
                  'lactose': _lactoseFree,
                  'gluten': _glutenFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };

                widget._setFilters(_selectedFilter);
              }),
        ],
      ),
      drawer: SideDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filter your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchLIst('Gluten-Free meals',
                    'only include gluten-free meals', _glutenFree, (nextVal) {
                  setState(() {
                    _glutenFree = nextVal;
                  });
                }),
                buildSwitchLIst('Lactose-free meals',
                    'only include Lactose-free meals', _lactoseFree, (nextVal) {
                  setState(() {
                    _lactoseFree = nextVal;
                  });
                }),
                buildSwitchLIst(
                    'Vegan Meals', 'only include Vegan meals', _vegan,
                    (nextVal) {
                  setState(() {
                    _vegan = nextVal;
                  });
                }),
                buildSwitchLIst('Vegetarian Meals',
                    'only include Vegetarian meals', _vegetarian, (nextVal) {
                  setState(() {
                    _vegetarian = nextVal;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
