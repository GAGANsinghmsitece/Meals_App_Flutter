import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../widgets/meal_item.dart';
import '../../models/meal.dart';

class CategoryDetailScreen extends StatefulWidget {
  final List<Meal> _availableMeals;

  CategoryDetailScreen(this._availableMeals);

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  String title;
  List<Meal> categoryMeals;

  bool _isupdated = false;

  @override
  void didChangeDependencies() {
    if (!_isupdated) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      title = args['title'];
      final String id = args['id'];
      categoryMeals = widget._availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      _isupdated = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              //removeItem: _removeItem,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
