import 'package:finance_app/controller/dashboard.dart';
import 'package:finance_app/style/colors.dart';
import 'package:finance_app/widgets/ui/input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/state.dart';

class Add extends StatefulWidget {
  GoRouterState state;
  BuildContext context;
  DashboardController? dashboardController;
  Add(this.context, this.state, {super.key, this.dashboardController});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    setState(() {
      if (widget.dashboardController != null) {
        widget.dashboardController!.state = widget.state;
        widget.dashboardController!.context = widget.context;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [SizedBox(height: 40)],
                      ),
                    )
                  ],
                ),
              )
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
                    label: "",
                  )
                ]),
              ))
        ],
      )),
    );
  }
}