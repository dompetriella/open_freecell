import 'package:flutter/material.dart';

var theme = ThemeData(
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple.shade400,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(10)))));
