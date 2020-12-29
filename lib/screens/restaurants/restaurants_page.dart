import 'package:flutter/material.dart';

import '../../models/Restaurant.dart';
import './widgets/RestaurantCard.dart';

class RestaurantsPage extends StatefulWidget {
  RestaurantsPage({Key key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  List<Restaurant> _restaurants = [
    Restaurant(
      name: 'Joia Marketing',
      image: '',
      contact: 'contato@joiamarketing.com.br',
      uuid: '54546889asdf6sd55564sdfc',
    ),
    Restaurant(
      name: 'Café com Sapatilhas',
      image: '',
      contact: 'contato@sapatilhas.com.br',
      uuid: '54546889a64sdfc',
    ),
    Restaurant(
      name: 'Canta Galo',
      image: '',
      contact: 'contato@cantagalo.com.br',
      uuid: '5sdfgsd6889a64sdfc',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildRestaurants(context),
    );
  }

  // Conteúdo do "Body"
  Widget _buildRestaurants(context) {
    return Container(
      child: ListView.builder(
        // Percorrer a lista
        itemCount: _restaurants.length,
        //Loop "itemBuilder" para construir a lista
        itemBuilder: (context, index) {
          final Restaurant restaurant = _restaurants[index];

          return RestarantCard(
            uuid: restaurant.uuid,
            name: restaurant.name,
            image: restaurant.image,
            contact: restaurant.contact,
          );
        },
      ),
    );
  }
}
