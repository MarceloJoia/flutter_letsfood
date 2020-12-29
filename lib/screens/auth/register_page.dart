import 'package:flutter/material.dart';

import './widgets/heading_auth.dart';

class RegisterScreen extends StatelessWidget {
  /// Pegar largura e altura dsa tela
  double _deviceWidth;
  double _deviceHeight;

  @override
  Widget build(BuildContext context) {
    /// Pagar a largura da tela do Celular
    _deviceWidth = MediaQuery.of(context).size.width;

    /// Pagar a altura da tela do Celular
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: _loginPageUI(context),
      ),
    );
  }

  Widget _loginPageUI(context) {
    return Container(
      /// Pegar a largura proporcianal da tela
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),

      child: Column(
        children: <Widget>[
          // Dar um Padding usar o Container
          Container(height: 40),

          //_headingAuth(),
          HeadingAuth(),
          // Dar um Padding usar o Container
          Container(height: 20),

          _formLogin(context),
          // Dar um Padding usar o Container
          Container(height: 10),

          _loginButton(context),
          // Dar um Padding usar o Container
          Container(height: 20),
          _textRegister(context),
        ],
      ),
    );
  }

  Widget _formLogin(context) {
    return Container(
      //height: 150,
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
          _nameTextFild(context),
          _emailTextFild(context),
          _passwordTextFild(context),
        ],
      ),
    );
  }

  Widget _nameTextFild(context) {
    return TextFormField(
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
        hintText: 'Nome Completo',
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _emailTextFild(context) {
    return TextFormField(
      autocorrect: false,
      autofocus: false,
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
      //pegar o tamanho total
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () {
          print('login...');
          Navigator.pushReplacementNamed(context, '/restaurants');
        },
        // Estilo
        color: Theme.of(context).primaryColor,
        child: Text('Cadastrar'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  Widget _textRegister(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: Text(
        'Já tem cadastro? Clique Aqui!',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18.2),
      ),
    );
  }
}
