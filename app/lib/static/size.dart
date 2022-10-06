import 'package:flutter/cupertino.dart';

class SizeConfig {
  MediaQueryData? _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;
  late double statusBarHeight;
  static double headerHeight = 40;
  late double maxCalculatorHeight;
  static double minCalculatorHeight = 30.0;
  late double safeAreaHorizontal;
  late double safeAreaVertical;
  late double bottomBarHeight;
  late double calculatorNameTextWidth;
  late double minCalculatorSnapPoint;
  late double snapPointHeight;
  static double maxWindowHeight = 150.0;
  static double minWindowHeight = 120.0;

  SizeConfig(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    statusBarHeight = _mediaQueryData!.padding.top;
    bottomBarHeight = _mediaQueryData!.padding.bottom;
    maxCalculatorHeight =
        screenHeight - statusBarHeight - headerHeight - maxWindowHeight;
    minCalculatorHeight = 30;
    calculatorNameTextWidth = screenWidth * 0.3;
    minCalculatorSnapPoint = (screenHeight -
            statusBarHeight -
            headerHeight -
            minWindowHeight * 2.5) /
        maxCalculatorHeight;
    snapPointHeight =
        (maxCalculatorHeight - minCalculatorHeight) * minCalculatorSnapPoint +
            minCalculatorHeight;
  }
}
