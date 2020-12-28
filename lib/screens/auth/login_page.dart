import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Text(
          'login',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}

// Container(
//   child: Text('LetsFood',
//       style: TextStyle(color: Theme.of(context).primaryColor)),
// );
