import 'package:flutter/material.dart';

class HeadingAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/letsfood-icon.png'),
            fit: BoxFit.fill), // preenche todo o Content
      ),
    );
  }
}
