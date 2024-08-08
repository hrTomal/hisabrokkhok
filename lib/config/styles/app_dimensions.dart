import 'package:flutter/material.dart';

class AppDimensions {
  final BuildContext context;

  AppDimensions(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  EdgeInsets get pagePaddingGlobal => EdgeInsets.all(screenWidth * 0.015);

  double get globalSizedBoxHeight => screenWidth * 0.001;

  // Example responsive padding and margin
  EdgeInsets get responsivePadding => EdgeInsets.all(screenWidth * 0.05);
  EdgeInsets get responsiveMargin => EdgeInsets.all(screenWidth * 0.05);

  // Other dimensions can be added similarly
  double get smallPadding => screenWidth * 0.03;
  double get mediumPadding => screenWidth * 0.05;
  double get largePadding => screenWidth * 0.08;
}
