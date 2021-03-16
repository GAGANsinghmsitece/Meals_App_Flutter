import 'package:flutter/material.dart';

import '../../routes.dart';

class SideDrawer extends StatelessWidget {
  Widget buildDrawer(IconData icon, String text, Function handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
      ),
      onTap: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildDrawer(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildDrawer(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(Routes.Filter.route);
          }),
        ],
      ),
    );
  }
}
