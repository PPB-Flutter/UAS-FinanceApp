import 'package:finance_app/controller/add.dart';
import 'package:finance_app/controller/dashboard.dart';
import 'package:finance_app/style/colors.dart';
import 'package:finance_app/widgets/ui/button.dart';
import 'package:finance_app/widgets/ui/dropdown.dart';
import 'package:finance_app/widgets/ui/input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/state.dart';

class Add extends StatefulWidget {
  GoRouterState state;
  BuildContext context;
  DashboardController? dashboardController;
  AddController? addController;
  Add(this.context, this.state,
      {super.key, this.dashboardController, this.addController});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String _selectedOption = "Income"; // Default selected option
  var amount = TextEditingController(text: "");
  var date = TextEditingController(text: "");
  var note = TextEditingController(text: "");
  bool hintAmount = false;
  bool hintDate = false;
  bool hintNote = false;

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
                height: 180,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Text(
                                "Adding Mamoney",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
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
                // height: 440,
                width: 340,
                child: Column(children: [
                  SizedBox(height: 20),
                  DropDown(
                    _selectedOption,
                    label: "Type",
                    onChanged: (newValue) {
                      setState(() {
                        _selectedOption = newValue!;
                      });
                    },
                    items: ["Income", "Expenses"],
                  ),
                  SizedBox(height: 20),
                  Input(
                    label: "Amount",
                    controller: amount,
                    hint: hintAmount,
                  ),
                  SizedBox(height: 20),
                  Input(
                    label: "Date",
                    controller: date,
                    hint: hintDate,
                  ),
                  SizedBox(height: 20),
                  Input(
                    label: "Note",
                    controller: note,
                    hint: hintNote,
                  ),
                  SizedBox(height: 20),
                  Button(
                    label: "Save",
                    width: 300,
                    onTap: () {
                      setState(() {
                        if (amount.text.trim() == "") {
                          hintAmount = true;
                          return;
                        }

                        if (date.text.trim() == "") {
                          hintDate = true;
                          return;
                        }

                        if (note.text.trim() == "") {
                          hintNote = true;
                          return;
                        }

                        widget.addController!
                            .addCallback(_selectedOption, amount.text,
                                date.text, note.text)
                            .then((value) => context.push<bool>(
                                Uri(path: '/dashboard').toString()));
                      });
                    },
                  ),
                  SizedBox(height: 20),
                ]),
              ))
        ],
      )),
    );
  }
}
