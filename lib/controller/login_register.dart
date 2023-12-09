// class for login and register controller
import 'package:finance_app/controller/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginRegisterController {
  bool _isLogin = true;
  bool get isLogin => _isLogin;
  bool get isRegister => !_isLogin;
  BuildContext? context;
  GoRouterState? state;
  DashboardController? dashboardController;

  LoginRegisterController({this.dashboardController});

  set isLogin(bool value) {
    _isLogin = value;
  }

  void loginCallback(String email, String password) {
    print("Login $email $password");

    dashboardController!.setBalance(10000);
    dashboardController!.setEmail(email);

    context!.push<bool>(Uri(path: '/dashboard').toString());
  }

  void registerCallback(String email, String password) {
    print("Register $email $password");

    dashboardController!.setBalance(40000);
    dashboardController!.setEmail(email);

    context!.push<bool>(Uri(path: '/dashboard').toString());
  }
}
