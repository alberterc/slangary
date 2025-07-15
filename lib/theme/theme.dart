import 'package:flutter/material.dart';

ThemeData theme(Color seed, Brightness brightness, bool isAmoled) {
  const textColor = Color.fromRGBO(46, 46, 46, 1);
  const textInvertColor = Color.fromRGBO(228, 228, 228, 1);
  const textHintColor = Color.fromRGBO(118, 118, 118, 1);
  const buttonColor = textColor;

  final scheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: brightness,
    surface: isAmoled
        ? Colors.black
        : brightness == Brightness.light
            ? const Color.fromRGBO(255, 243, 224, 1.0)
            : const Color.fromRGBO(255, 243, 224, 1.0),
  );

  return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      iconTheme: const IconThemeData(color: textColor),
      fontFamily: 'Sarabun',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32, color: textColor, height: 1.2),
        headlineMedium: TextStyle(fontSize: 20, color: textColor, height: 1.2),
        bodyLarge: TextStyle(fontSize: 16, color: textColor, height: 1.2),
        bodySmall: TextStyle(fontSize: 14, color: textColor, height: 1.2),
      ),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              foregroundColor: textInvertColor,
              textStyle: const TextStyle(fontSize: 16),
              backgroundColor: buttonColor)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: textColor,
              textStyle: const TextStyle(fontSize: 16),
              side: const BorderSide(color: buttonColor))),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 16, color: textHintColor),
        filled: false,
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(borderSide: BorderSide.none),
        prefixIconColor: textHintColor,
      )
      // appBarTheme: const AppBarTheme(
      //   backgroundColor: Colors.teal,
      //   shadowColor: Colors.transparent,
      //   surfaceTintColor: Colors.transparent,
      //   scrolledUnderElevation: 0,
      //   elevation: 0,
      // )
      );
}
