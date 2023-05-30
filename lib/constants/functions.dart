import 'package:flutter/material.dart';

Color defineColor(String category) {
  Color color;
  switch (category) {
    case 'sport':
      color = const Color(0xffea3350);
      break;
    case 'study':
      color = const Color(0xff3376f7);
      break;
    case 'rest':
      color = const Color(0xfffae24c);
      break;
    case 'work':
      color = const Color(0xfff4b33e);
      break;
    default:
      color = const Color(0xffea3350);
      break;
  }
  return color;
}
