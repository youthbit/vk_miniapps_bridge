import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/app_theme/app_theme.dart';

class AdBookingCard extends StatelessWidget {
  const AdBookingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = ThemeHolder.themeOf<AppTheme>(context);

    return Container(
        width: 220,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2.5, color: theme.accent)
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: theme.accent, size: 40,),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Забронировать в приложении', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: theme.subtitleText), textAlign: TextAlign.center,),
                  )
                ],
              ),
            ),
          ]
        )
    );
  }
}
