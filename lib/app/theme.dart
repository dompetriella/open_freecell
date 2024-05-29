import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

var freecellGreen = HexColor('#9EBC9F');

var theme = ThemeData(
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: freecellGreen,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 5),
                borderRadius: BorderRadius.circular(10)))));
