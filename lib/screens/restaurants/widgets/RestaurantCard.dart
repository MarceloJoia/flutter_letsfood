import 'package:flutter/material.dart';

class RestarantCard extends StatelessWidget {
  final String uuid;
  final String name;
  final String image;
  final String contact;
  // Construtor
  RestarantCard({this.uuid, this.name, this.image, this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: ClipOval(
                    child: Image.asset('assets/images/seu-logo-vai-aqui.jpg'),
                  ),
                ),
                //divider linha vertical
                VerticalDivider(color: Theme.of(context).primaryColor),
                Expanded(
                  child: Text(
                    name,
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
    );
  }
}
