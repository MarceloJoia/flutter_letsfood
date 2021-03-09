import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../stores/foods.store.dart';
import '../models/Food.dart';

class FoodCard extends StatelessWidget {
  bool notShowIconCart;
  Food food;

  //FoodsStare storeFoods = new FoodsStare();

  // Construtor
  FoodCard({this.notShowIconCart = false, this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.5,
        child: Container(
          height: 106,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[100]),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white,
          ),
          child: Container(
            child: Row(
              children: <Widget>[
                _buildImageFood(),
                Container(child: VerticalDivider(color: Colors.grey[300])),
                _buildInfoFood(context),
                _buildButtonCart(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageFood() {
    return Container(
      width: 98,
      height: 104,
      padding: EdgeInsets.only(top: 6, bottom: 6, right: 0, left: 6),
      //Logo do restaurante
      child: ClipOval(
        //child: Image.asset('assets/images/seu-logo-vai-aqui.jpg'),
        child: CachedNetworkImage(
          imageUrl: food.image != ''
              ? food.image
              : 'https://joiamarketing.com.br/wp-content/uploads/2020/05/cropped-Joia-Marketing-logo-box.png',
          placeholder: (context, url) => Container(
            height: 110,
            width: 110,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(Icons.error_outline),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoFood(context) {
    return Expanded(
      child: Column(
        // alinhar para esquerda
        crossAxisAlignment: CrossAxisAlignment.start,
        // centralizar na vertical
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Container(padding: EdgeInsets.only(top: 4)),
          Text(
            food.title,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.4,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(padding: EdgeInsets.only(top: 6)),
          Text(
            food.description,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 12.4,
              fontWeight: FontWeight.normal,
            ),
          ),
          Container(padding: EdgeInsets.only(top: 6)),
          Text(
            "R\$ ${food.price}",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 14.4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonCart(context) {
    final storeFoods = Provider.of<FoodsStare>(context);
    return notShowIconCart
        ? Container()
        : Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: storeFoods.inFoodCart(food)
                  ? GestureDetector(
                      onTap: () => storeFoods.removeFoodCart(food),
                      child: Icon(Icons.remove_shopping_cart),
                    )
                  : GestureDetector(
                      onTap: () => storeFoods.addFoodCart(food),
                      child: Icon(Icons.shopping_cart),
                    ),
            ),
          );
  }
}
