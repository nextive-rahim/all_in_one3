import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(

 pageTransitionsTheme: PageTransitionsTheme(
    builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
      TargetPlatform.values,
      value: (_) => const FadeForwardsPageTransitionsBuilder(),
    ),
  ),
  fontFamily: 'Inter',
  scaffoldBackgroundColor: CommonColor.whiteColor,
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: CommonColor.whiteColor,
      titleTextStyle: TextStyle(
        color: CommonColor.purpleColor1,
        fontSize: 20,
        fontFamily: 'Inter',
      ),
      // shape: OutlineInputBorder(
      //   borderSide: BorderSide.none,
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(10),
      //     bottomRight: Radius.circular(10),
      //   ),
      // ),
      iconTheme: IconThemeData(color: AppColors.white)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0, backgroundColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      maximumSize: const Size(double.infinity, 40),
      minimumSize: const Size(double.infinity, 40),
      // maximumSize: double.infinity,
      textStyle: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    errorStyle: const TextStyle(
      fontSize: 0.01,
      height: 0.01,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: AppColors.primary,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: 0.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 0.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 0.5,
      ),
    ),
  ),
  useMaterial3: true,
);
