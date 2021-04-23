import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../stores/orders.store.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';
import '../../widgets/custom_circular_progress_indicator.dart';

class OrderScreen extends StatelessWidget {
  OrdersStore _ordersStore;

  @override
  Widget build(BuildContext context) {
    _ordersStore = Provider.of<OrdersStore>(context);
    _ordersStore.getMyOrders();

    return Scaffold(
      appBar: AppBar(title: Text('Meus Pedidos'), centerTitle: true),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Observer(builder: (context) => _buildOrderScreen()),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _buildOrderScreen() {
    return Column(
      children: <Widget>[
        _buildHeader(),
        _ordersStore.isLoading
            ? CustomCircularProgressIndicator(
                textLabel: 'Carregando os pedidos',
              )
            : _buildOrdersList(),
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
      itemCount: _ordersStore.orders.length,
      itemBuilder: (context, index) {
        final Order order = _ordersStore.orders[index];
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
        //print(order.identify);
        Navigator.pushNamed(
          context,
          '/order-details',
          arguments: order.identify,
        );
      },
    );
  }
}
