import 'package:flutter/material.dart';

import './constants/app_theme.dart';
import './routes.dart';

void main() => runApp(FlutterFoodApp());

class FlutterFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //esconde o debug "true/felse"
      title: 'LetsFood',
      //Definir Cor para o Thema
      theme: themeData,
      //rota inicial -Home
      initialRoute: '/',
      // Roteamento nativo do Flutter
      routes: Routes.routes,
    );
  }
}
