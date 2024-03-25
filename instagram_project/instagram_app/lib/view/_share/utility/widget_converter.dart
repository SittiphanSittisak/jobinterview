import 'package:flutter/material.dart';

class WidgetConverter {
  static Alignment positionToAlignment({required BuildContext context, required double left, required double top}) {
    final screenSize = MediaQuery.of(context).size;
    final alignmentX = (left / screenSize.width) * 2 - 1;
    final alignmentY = (top / screenSize.height) * 2 - 1;
    return Alignment(alignmentX, alignmentY);
  }
}
