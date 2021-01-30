import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';
import '../../models/Food.dart';
import '../../models/Evaluation.dart';
import '../../widgets/food_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  Order _order = Order(
    identify: '4545sdf4',
    date: '30/02/2021',
    status: 'open',
    table: 'Mesa XYZ',
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
    evaluations: [],
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
          _makeTextOrder('Mesa', _order.table),
          _makeTextOrder('Comentário', _order.comment),

          /// Listar produtos
          Container(height: 20),
          Text('Comidas',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
          _builFoodsOrder(context),
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
    return ListView.builder(
        //remover o Scroll
        shrinkWrap: true,
        itemCount: _order.foods.length,
        itemBuilder: (context, index) {
          final Food food = _order.foods[index];
          return FoodCard(
            identify: food.identify,
            description: food.description,
            image: food.image,
            price: food.price,
            title: food.title,
            notShowIconCart: true,
          );
        });
  }
}
