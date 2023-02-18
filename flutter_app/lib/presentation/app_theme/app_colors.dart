import 'package:flutter/material.dart';

enum MiniAppType {vk, telegram}
enum MiniAppTheme {dark, light}

class AppColors {

  factory AppColors(MiniAppType type, MiniAppTheme theme) {
    if (type == MiniAppType.vk) {
      if (theme == MiniAppTheme.light) {
        return const VKLightColors();
      } else {
        return const VKDarkColors();
      }
    } else {
      if (theme == MiniAppTheme.light) {
        return const VKLightColors();
      } else {
        return const VKDarkColors();
      }
    }
  }

  final Color accent = const Color(0x00000000),
      background = const Color(0x00000000),
      backgroundSc = const Color(0x00000000),
      button = const Color(0x00000000),
      titleText = const Color(0x00000000),
      subtitleText = const Color(0x00000000);
}

class VKLightColors implements AppColors {
  @override
  @override
  @override
  @override
  @override
  @override
  final Color accent = const Color(0xFF4586E4),
      background = const Color(0xFFFFFFFF),
      backgroundSc = const Color(0xFFFBFBFC),
      button = const Color(0xFFF2F3F5),
      titleText = const Color(0xFF000000),
      subtitleText = const Color(0xFF9AA2AC);

  const VKLightColors();
}

class VKDarkColors implements AppColors {
  @override
  @override
  @override
  @override
  @override
  @override
  final Color accent = const Color(0xFFE1E3E6),
      background = const Color(0xFF191919),
      backgroundSc = const Color(0xFF0A0A0A),
      button = const Color(0xFF454647),
      titleText = const Color(0xFFE1E3E6),
      subtitleText = const Color(0xFF76787A);

  const VKDarkColors();
}
