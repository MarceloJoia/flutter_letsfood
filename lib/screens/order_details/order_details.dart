import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';
import '../../models/Food.dart';
import '../../models/Evaluation.dart';
import '../../widgets/food_card.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderDetailsScreen extends StatelessWidget {
  Order _order = Order(
    identify: '4545sdf4',
    date: '30/02/2021',
    status: 'open',
    total: (90).toDouble(),
    comment: 'Sem cebola, por favor',
    //foods é uma lista apresenta várias comidas
    foods: [
      Food(
        identify: '658gvd889sdf',
        title: 'Bolo de Cereja',
        image:
            'https://casadocaminhosc.com.br/wp-content/uploads/2020/12/imagem-Talharim.jpg',
        description: 'Descrição do Bolo de Cereja',
        price: '12.89',
      ),
      Food(
        identify: 'g9474gvd889sdf',
        title: 'Torta de Maracuja',
        image:
            'https://casadocaminhosc.com.br/wp-content/uploads/2020/12/imagem-Talharim.jpg',
        description: 'Descrição do Torta de Maracuja',
        price: '52.51',
      ),
      Food(
        identify: '658gvd889sdf',
        title: 'Bolo de Cereja',
        image:
            'https://casadocaminhosc.com.br/wp-content/uploads/2020/12/imagem-Talharim.jpg',
        description: 'Descrição do Bolo de Cereja',
        price: '12.89',
      ),
    ],
    evaluations: [
      /* Evaluation(
        comment: 'Pedido muito bom',
        nameUser: 'Marcelo J',
        stars: 5,
      ),
      Evaluation(
        comment: 'Recomendo',
        nameUser: 'Pedro B',
        stars: 4,
      ),*/
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhe do Pedido'), centerTitle: true),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: _buildOrderDetails(context),
      ),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _buildOrderDetails(context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Column(
        // Alinha na esquerda
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _makeTextOrder('Número', _order.identify),
          _makeTextOrder('Data', _order.date),
          _makeTextOrder('Status', _order.status),
          _makeTextOrder('Total', _order.total.toString()),
          _makeTextOrder('Comentário', _order.comment),

          /// Listar produtos
          Container(height: 20),
          Text('Comidas',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
          _builFoodsOrder(context),
          Container(height: 30),

          /// Avaliação do pedido
          Container(height: 20),
          Text('Avaliações',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
          _builEvaluationsOrder(context),
        ],
      ),
    );
  }

  Widget _makeTextOrder(String textLabel, String textValue) {
    return Container(
      margin: EdgeInsets.only(top: 3, bottom: 3),
      child: Row(
        children: <Widget>[
          Text(
            textLabel + ': ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            textValue + ': ',
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }

  /// Listar produtos do pedido
  Widget _builFoodsOrder(context) {
    // Os produtos são uma lista um array usar ListView()
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: ListView.builder(
          //remover o Scroll
          shrinkWrap: true,
          itemCount: _order.foods.length,
          itemBuilder: (context, index) {
            final Food food = _order.foods[index];
            return FoodCard(
              food: food,
              notShowIconCart: true,
            );
          }),
    );
  }

  /// Avaliação do pedido
  Widget _builEvaluationsOrder(context) {
    return _order.evaluations.length > 0
        ? Container(
            padding: EdgeInsets.only(left: 10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _order.evaluations.length,
              itemBuilder: (context, index) {
                final Evaluation evaluation = _order.evaluations[index];
                return _builEvaluationItem(evaluation, context);
              },
            ),
          )
        : Container(
            height: 40,
            margin: EdgeInsets.only(top: 10, bottom: 40),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/evaluation-order');
              },
              color: Colors.orange,
              elevation: 2.2,
              child: Text('Avaliar o pedido'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: Colors.orangeAccent),
              ),
            ),
          );
  }

  Widget _builEvaluationItem(Evaluation evaluation, context) {
    return Card(
      elevation: 2.5,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          border: Border.all(color: Colors.grey[100]),
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RatingBar.builder(
              initialRating: evaluation.stars,
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
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Row(
              children: <Widget>[
                Text(
                  "${evaluation.user.name} - ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  evaluation.comment,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
