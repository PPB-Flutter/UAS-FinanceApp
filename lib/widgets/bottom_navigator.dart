import 'package:finance_app/controller/dashboard.dart';
import 'package:finance_app/pages/dashboard.dart';
import 'package:finance_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class BottomNavigator extends StatefulWidget {
  int page = 0;
  GoRouterState state;
  BuildContext context;
  DashboardController? dashboardController;

  BottomNavigator(this.context, this.state,
      {super.key, this.page = 0, this.dashboardController});

  @override
  State<BottomNavigator> createState() => _BottomState();
}

class _BottomState extends State<BottomNavigator> {
  Widget setPage(page) {
    switch (page) {
      case 0:
        return Dashboard(widget.context, widget.state,
            dashboardController: widget.dashboardController);
      default:
        return Center();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: setPage(widget.page),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            context.push<bool>(Uri(path: '/add').toString());
          });
        },
        child: Icon(Icons.add),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.page = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: widget.page == 0 ? primary : label,
                ),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  // setState(() {
                  //   widget.page = 1;
                  // });
                  context.goNamed('profil');
                },
                child: Icon(
                  Icons.logout,
                  size: 30,
                  color: widget.page == 1 ? primary : label,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
