import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';
import '../../models/Food.dart';
import '../../models/Evaluation.dart';

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
    ],
    evaluations: [],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhe do Pedido'), centerTitle: true),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildOrderDetails(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _buildOrderDetails(context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Column(
        children: <Widget>[
          _makeTextOrder('Número', _order.identify),
          _makeTextOrder('Data', _order.date),
          _makeTextOrder('Status', _order.status),
          _makeTextOrder('Total', _order.total.toString()),
          _makeTextOrder('Mesa', _order.table),
          _makeTextOrder('Comentário', _order.comment),
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
}
