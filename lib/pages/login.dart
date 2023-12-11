import 'package:finance_app/controller/login_register.dart';
import 'package:finance_app/style/colors.dart';
import 'package:finance_app/widgets/ui/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/ui/input.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  String? title;
  LoginRegisterController? loginRegisterController;
  BuildContext context;
  GoRouterState state;
  Login(this.context, this.state,
      {super.key, this.title, this.loginRegisterController});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  // ignore: unused_field
  FirebaseAuth _auth = FirebaseAuth.instance;
  var email = TextEditingController(text: "");
  var password = TextEditingController(text: "");
  var hintEmail = false;
  var hintPassword = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (widget.loginRegisterController != null) {
        widget.loginRegisterController!.state = widget.state;
        widget.loginRegisterController!.context = widget.context;
        if (FirebaseAuth.instance.currentUser != null) {
          context.push<bool>(Uri(path: '/dashboard').toString());
        }
      }
    });
  }

  void _login() {
    setState(() async {
      widget.loginRegisterController?.loginCallback(
        email.text.trim(),
        password.text.trim(),
      );
    });
  }

  void _register() {
    setState(() async {
      widget.loginRegisterController?.registerCallback(
        email.text.trim(),
        password.text.trim(),
      );
    });
  }

  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? Column()
        : Scaffold(
            backgroundColor: secondary,
            body: SafeArea(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 240,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 90),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 40),
                                  Text(
                                    widget.title!,
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600,
                                        color: white),
                                  ),
                                  SizedBox(height: 40)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 280,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: white,
                      ),
                      height: 290,
                      width: 340,
                      child: Column(children: [
                        SizedBox(height: 20),
                        Input(
                          label: "Email Address",
                          controller: email,
                          hint: hintEmail,
                        ),
                        SizedBox(height: 20),
                        Input(
                          label: "Password",
                          controller: password,
                          hint: hintPassword,
                        ),
                        SizedBox(height: 20),
                        Button(
                          label: "Login",
                          width: 300,
                          onTap: () {
                            setState(() {
                              if (email.text.trim() == "") {
                                hintEmail = true;
                                return;
                              }
                              if (password.text.trim() == "") {
                                hintPassword = true;
                                return;
                              }
                              _login();
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        Button(
                          label: "Register",
                          width: 300,
                          onTap: () {
                            setState(() {
                              if (email.text.trim() == "") {
                                hintEmail = true;
                                return;
                              }
                              if (password.text.trim() == "") {
                                hintPassword = true;
                                return;
                              }
                              _register();
                            });
                          },
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
