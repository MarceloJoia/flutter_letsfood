import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './stores/categories.store.dart';
import './stores/foods.store.dart';
import '../stores/restaurant.store.dart';
import './constants/app_theme.dart';
import './routes.dart';

void main() => runApp(FlutterFoodApp());

class FlutterFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FoodsStore>(
          create: (_) => FoodsStore(),
        ),
        Provider<CategoriesStore>(
          create: (_) => CategoriesStore(),
        ),
        Provider<RestaurantsStore>(
          create: (_) => RestaurantsStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //esconde o debug "true/felse"
        title: 'LetsFood',
        theme: themeData,
        initialRoute: '/',
        routes: Routes.routes,
      ),
    );
  }
}
