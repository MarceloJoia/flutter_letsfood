import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double width;
  final double height;
  final String textLabel;

  CustomCircularProgressIndicator({
    this.width = 20,
    this.height = 20,
    @required this.textLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            width: width,
            height: height,
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).backgroundColor,
            ),
          ),
          Text(
            textLabel,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
