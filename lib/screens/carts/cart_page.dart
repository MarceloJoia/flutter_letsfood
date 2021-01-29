import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../widgets/show_image_cached_network.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Carrinho'),
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
        Expanded(child: _buildCartList(context)),
        _buildFormComment(context),
        _buildTextTotalCart(),
        _buildCheckout(context),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 16, left: 10, bottom: 10),
      child: Text(
        "Total (3) Itens",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildCartList(context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 6,
      itemBuilder: (context, index) => _buildCartItem(context),
    );
  }

  Widget _buildCartItem(context) {
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
                ShowImageCacheNetwork(
                    'https://joiamarketing.com.br/wp-content/uploads/2020/05/cropped-Joia-Marketing-logo-box.png'),
                _showDetailItemCart(context),
              ],
            ),
          ),
        ),

        // posicionar o bottom de Close
        Align(
          alignment: Alignment.topRight,
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
        ),
      ],
    );
  }

  Widget _showDetailItemCart(context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 2, bottom: 4, right: 20, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pizza Hut',
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
                    "R\$ 399.30",
                    maxLines: 2,
                    style: TextStyle(fontSize: 12, color: Colors.green[800]),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.remove,
                            size: 24, color: Colors.grey.shade700),
                        Container(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          color: Theme.of(context).primaryColor,
                          child:
                              Text('2', style: TextStyle(color: Colors.white)),
                        ),
                        Icon(Icons.add, size: 24, color: Colors.grey.shade700),
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

  /**
   * Valor total das compras.
   */
  Widget _buildTextTotalCart() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Text(
        "Valor total: R\$ 495.20",
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildFormComment(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
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
      child: RaisedButton(
        onPressed: () {
          print('Checkout..');
        },
        child: Text('Enviar Pedido'),
        color: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
