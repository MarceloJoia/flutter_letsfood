import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/Restaurant.dart';
import './widgets/RestaurantCard.dart';
import '../../widgets/flutter_bottom_navigator.dart';

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
    Restaurant(
      name: "Cobra d'agua",
      image: '',
      contact: 'contato@cobra.com.br',
      uuid: '5sdfgsd6889a64sdfc',
    ),
    Restaurant(
      name: "Pizza do João",
      image: '',
      contact: 'contato@pizza.com.br',
      uuid: '5sdfgsd6889a64sdfc',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Restaura as configurações defaut
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildRestaurants(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(0),
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
