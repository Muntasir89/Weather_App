import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_color.dart';
import 'package:weather_app/core/values/text_styles.dart';
import 'package:weather_app/core/values/values.dart';

class CustomButton extends StatelessWidget {
  final title;
  final opacity;
  final color;
  CustomButton({
    super.key,
    required this.title,
    required this.color,
    required this.opacity,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        padding: symmetric_h30_v10,

        decoration: BoxDecoration(
          color: color.withOpacity(opacity),
          borderRadius: BorderRadius.circular(size20),
        ),
        child: Text(
          title,
          style: style_white_w700_14_inter,
        ),
      ),
    );
  }
}
