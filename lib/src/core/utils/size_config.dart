import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double screenHeight = .59; //(H)=h+b
  static double? safeUsedHeight; //(h)=H-b

  static double? screenTop;
  static double? screenBottom; //b
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static double? safeAreaHorizontal;
  static double? safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    screenTop = _mediaQueryData!.padding.top;
    screenBottom = _mediaQueryData!.padding.bottom;
    safeUsedHeight = (screenHeight - screenBottom!);

    blockSizeHorizontal = (screenWidth! / 100);
    blockSizeVertical = (screenHeight / 100);

    safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight - safeAreaVertical!) / 100;
  }

  Size size = WidgetsBinding.instance.window.physicalSize /
      WidgetsBinding.instance.window.devicePixelRatio;

// Caution! If you think these are static values and are used to build a static UI,  you mustn’t.
// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
  num FIGMA_DESIGN_WIDTH = 1440;
  num FIGMA_DESIGN_HEIGHT = 1024;
  num FIGMA_DESIGN_STATUS_BAR = 25;

  ///This method is used to get device viewport width.
  get width {
    return size.width;
  }

  ///This method is used to get device viewport height.
  get height {
    num statusBar =
        MediaQueryData.fromView(WidgetsBinding.instance.window).viewPadding.top;
    num bottomBar = MediaQueryData.fromView(WidgetsBinding.instance.window)
        .viewPadding
        .bottom;
    num screenHeight = size.height - statusBar - bottomBar;
    return screenHeight;
  }

  ///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
  double getHorizontalSize(double px) {
    return ((px * width) / FIGMA_DESIGN_WIDTH);
  }

  ///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
  double getVerticalSize(double px) {
    return ((px * height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR));
  }

  ///This method is used to set smallest px in image height and width
  double getSize(double px) {
    var height = getVerticalSize(px);
    var width = getHorizontalSize(px);
    if (height < width) {
      return height.toInt().toDouble();
    } else {
      return width.toInt().toDouble();
    }
  }

  ///This method is used to set text font size according to Viewport
  double getFontSize(double px) {
    return getSize(px);
  }

  ///This method is used to set padding responsively
  EdgeInsetsGeometry getPadding({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return getMarginOrPadding(
      all: all,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  ///This method is used to set margin responsively
  EdgeInsetsGeometry getMargin({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return getMarginOrPadding(
      all: all,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  ///This method is used to get padding or margin responsively
  EdgeInsetsGeometry getMarginOrPadding({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (all != null) {
      left = all;
      top = all;
      right = all;
      bottom = all;
    }
    return EdgeInsets.only(
      left: getHorizontalSize(
        left ?? 0,
      ),
      top: getVerticalSize(
        top ?? 0,
      ),
      right: getHorizontalSize(
        right ?? 0,
      ),
      bottom: getVerticalSize(
        bottom ?? 0,
      ),
    );
  }
}
