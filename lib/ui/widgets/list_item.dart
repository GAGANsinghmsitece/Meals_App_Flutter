import 'package:flutter/material.dart';

import '../../routes.dart';

class CategoryListItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryListItem(this.id, this.title, this.color);

  void detailPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Routes.Category_Detail.route,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => detailPage(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
