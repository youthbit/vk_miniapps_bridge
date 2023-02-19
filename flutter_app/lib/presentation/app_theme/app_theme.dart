import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

class AppTheme extends ExtendedTheme {
  final Color accent, background, backgroundSc, button, titleText, subtitleText;

  final Color customAccent = const Color(0xFF7D6EB8);

  AppTheme(
      {required this.accent,
      required this.background,
      required this.backgroundSc,
      required this.button,
      required this.titleText,
      required this.subtitleText,
      required ThemeData material}): super(material: material);

}
