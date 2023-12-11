import 'package:finance_app/controller/add.dart';
import 'package:finance_app/controller/dashboard.dart';
import 'package:finance_app/controller/login_register.dart';
import 'package:finance_app/widgets/bottom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/dashboard.dart';
import 'pages/login.dart';
import 'pages/add.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => const MainPage());
//       case '/second':
//         return MaterialPageRoute(builder: (_) => const SecondPage());
//       default:
//         return MaterialPageRoute(builder: (_) => const ErrorPage());
//     }
//   }
// }
DashboardController dashboardController = DashboardController();
LoginRegisterController loginRegisterController =
    LoginRegisterController(dashboardController: dashboardController);

AddController addController = AddController();

final my_routers = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => Login(
        context,
        state,
        title: "Mamoney",
        loginRegisterController: loginRegisterController,
      ),
    ),
    GoRoute(
      path: "/dashboard",
      builder: (context, state) => BottomNavigator(context, state,
          dashboardController: dashboardController,
          addController: addController),
    ),
    GoRoute(
      path: "/add",
      builder: (context, state) => Add(context, state,
          dashboardController: dashboardController,
          addController: addController),
    ),
  ],
);
    // errorBuilder: (context, state) => const ErrorPage(),
    // debugLogDiagnostics: true);
