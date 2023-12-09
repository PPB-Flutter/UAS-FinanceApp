import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardController {
  BuildContext? context;
  GoRouterState? state;

  int balance = 0, income = 0, expenses = 0;
  String email = "Dashboard";

  void setBalance(int value) {
    balance = value;
  }

  void setInome(int value) {
    income = value;
  }

  void setExpanses(int value) {
    expenses = value;
  }

  void setEmail(String value) {
    email = value;
  }
}
