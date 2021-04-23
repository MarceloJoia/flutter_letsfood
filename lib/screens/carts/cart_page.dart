import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../stores/restaurant.store.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../widgets/show_image_cached_network.dart';
import '../../models/Food.dart';
import '../../stores/foods.store.dart';
import '../../stores/orders.store.dart';

class CartScreen extends StatelessWidget {
  FoodsStore _foodsStore;
  RestaurantsStore _storeRestaurants;
  OrdersStore _ordersStore;
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _foodsStore = Provider.of<FoodsStore>(context);
    _storeRestaurants = Provider.of<RestaurantsStore>(context);
    _ordersStore = Provider.of<OrdersStore>(context);

    final String titlePage = _storeRestaurants.restaurant != null
        ? "Carrinho - ${_storeRestaurants.restaurant.name}"
        : 'Carrinho';

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(titlePage),
        centerTitle: true,
      ),
      body: _buildContentCart(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(2),
    );
  }

  Widget _buildContentCart(context) {
    return ListView(
      shrinkWrap: false,
      children: <Widget>[
        _buildHeader(),
        _buildCartList(context),
        _buildFormComment(context),
        _buildTextTotalCart(),
        _buildCheckout(context),
      ],
    );
  }

  Widget _buildHeader() {
    return Observer(
      builder: (context) => Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: 16, left: 10, bottom: 10),
        child: Text(
          "Total (${_foodsStore.cartItems.length}) Itens",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildCartList(context) {
    return Observer(
      builder: (context) => ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: _foodsStore.cartItems.length,
        itemBuilder: (context, index) {
          final Map<String, dynamic> itemCart = _foodsStore.cartItems[index];
          return _buildCartItem(itemCart, context);
        },
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> itemCart, context) {
    final Food food = itemCart['product'];
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          //padding: EdgeInsets.all(5),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(8),
          ),
          // Imagem
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                // exibe as imagens
                ShowImageCacheNetwork(food.image != null
                    ? food.image
                    : 'https://joiamarketing.com.br/wp-content/uploads/2020/05/cropped-Joia-Marketing-logo-box.png'),
                _showDetailItemCart(food, itemCart, context),
              ],
            ),
          ),
        ),

        // posicionar o bottom de Close
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => _foodsStore.removeFoodCart(food),
              child: Container(
                margin: EdgeInsets.only(top: 2, right: 4),
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }

  Widget _showDetailItemCart(
      Food food, Map<String, dynamic> itemCart, context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 2, bottom: 4, right: 20, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              food.title,
              maxLines: 2,
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).primaryColor),
            ),
            Container(
              //color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "R\$ ${food.price}",
                    maxLines: 2,
                    style: TextStyle(fontSize: 12, color: Colors.green[800]),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => _foodsStore.decrementFoodCart(food),
                          child: Icon(
                            Icons.remove,
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          color: Theme.of(context).primaryColor,
                          child: Text(itemCart['qty'].toString(),
                              style: TextStyle(color: Colors.white)),
                        ),
                        GestureDetector(
                          onTap: () => _foodsStore.incrementFoodCart(food),
                          child: Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
   * Valor total das compras.
   */
  Widget _buildTextTotalCart() {
    return Observer(
        builder: (context) => Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "Valor total: R\$ ${_foodsStore.totalCart}",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                ),
              ),
            ));
  }

  Widget _buildFormComment(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: _commentController,
        autocorrect: true,
        style: TextStyle(color: Theme.of(context).primaryColor),
        cursorColor: Theme.of(context).primaryColor,
        onSaved: (value) {
          print(value);
        },
        decoration: InputDecoration(
          labelText: 'Observações (ex. Sem cebola)',
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
    );
  }

  Widget _buildCheckout(context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 50, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.orange[800],
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 2.0),
            blurRadius: 6,
          ),
        ],
      ),
      child: Observer(
        builder: (context) => RaisedButton(
          onPressed: () =>
              _ordersStore.isMakingOrder ? null : _makeOrder(context),
          child: _ordersStore.isMakingOrder
              ? Text('Fazendo o pedido...')
              : Text('Finalizar Pedido'),
          color: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  Future _makeOrder(context) async {
    await _ordersStore.makeOrder(
      _storeRestaurants.restaurant.uuid,
      _foodsStore.cartItems,
      comment: _commentController.text,
    );

    // Remove os itens do carrinho após finalizar pedidos
    _foodsStore.clearCart();
    // Remove os comentários do pedidos
    _commentController.text = '';

    Navigator.pushReplacementNamed(context, '/my-orders');
  }
}
