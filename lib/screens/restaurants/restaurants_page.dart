import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/Restaurant.dart';
import './widgets/RestaurantCard.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../widgets/custom_circular_progress_indicator.dart';
import '../../data/network/repositories/restaurante_repository.dart';

class RestaurantsPage extends StatefulWidget {
  RestaurantsPage({Key key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  List<Restaurant> _restaurants = [];

  // Declara variável para o Loading
  bool siLoading = false;

  @override
  void initState() {
    super.initState();
    getRestaurants();
  }

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
      body: siLoading
          ? CustomCircularProgressIndicator(
              textLabel: 'Carregando os restaurantes',
            )
          : _buildRestaurants(context),
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
            restaurant: restaurant,
          );
        },
      ),
    );
  }

  void getRestaurants() async {
    setState(() => siLoading = true);
    final restaurants = await RestaurantRepository().getRestaurants();
    setState(() => _restaurants.addAll(restaurants));
    setState(() => siLoading = false);
  }
}
