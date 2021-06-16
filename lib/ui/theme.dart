import 'package:flutter/material.dart';

final titleSize = 16.0;

final contentSize = 14.0;

final smallSize = 12.0;

final largeSize = 20.0;

final primaryColor = Color(0xFF2196F3);

final defaultLeadingIcon = Icon(Icons.arrow_back_ios_outlined);

final primaryTextColor = Colors.black;

final secondaryTextColor = Color(0XFFA1A3AA);

final ThemeData theme = ThemeData.light().copyWith(
    backgroundColor: Colors.grey,
    canvasColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue, primaryColorDark: primaryColor),
    appBarTheme: AppBarTheme(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: titleSize,
            // letterSpacing: 4,
            fontWeight: FontWeight.bold),
        foregroundColor: Colors.white,
        backwardsCompatibility: false,
        centerTitle: true));
