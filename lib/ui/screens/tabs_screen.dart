import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourites_screen.dart';
import '../../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favouriteMeals;

  TabsScreen(this._favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Meal> _favouriteMeals;

  @override
  void initState() {
    _favouriteMeals = widget._favouriteMeals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Meals App'),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
              ),
            ]),
          ),
          body: TabBarView(
            children: [CategoryScreen(), FavouritesScreen(_favouriteMeals)],
          ),
        ));
  }
}
