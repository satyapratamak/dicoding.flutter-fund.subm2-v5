import 'package:flutter/cupertino.dart';
import 'dart:ui';

class Colors {
  const Colors();
  static const Color mainColor = const Color(0XFFF6511D);
  static const Color grey = const Color(0xFFE5E5E5);
  static const Color black = const Color(0xFF000000);
  static const primaryGradient = const LinearGradient(
    colors: const [Color(0xFFf6501c), Color(0xFFff7e00)],
    stops: const [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
