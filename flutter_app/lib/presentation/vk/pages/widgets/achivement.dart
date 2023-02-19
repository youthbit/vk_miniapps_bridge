import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/app_theme/app_theme.dart';
import 'package:vk_bridge/vk_bridge.dart';

class Achivement extends StatelessWidget {
  String text, subtext;

  bool enabled;

  Achivement({Key? key,required this.text, this.subtext = '', required this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = ThemeHolder.themeOf<AppTheme>(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) => Padding(
              padding: EdgeInsets.only(bottom: 54),
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end:  Alignment.bottomLeft,
                      colors: enabled? [
                        Color(0xFF7FACED),
                        Color(0xFF4586E4),
                      ] : [
                        Color(0xFFC3C3C3),
                        Color(0xFF878787),
                      ]
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: enabled? Image.asset('assets/images/achivement.png'): Image.asset('assets/images/dachivement.png'),
                          ),
                          Text(text, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),),
                          Text(subtext, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(
                              0xFFE5E5E5),))
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0x66FFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Есть у 76% пользователей', style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () => VKBridge.instance.showWallPostBox('Я заработал достижение "${text}"!\n\nПрисоединяйся ко мне в приложении: https://vk.com/app51558022?'),
                                    child: Text(enabled? 'Поделиться' : 'Не получено', style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, top: 20),
                          child: Text('Достижение', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),),
                        )
                    )
                  ],
                ),
              ),
            )
        );
      },
      child: AspectRatio(
        aspectRatio: 4/5,
        child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 7,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end:  Alignment.bottomLeft,
                    colors: enabled? [
                      Color(0xFF7FACED),
                      Color(0xFF4586E4),
                    ] : [
                      Color(0xFFC3C3C3),
                      Color(0xFF878787),
                    ]
                ),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: enabled? Image.asset('assets/images/achivement.png'): Image.asset('assets/images/dachivement.png'),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

}