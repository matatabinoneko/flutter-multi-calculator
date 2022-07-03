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
  static double minCalculatorSnapPoint = 0.5;
  late double snapPointHeight;

  SizeConfig(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    statusBarHeight = _mediaQueryData!.padding.top;
    bottomBarHeight = _mediaQueryData!.padding.bottom;
    maxCalculatorHeight = screenWidth * 5 / 4;
    minCalculatorHeight = 30;
    headerHeight = 40;
    calculatorNameTextWidth = screenWidth * 0.3;
    snapPointHeight =
        (maxCalculatorHeight - minCalculatorHeight) * minCalculatorSnapPoint +
            minCalculatorHeight;
  }
}
