import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_color.dart';
import 'package:weather_app/core/values/app_strings.dart';
import 'package:weather_app/core/values/text_styles.dart';
import 'package:weather_app/core/values/values.dart';

class UVIndexCard extends StatelessWidget {
  final String iconPath;
  final String uvIndex;
  const UVIndexCard({
    super.key,
    required this.iconPath,
    required this.uvIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: symmetric_h10_v10,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: whiteColor.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(size12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [whiteColor.withOpacity(0.3), whiteColor.withOpacity(0.1)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            iconPath,
            width: size40,
            height: size40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                uvIndexTitle,
                style: style_white_w400_12_circular,
              ),
              Text(
                uvIndex,
                style: style_white_w400_18_circular,
              ),
            ],
          ),
          gap_h40,
        ],
      ),
    );
  }
}
