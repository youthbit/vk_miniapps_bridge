import 'dart:async';

import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

import 'presentation/app_theme/app_theme.dart';
import 'presentation/vk/vk_mini_app_body.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlatformMiniApp();
  }
}

class PlatformMiniApp extends StatefulWidget {
  const PlatformMiniApp({super.key});

  @override
  State<PlatformMiniApp> createState() => _PlatformMiniAppState();
}

class _PlatformMiniAppState extends State<PlatformMiniApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return ThemeScope<AppTheme>(
        themeId: 'lightVK',
        availableThemes: {
          'lightVK': AppTheme(
            accent: const Color(0xFF4586E4),
            background: const Color(0xFFFFFFFF),
            backgroundSc: const Color(0xFFEBEDF0),
            button: const Color(0xFFF2F3F5),
            titleText: const Color(0xFF000000),
            subtitleText: const Color(0xFF9AA2AC),
            material: ThemeData.light(),
          ),
          'darkVK': AppTheme(
            accent: const Color(0xFFE1E3E6),
            background: const Color(0xFF191919),
            backgroundSc: const Color(0xFF0A0A0A),
            button: const Color(0xFF454647),
            titleText: const Color(0xFFE1E3E6),
            subtitleText: const Color(0xFF76787A),
            material: ThemeData.dark(),
          )
        },
        themeBuilder: (_, appTheme) => MaterialApp(
          theme: appTheme.material,
          home: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: 200),
              builder:(_, d, __) => Opacity(
                  opacity: d,
                  child: const VKMiniAppBody()
              )
          ),
        ));
  }
}
