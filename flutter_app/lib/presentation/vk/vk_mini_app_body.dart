import 'dart:async';

import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/app_theme/app_theme.dart';
import 'package:flutter_app/presentation/vk/pages/vk_home_page.dart';
import 'package:vk_bridge/vk_bridge.dart';

class VKMiniAppBody extends StatefulWidget {
  const VKMiniAppBody({Key? key}) : super(key: key);
  @override
  State<VKMiniAppBody> createState() => _VKMiniAppBodyState();
}

class _VKMiniAppBodyState extends State<VKMiniAppBody> {
  late StreamSubscription _streamSubscription;
  EdgeInsets insets = const EdgeInsets.only(top: 59, bottom: 34);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VKBridge.instance.init().then((value) {
      VKBridge.instance.updateConfigStream.last.then((value) {
        onUpdateConfig(value);
      });

      VKBridge.instance.setViewSettings(
        statusBarStyle: StatusBarStyle.dark,
      );

      _streamSubscription =
          VKBridge.instance.updateConfigStream.listen(onUpdateConfig);
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  void onUpdateConfig(VKWebAppUpdateConfig config) {
    setState(() {
      if (config.insets != null) {
        insets = EdgeInsets.only(
            left: config.insets!.left,
            right: config.insets!.right,
            top: config.insets!.top,
            bottom: config.insets!.bottom);
      }

      if (config.appearance == Appearance.light) {
        VKBridge.instance.setViewSettings(
          statusBarStyle: StatusBarStyle.dark,
        );
        ThemeHolder.of<AppTheme>(context)
            .updateThemeById('lightVK');

      } else {
        VKBridge.instance.setViewSettings(
          statusBarStyle: StatusBarStyle.light,
        );
        ThemeHolder.of<AppTheme>(context)
            .updateThemeById('darkVK');
      }
    });
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }
    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    rebuildAllChildren(context);
    return Container(
      color: ThemeHolder.themeOf<AppTheme>(context).backgroundSc,
      child: Padding(
        padding: insets,
        child: VkHomePage(),
      ),
    );
  }
}
