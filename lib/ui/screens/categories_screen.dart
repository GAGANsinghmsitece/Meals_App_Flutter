import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../widgets/list_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView(
          children: DUMMY_CATEGORIES.map((tx) {
            return CategoryListItem(tx.id, tx.title, tx.color);
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              maxCrossAxisExtent: 200)),
    );
  }
}
