import 'package:flutter/widgets.dart';

import '../../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> _favouriteMeals;
  FavouritesScreen(this._favouriteMeals);
  @override
  Widget build(BuildContext context) {
    print(_favouriteMeals);
    return _favouriteMeals.isEmpty
        ? Center(
            child: Text('You do not have any favourites yet-Try adding some'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: _favouriteMeals[index].id,
                title: _favouriteMeals[index].title,
                imageUrl: _favouriteMeals[index].imageUrl,
                duration: _favouriteMeals[index].duration,
                complexity: _favouriteMeals[index].complexity,
                affordability: _favouriteMeals[index].affordability,
              );
            },
            itemCount: _favouriteMeals.length,
          );
  }
}
