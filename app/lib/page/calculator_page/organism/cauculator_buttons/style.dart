import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';

class NumberButtonStyle {
  Color pushedColor = Colors.green;
  Color color = Colors.grey;
  double radius = 40;
  late double width;

  NumberButtonStyle(BuildContext context) {
    final _sizeConfig = SizeConfig(context);
    width = _sizeConfig.screenWidth * 0.2;
  }
}

class ZeroButtonStyle {
  Color pushedColor = Colors.green;
  Color color = Colors.grey;
  double radius = 40;
  late double width;

  ZeroButtonStyle(BuildContext context) {
    final _sizeConfig = SizeConfig(context);
    width = _sizeConfig.screenWidth * 0.4;
  }
}

class FunctionButtonStyle {
  Color pushedColor = Colors.green;
  Color color = Colors.orange;
  double radius = 40;
  late double width;

  FunctionButtonStyle(BuildContext context) {
    final _sizeConfig = SizeConfig(context);
    width = _sizeConfig.screenWidth * 0.2;
  }
}
