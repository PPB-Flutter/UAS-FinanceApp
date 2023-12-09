import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finance_app/style/colors.dart';

class Input extends StatefulWidget {
  TextEditingController? controller;
  String? label;
  Input({super.key, this.label, this.controller});

  @override
  State<Input> createState() => _Input();
}

class _Input extends State<Input> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: widget.label,
          labelStyle: TextStyle(fontSize: 17, color: label),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: border)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: primary)),
        ),
      ),
    );
  }
}
