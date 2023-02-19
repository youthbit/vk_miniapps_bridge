import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/app_theme/app_theme.dart';
import 'package:flutter_app/presentation/vk/pages/widgets/achivement.dart';
import 'package:flutter_app/presentation/vk/pages/widgets/vk_app_bar.dart';
import 'package:flutter_app/presentation/vk/widgets/ad_booking_card.dart';
import 'package:flutter_app/presentation/vk/widgets/booking_card.dart';
import 'package:flutter_app/presentation/vk/widgets/vk_button.dart';
import 'package:flutter_app/user_singleton.dart';
import 'package:vk_bridge/vk_bridge.dart';

class VkHomePage extends StatefulWidget {

  VkHomePage({Key? key}) : super(key: key);

  @override
  State<VkHomePage> createState() => _VkHomePageState();
}

class _VkHomePageState extends State<VkHomePage> {

  int currentCities = 4;

  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      currentCities += 1;
      setState(() {});
      AppTheme theme = ThemeHolder.themeOf<AppTheme>(context);

      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) => Padding(
            padding: EdgeInsets.only(bottom: 54),
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: theme.background
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: SizedBox(
                          height: 250,
                          width: 250,
                          child: Image.asset('assets/images/building.png')
                      ),
                    )
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Вы посетили новый город!', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: theme.titleText),),
                            SizedBox(height: 10,),
                            Container(
                              height: 48,
                              width: double.infinity,
                              child: VKButton(child: Text('Продолжить'), onPressed: () => Navigator.pop(context),),
                            )
                          ],
                        )
                      )
                  ),
                ],
              ),
            ),
          )
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = ThemeHolder.themeOf<AppTheme>(context);

    return Scaffold(
      backgroundColor: theme.backgroundSc,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Главная', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: theme.accent),),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 550,
                decoration: BoxDecoration(
                    color: theme.background,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
                  child: Stack(
                    children: [

                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              VKAppBar(name: UserSingleton().name!, role: 'Студент', photoURL: UserSingleton().photoUrl!,),
                              SizedBox(height: 5,),
                              Divider(color: Color(0x249AA2AC),),
                            ],
                          )
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Image.asset('assets/images/rocket.png', fit: BoxFit.contain,),
                              ),
                              Text('$currentCities', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 64, color: theme.customAccent),),
                              Text('городов посещено с Нами', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: theme.titleText),)
                            ],
                          )
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Так держать! Сейчас ты на 3 месте в списке', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: theme.subtitleText),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                    flex: 2,
                                    fit: FlexFit.tight,
                                    child: VKButton(
                                      child: Text('Установить приложение'),
                                    )
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: VKButton.alternative(
                                      onPressed: () => VKBridge.instance.showWallPostBox('Я посетил уже ${currentCities} города с студтуризм.рф!\n\nПрисоединяйся ко мне в приложении: https://vk.com/app51558022'),
                                      child: Text('Поделиться'),
                                    ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Мои бронирования', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: theme.titleText),),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => i < 1? BookingCard() : AdBookingCard(),
                  separatorBuilder: (_, i) => SizedBox(width: 10,),
                  itemCount: 2),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Достижения', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: theme.titleText),),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => [
                    Achivement(text: 'Самое глубокое озеро', subtext: 'Посетить Иркутск', enabled: true,),
                    Achivement(text: 'Культурная столица', subtext: 'Посетить Санкт-Петербург', enabled: true,),
                    Achivement(text: 'В тесноте, да не в обиде', subtext: 'Посетить Москву', enabled: true,),
                    Achivement(text: 'Совершил 3 поездки', enabled: true,),
                    Achivement(text: 'Неоткрываемое', enabled: false,),
                  ][i],
                  separatorBuilder: (_, i) => SizedBox(width: 10,),
                  itemCount: 4),
            ),
          ],
        ),
      ),
    );
  }
}
