import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/app_theme/app_theme.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = ThemeHolder.themeOf<AppTheme>(context);

    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) => Padding(
              padding: EdgeInsets.only(bottom: 54),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.background
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                            child: Image.asset('assets/images/hotel.png', fit: BoxFit.fill,),
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Студенческое общежитие ПВГУС', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: theme.titleText), textAlign: TextAlign.start,),
                            Text('Самарская область, Тольятти, ул. Ленинградская, 29', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: theme.subtitleText), textAlign: TextAlign.start),
                          ],
                        )
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('тип:', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: theme.subtitleText), textAlign: TextAlign.start),
                                Text('3-х местный номер', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: theme.accent), textAlign: TextAlign.start),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('телефон:', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: theme.subtitleText), textAlign: TextAlign.start),
                                Text('+78482486816', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: theme.accent), textAlign: TextAlign.start),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        );
      },
      child: Container(
        width: 220,
        decoration: BoxDecoration(
            color: theme.background,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(
              left: 10, right: 10, top: 10, bottom: 20),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/hotel.png', fit: BoxFit.fill,),
                    )
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Студенческое общежитие ПВГУС',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: theme.titleText)),
                    Text('23.02 -> 01.03',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: theme.subtitleText))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
