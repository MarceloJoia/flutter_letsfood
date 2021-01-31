import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/flutter_bottom_navigator.dart';

class EvaluationsOrderScreen extends StatelessWidget {
  const EvaluationsOrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar o pedido'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreenEvaluationOrder(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  /// Construir a Screen
  Widget _buildScreenEvaluationOrder(context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildHeader(context),
          _buildFormEvaluation(context),
        ],
      ),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        "Avaliar o Pedido: 325641885",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget _buildFormEvaluation(context) {
    return Container(
      child: Column(
        children: <Widget>[
          RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 40,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) {
              print(value);
            },
          ),
          Container(height: 20),
          TextFormField(
            autocorrect: true,
            style: TextStyle(color: Theme.of(context).primaryColor),
            cursorColor: Theme.of(context).primaryColor,
            onSaved: (value) {
              print(value);
            },
            decoration: InputDecoration(
              labelText: 'Comentário (ex. Muito bom)',
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColor, width: 1),
              ),
            ),
          ),
          Container(
            //height: 40,
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: RaisedButton(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 14,
                left: 20,
                right: 20,
              ),
              onPressed: () {
                print('avaliou o pedido');
                //Navigator.pushNamed(context, '/evaluation-order');
              },
              color: Theme.of(context).primaryColor,
              elevation: 2.2,
              child: Text(
                'Avaliar o pedido',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
