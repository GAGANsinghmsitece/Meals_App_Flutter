import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourites_screen.dart';
import '../widgets/drawer.dart';
import '../../models/meal.dart';

class NavigationBarScreen extends StatefulWidget {
  final List<Meal> _favourite_Meals;
  NavigationBarScreen(this._favourite_Meals);
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'title': 'Categories', 'page': CategoryScreen()},
      {
        'title': 'My Favourites',
        'page': FavouritesScreen(widget._favourite_Meals)
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      drawer: SideDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
        ],
      ),
    );
  }
}
