import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finance_app/style/colors.dart';

class DropDown extends StatefulWidget {
  String? value;
  List<String> items;
  Function(String?)? onChanged;
  String label;
  DropDown(this.value,
      {super.key, this.label = "", this.items = const [], this.onChanged});

  @override
  State<DropDown> createState() => _DropDown();
}

class _DropDown extends State<DropDown> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField<String>(
        value: widget.value,
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
        borderRadius: BorderRadius.circular(10),
        onChanged: (newValue) {
          setState(() {
            if (widget.onChanged != null) widget.onChanged!(newValue!);
          });
        },
        items: widget.items
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
      ),
    );
  }
}
