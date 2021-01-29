import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';

class OrderScreen extends StatelessWidget {
  // Order fake
  List<Order> _orders = [
    new Order(date: '30/02/2021', identify: '5DFJF144'),
    new Order(date: '30/03/2021', identify: '24saF144'),
    new Order(date: '30/04/2021', identify: '247g8g144'),
    new Order(date: '30/03/2021', identify: '24saF144'),
    new Order(date: '30/04/2021', identify: '247g8g144'),
    new Order(date: '30/03/2021', identify: '24dfff8444'),
    new Order(date: '30/04/2021', identify: '2asddass4544'),
    new Order(date: '30/05/2021', identify: '2sgas4'),
    new Order(date: '30/06/2021', identify: '544drghbdf'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meus Pedidos'), centerTitle: true),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildOrderScreen(),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _buildOrderScreen() {
    return Column(
      children: <Widget>[
        _buildHeader(),
        _buildOrdersList(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      // margin Header
      margin: EdgeInsets.all(10),
      // mudar o alinhamento
      alignment: Alignment.topLeft,
      child: Text(
        'Meus Pedidos',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildOrdersList() {
    return Expanded(
        child: ListView.builder(
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        final Order order = _orders[index];
        return _buildItemOrder(order, context);
      },
    ));
  }

  Widget _buildItemOrder(Order order, context) {
    return ListTile(
      title: Text(
        "Pedido #${order.identify}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      subtitle: Text(
        "${order.date}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      trailing: IconTheme(
        data: IconThemeData(color: Theme.of(context).primaryColor),
        child: Icon(Icons.navigate_next),
      ),
      onTap: () {
        print(order.identify);
      },
    );
  }
}
