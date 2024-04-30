import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom/appbar_theme.dart';
import 'custom/bottom_sheet_theme.dart';
import 'custom/checkbox_theme.dart';
import 'custom/elevated_button_theme.dart';
import 'custom/outlined_button_theme.dart';
import 'custom/text_field_theme.dart';
import 'custom/text_theme.dart';

class GTheme {
  GTheme._();

  // --Light theme --
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: GColors.primary,
    textTheme: GTextTheme.lightTextTheme,
    scaffoldBackgroundColor: GColors.white,
    appBarTheme: GAppBarTheme.lightAppBarTheme,
    checkboxTheme: GCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: GBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: GElevateButtonTheme.lightElevateButtonTheme,
    outlinedButtonTheme: GOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: GTextFormFieldTheme.lightTextFormFieldTheme,
    useMaterial3: true,
  );

  // -- Dark theme --
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: GColors.primary,
    textTheme: GTextTheme.darkTextTheme,
    scaffoldBackgroundColor: const Color(0xFF062A3A).withOpacity(0.6),
    appBarTheme: GAppBarTheme.darkAppBarTheme,
    checkboxTheme: GCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: GBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: GElevateButtonTheme.darkElevateButtonTheme,
    outlinedButtonTheme: GOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: GTextFormFieldTheme.darkTextFormFieldTheme,
    useMaterial3: true,
  );
}
