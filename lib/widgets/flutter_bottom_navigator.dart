import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../stores/foods.store.dart';

class FlutterFoodBottomNavigator extends StatelessWidget {
  int _active_item = 0;
  //FoodsStare storeFoods = new FoodsStare();

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
        _iconCart(context),
        Icon(Icons.supervised_user_circle),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/restaurants');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/my-orders');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/cart');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
          default:
            Navigator.pushReplacementNamed(context, '/restaurants');
        }
      },
    );
  }

  Widget _iconCart(context) {
    final storeFoods = Provider.of<FoodsStare>(context);
    return Stack(
      children: [
        Icon(Icons.shopping_cart),
        Positioned(
          right: 1,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: BoxConstraints(
              maxHeight: 16,
              minWidth: 16,
            ),
            child: Observer(builder: (_) {
              return Text(
                storeFoods.cartItens.length.toString(),
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              );
            }),
          ),
        ),
      ],
    );
  }
}
