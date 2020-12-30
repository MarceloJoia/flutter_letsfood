import 'package:flutter/material.dart';

import './screens/auth/login_page.dart';
import './screens/auth/register_page.dart';
import './screens/restaurants/restaurants_page.dart';
import './screens/foods/foods_page.dart';

void main() => runApp(FlutterFoodApp());

class FlutterFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //esconde o debug "true/felse"
      title: 'LetsFood',

      ///Definir Cor para o Thema
      theme: ThemeData(
        primaryColor: Color.fromRGBO(144, 0, 0, 1),
        backgroundColor: Colors.white,
        accentColor: Colors.black,
        brightness: Brightness.dark,
      ),

      //rota inicial Home
      initialRoute: '/login',

      // Roteamento nativo do Flutter
      routes: <String, WidgetBuilder>{
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/restaurants': (context) => RestaurantsPage(),
        '/foods': (context) => FoodsScreen(),
      },
    );
  }
}
