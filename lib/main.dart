import 'package:flutter/material.dart';
import './screens/auth/login_page.dart';

void main() => runApp(FlutterFoodApp());

class FlutterFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //esconde o debug "true/felse"
      title: 'LetsFood',

      ///Definir Cor para o Thema
      theme: ThemeData(
        primaryColor: Color.fromRGBO(147, 70, 248, 1),
        backgroundColor: Colors.white,
        accentColor: Colors.black,
        brightness: Brightness.dark,
      ),

      /// Definir o Home
      home: LoginScreen(),
    );
  }
}
