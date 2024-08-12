import 'package:flutter/material.dart';

class AppDimensions {
  final BuildContext context;

  AppDimensions(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  var paddingForpagePaddingGlobal = 0.015;
  EdgeInsets get pagePaddingGlobal =>
      EdgeInsets.all(screenWidth * paddingForpagePaddingGlobal);

  Radius get globalCornerRadius => Radius.circular(screenWidth * .040);
  // Example responsive padding and margin
  EdgeInsets get responsivePadding => EdgeInsets.all(screenWidth * 0.05);
  EdgeInsets get responsiveMargin => EdgeInsets.all(screenWidth * 0.05);

  // Other dimensions can be added similarly
  double get smallPadding => screenWidth * 0.03;
  double get mediumPadding => screenWidth * 0.05;
  double get largePadding => screenWidth * 0.08;

  double get sizedBoxHeightGlobal => 15;
  double get halfTextFieldWidth =>
      (screenWidth * 0.48) - (paddingForpagePaddingGlobal);
}
