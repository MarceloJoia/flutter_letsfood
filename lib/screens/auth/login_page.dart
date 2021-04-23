import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import './widgets/heading_auth.dart';
import '../../stores/auth.store.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  /// Pegar largura e altura dsa tela
  double _deviceWidth;
  double _deviceHeight;

  AuthStore _authStore;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of<AuthStore>(context);

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => _loginPageUI(context),
        ),
      ),
    );
  }

  Widget _loginPageUI(context) {
    return Container(
      /// Pegar a largura proporcianal da tela
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),

      child: Column(
        children: <Widget>[
          Container(height: 40),
          HeadingAuth(),
          Container(height: 20),
          _formLogin(context),
          Container(height: 10),
          _loginButton(context),
          Container(height: 20),
          _textRegister(context),
        ],
      ),
    );
  }

  Widget _formLogin(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(144, 0, 0, 0.2),
            blurRadius: 20.0,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          _emailTextFild(context),
          _passwordTextFild(context),
        ],
      ),
    );
  }

  Widget _emailTextFild(context) {
    return TextFormField(
      controller: _email,
      autocorrect: false,
      autofocus: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: 'E-mail',
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _passwordTextFild(context) {
    return TextFormField(
      controller: _password,
      autocorrect: false,
      autofocus: true,
      obscureText: true, //oculta a senha
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: 'Senha',
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _loginButton(context) {
    return Container(
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () => _authStore.isLoading ? null : auth(context),
        color: Theme.of(context).primaryColor,
        child: Text(_authStore.isLoading ? 'Autenticando...' : 'LOGIN'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  Widget _textRegister(context) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterScreen()),);
        Navigator.pushReplacementNamed(context, '/register');
      },
      child: Text(
        'Cadastrar-se',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18.2),
      ),
    );
  }

  Future auth(context) async {
    await _authStore.auth(_email.text, _password.text);

    Navigator.pushReplacementNamed(context, '/restaurants');
  }
}
