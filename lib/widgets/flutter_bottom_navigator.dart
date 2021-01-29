import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class FlutterFoodBottomNavigator extends StatelessWidget {
  int _active_item = 0;
  FlutterFoodBottomNavigator(this._active_item);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Theme.of(context).primaryColor,
      //backgroundColor: Colors.transparent.withOpacity(0),
      backgroundColor: Theme.of(context).backgroundColor,
      height: 45,
      //inicia por Default
      index: _active_item, //Icon(Icons.home),

      items: <Widget>[
        Icon(Icons.home),
        Icon(Icons.list),
        Icon(Icons.shopping_cart),
        Icon(Icons.supervised_user_circle),
      ],
      onTap: (index) {
        switch (index) {
          case 1:
            Navigator.pushReplacementNamed(context, '/my-orders');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/cart');
            break;
          default:
            Navigator.pushReplacementNamed(context, '/restaurants');
        }
      },
    );
  }
}
