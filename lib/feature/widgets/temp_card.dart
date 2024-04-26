import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_color.dart';
import 'package:weather_app/core/values/app_assets.dart';
import 'package:weather_app/core/values/text_styles.dart';
import 'package:weather_app/core/values/values.dart';

class TempCard extends StatelessWidget {
  final time;
  final icon;
  final temp;
  TempCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: all5,
      padding: all10,
      height: size140,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [whiteColor.withOpacity(0.2), whiteColor.withOpacity(0)],
        ),
        borderRadius: BorderRadius.circular(size50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            time,
            style: style_white_w500_16_circular,
          ),
          Image.asset(
            icon,
            width: 40,
            height: 40,
          ),
          Text(
            "$temp",
            style: style_white_w400_18_circular,
          )
        ],
      ),
    );
  }
}
