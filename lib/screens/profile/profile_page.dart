import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu perfil'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: _buildProfileScreen(context),
      ),
      bottomNavigationBar: FlutterFoodBottomNavigator(3),
    );
  }

  Widget _buildProfileScreen(context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        // Alinha tudo no centro
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Marcelo J',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Container(height: 12),
          Text(
            'sac@joiamarketing.com.br',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          Container(height: 22),

          /// Logout
          Container(
            child: RaisedButton(
              onPressed: () {
                print('Logout');
              },
              child: Text("Sair"),
              elevation: 2.2,
              color: Colors.red,

              // Formatar
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: Colors.redAccent),
              ),
            ),
          )
        ],
      ),
    );
  }
}
