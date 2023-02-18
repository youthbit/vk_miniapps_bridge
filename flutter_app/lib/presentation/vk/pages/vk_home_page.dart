import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/app_theme/app_theme.dart';
import 'package:flutter_app/presentation/vk/widgets/booking_card.dart';

class VkHomePage extends StatefulWidget {

  VkHomePage({Key? key}) : super(key: key);

  @override
  State<VkHomePage> createState() => _VkHomePageState();
}

class _VkHomePageState extends State<VkHomePage> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    AppTheme theme = ThemeHolder.themeOf<AppTheme>(context);

    return Scaffold(
      backgroundColor: theme.backgroundSc,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Мои бронирования',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: theme.titleText)),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 300,
            child: ListView.separated(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, i) => BookingCard(),
              separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10,),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
