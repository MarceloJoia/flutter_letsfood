import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../models/Restaurant.dart';

class RestarantCard extends StatelessWidget {
  final Restaurant restaurant; //Objeto do restaurante inteiro

  // Construtor
  RestarantCard({
    this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/foods', arguments: restaurant);
        print(restaurant.name);
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 4,
          bottom: 0,
          left: 2,
          right: 2,
        ),
        child: Card(
          elevation: 2.5,
          child: Container(
            height: 110,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]),
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 90,
                    height: 90,
                    //Logo do restaurante
                    child: ClipOval(
                      //child: Image.asset('assets/images/seu-logo-vai-aqui.jpg'),
                      child: CachedNetworkImage(
                        imageUrl: restaurant.image != ''
                            ? restaurant.image
                            : 'http://228c22ba74d8.ngrok.io/assets/images/letsfood-icon.png',
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
                  ),
                  //Cria uma Linha Divisória
                  VerticalDivider(color: Theme.of(context).primaryColor),
                  Expanded(
                    child: Text(
                      restaurant.name,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
