import 'package:flutter/material.dart';

const primary = Color(0xff368983);
const secondary = Color(0xffE5E5E5);
const white = Color(0xffffffff);
const black = Color(0xff000000);
const red = Color(0xffE74C3C);
const green = Color(0xff2ECC71);
const blue = Color(0xff3498DB);
const label = Color(0xffC5C5C5);
const border = Color(0xffC5C5C5);

MaterialColor colorPrimary = MaterialColor(primary.value, {
  50: Color.fromARGB(255, 53, 133, 127),
  100: Color.fromARGB(255, 48, 122, 117),
  200: Color.fromARGB(255, 38, 112, 107),
  300: Color.fromARGB(255, 28, 102, 97),
  400: primary.withOpacity(0.5),
  500: primary.withOpacity(0.6),
  600: primary.withOpacity(0.7),
  700: primary.withOpacity(0.8),
  800: primary.withOpacity(0.9),
  900: primary.withOpacity(1),
});


// function for custom theme