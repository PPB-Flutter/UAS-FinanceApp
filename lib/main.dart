import 'package:finance_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'route_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: my_routers,
        theme: ThemeData(
          primarySwatch: colorPrimary,
        )
        // home: Login(
        //   title: "Mamoney",
        //   onLogin: loginRegisterController.loginCallback,
        //   onRegister: loginRegisterController.registerCallback,
        // ),
        );
  }
}
