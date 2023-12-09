import 'package:finance_app/controller/login_register.dart';
import 'package:flutter/material.dart';

import 'pages/login.dart';

LoginRegisterController loginRegisterController = LoginRegisterController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(
        title: "Mamoney",
        onLogin: loginRegisterController.loginCallback,
        onRegister: loginRegisterController.registerCallback,
      ),
    );
  }
}
