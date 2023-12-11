import 'package:finance_app/controller/add.dart';
import 'package:finance_app/controller/dashboard.dart';
import 'package:finance_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/state.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  GoRouterState state;
  BuildContext context;
  DashboardController? dashboardController;
  AddController? addController;
  Dashboard(this.context, this.state,
      {super.key, this.dashboardController, this.addController});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (widget.dashboardController != null) {
        widget.dashboardController!.state = widget.state;
        widget.dashboardController!.context = widget.context;
      }
    });

    if (widget.addController != null) {
      try {
        widget.addController?.readAll().then((rows) {
          setState(() {
            int index = 0;
            data = [];
            print(rows);
            rows?.docs.forEach((element) {
              int type = element.data()["name"] == "Income" ? 1 : -1;

              if (index == 0) {
                widget.dashboardController!.balance = 0;
                widget.dashboardController!.income = 0;
                widget.dashboardController!.expenses = 0;
              }
              widget.dashboardController!.balance +=
                  (element.data()["amount"] as int) * type;
              if (type == 1)
                widget.dashboardController!.income +=
                    (element.data()["amount"] as int);
              else
                widget.dashboardController!.expenses +=
                    (element.data()["amount"] as int);
              data.add({...(element.data()), "id": element.id});
              print(element.data());
              index++;
            });
          });
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
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
                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Mamoney",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                      color: white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  widget.dashboardController!.email,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: white),
                                ),
                              ],
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
              top: 150,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorPrimary[200],
                    boxShadow: [
                      BoxShadow(
                          color: colorPrimary[300]!.withOpacity(0.7),
                          blurRadius: 10)
                    ]),
                height: 170,
                width: 400,
                child: Column(children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: white,
                          ),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          'Rp. ${widget.dashboardController!.balance}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: colorPrimary[50],
                              child: Icon(
                                Icons.arrow_downward,
                                color: white,
                                size: 19,
                              ),
                            ),
                            SizedBox(width: 7),
                            Text(
                              'Income',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: label,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: colorPrimary[50],
                              child: Icon(
                                Icons.arrow_upward,
                                color: white,
                                size: 19,
                              ),
                            ),
                            SizedBox(width: 7),
                            Text(
                              'Expenses',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: label,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp. ${widget.dashboardController!.income}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: white,
                          ),
                        ),
                        Text(
                          'Rp. ${widget.dashboardController!.expenses}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 350), // Set the desired top margin
              child: Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        context.push<bool>(Uri(
                          path: '/add/${data[index]['id']}',
                        ).toString());
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: label, // Border color
                            width: 2.0, // Border width
                          ),
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        child: ListTile(
                          title: Text(
                            data[index]['name'],
                            style: TextStyle(
                                color: (data[index]['name'] == "Income"
                                    ? black
                                    : red)),
                          ),
                          subtitle: Text(data[index]['date']),
                          trailing: Text(
                            "Rp. " +
                                (data[index]['name'] == "Income" ? "+" : "-") +
                                data[index]['amount'].toString(),
                            style: TextStyle(
                                color: (data[index]['name'] == "Income"
                                    ? black
                                    : red)),
                          ), // Replace with your amount
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
