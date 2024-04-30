import 'package:flutter/material.dart';

class GColors {
  GColors._();

  // App Colors
  static const Color primary = Color(0xFF1FD271);
  static const Color secondary = Color(0xFF0FC2A5);
  static const Color accent = Color(0xFF9AADBB);
//003B3F
//072B3B
  // gradient color for containers dark
  static const Gradient linerGradientForContainerDark = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [Color(0xFF003B3F), Color(0xFF072B3B)]);

  static const Gradient linerGradientForWeatherContainerDark = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [Color(0xFF003B3F), Color(0xFF072B3B)]);

  static const Gradient linerGradientForContainerLight = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [GColors.softGrey, GColors.softGrey]);

  /// gradient color for containers
  static const Gradient linerGradientBgDarkForHome = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [Color(0xFF013C40), Color(0xFF062A3A)]);
  static const Gradient linerGradientBgLightForHome = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [GColors.secondary, GColors.primary]);

  ///// gradient color for Auth Page
  static const Gradient linerGradientBgDarkForAuth = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF013C40), Color(0xFF062A3A)]);
  static const Gradient linerGradientBgLightForAuth = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)]);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  static const Color darkNav = Color(0xFF071C2D);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C7570);
  static const Color buttonDissabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color validation = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
