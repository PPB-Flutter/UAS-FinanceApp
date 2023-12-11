// class for login and register controller
import 'package:finance_app/controller/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRegisterController {
  FirebaseAuth get _auth => FirebaseAuth.instance;
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

  Future<void> loginCallback(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Login successful: ${userCredential.user?.email}");

      dashboardController!.setBalance(10000);
      dashboardController!.setEmail(email);

      context?.push<bool>(Uri(path: '/dashboard').toString());
    } catch (e) {
      print("Login failed: $e");
      // Handle login failure (show error message, etc.)
    }
  }

  Future<void> registerCallback(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Registration successful: ${userCredential.user?.email}");

      dashboardController!.setBalance(40000);
      dashboardController!.setEmail(email);

      context?.push<bool>(Uri(path: '/login').toString());
    } catch (e) {
      print("Registration failed: $e");
      // Handle registration failure (show error message, etc.)
    }
  }
}
