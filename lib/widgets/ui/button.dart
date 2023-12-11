import 'package:finance_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef ButtonCallback = void Function();

// ignore: must_be_immutable
class Button extends StatefulWidget {
  String? label;
  ButtonCallback? onTap;
  double height;
  double width;
  Color? color;
  Button(
      {super.key,
      this.label,
      this.color,
      this.onTap,
      this.width = 120,
      this.height = 50});

  @override
  State<Button> createState() => _Button();
}

class _Button extends State<Button> {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.color ?? primary,
        ),
        width: widget.width,
        height: widget.height,
        child: Text(
          widget.label!,
          style: TextStyle(
            fontFamily: 's',
            fontWeight: FontWeight.w600,
            color: white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
