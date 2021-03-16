import 'package:flutter/material.dart';

import './routes.dart';
import './ui/screens/categories_screen.dart';
import './ui/screens/categories_detail_screen.dart';
import './ui/screens/meals_detail.dart';
import './ui/screens/navigation_bar_screen.dart';
import './ui/screens/tabs_screen.dart';
import './data/dummy_data.dart';
import './models/meal.dart';
import './ui/screens/filter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'lactose': false,
    'gluten': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> available_Meals = DUMMY_MEALS;
  List<Meal> _favouriteMeal = [];

  void _setFilters(Map<String, bool> _nfilters) {
    print('we are working');
    setState(() {
      _filters = _nfilters;
      available_Meals = DUMMY_MEALS.where((meal) {
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFavourite(String mealsId) {
    return _favouriteMeal.any((meal) => meal.id == mealsId);
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold)),
      ),
      home: NavigationBarScreen(_favouriteMeal),
      routes: {
        //'/': (ctx) => NavigationBarScreen(_favouriteMeal),
        Routes.Category_Detail.route: (ctx) =>
            CategoryDetailScreen(available_Meals),
        Routes.Meal_Detail.route: (ctx) =>
            MealsDetailScreen(_toggleFavourite, _isMealFavourite),
        Routes.Filter.route: (ctx) => FilterScreen(_filters, _setFilters)
      },
      onGenerateRoute: (settings) {
        //works when unknown route is encountered
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
      onUnknownRoute: (settings) {
        //works when unknown route is encountered and onGenerateRoute is nont used
        return MaterialPageRoute(builder: (ctx) {
          return CategoryScreen();
        });
      },
    );
  }
}
