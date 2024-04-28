import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/theme/app_color.dart';
import 'package:weather_app/core/values/app_assets.dart';
import 'package:weather_app/core/values/app_strings.dart';
import 'package:weather_app/core/values/text_styles.dart';
import 'package:weather_app/core/values/values.dart';
import 'package:weather_app/feature/weather/presentation/widgets/custom_button.dart';
import 'package:weather_app/feature/weather/presentation/widgets/temp_card.dart';
import 'package:weather_app/feature/weather/presentation/widgets/uv_index_card.dart';
import 'package:weather_app/feature/weather/presentation/widgets/sunrise_sunset_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [primaryLightColor, primaryColor],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gap_v50,
            Text(
              "Dhaka",
              style: style_white_w700_32_inter,
            ),
            // gap_,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_sharp,
                  size: size18,
                  color: whiteColor.withOpacity(0.5),
                ),
                gap_h5,
                Text(
                  "Current Location",
                  style: style_white_w400_12_circular,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  cloudIcon,
                  width: size100,
                  height: size100,
                ),
                Text(
                  "13°",
                  style: style_white_w300_122_circular,
                )
              ],
            ),
            Text(
              "Partly Cloud  -  H:17o  L:4",
              style: style_white_w400_18_circular,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(title: today, color: whiteColor, opacity: 0.1),
                CustomButton(title: nextDays, color: blackColor, opacity: 0.1),
              ],
            ),
            Container(
              padding: symmetric_h10,
              height: size150,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => TempCard(
                  time: "4PM",
                  icon: cloudIcon,
                  temp: "$index°",
                ),
              ),
            ),
            gap_v10,
            Expanded(
              child: SizedBox(
                height: size10,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: size45,
                      width: size45,
                      decoration: BoxDecoration(
                        border: Border.all(color: whiteColor.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(size25),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            whiteColor.withOpacity(0.3),
                            whiteColor.withOpacity(0.1)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: only_t8,
                      child: ClipPath(
                        clipper: CustomArcClipper(),
                        child: LayoutBuilder(
                          builder: (context, constraints) => Container(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth,
                            padding: LTRB_30_40_30_20,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  whiteColor.withOpacity(0.4),
                                  whiteColor.withOpacity(0.2)
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SunriseSunsetCard(
                                  iconPath: sunIcon,
                                  sunSetTime: "7:00 AM",
                                  sunRiseTime: "5:51 PM",
                                ),
                                gap_v10,
                                UVIndexCard(
                                  iconPath: uvIcon,
                                  uvIndex: "1 Low",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    double radius = size30;

    final path = Path();
    path.moveTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0.2 * h);
    // path.lineTo(w / 2, 0);
    // path.lineTo(0, 200);
    path.quadraticBezierTo(3 * w / 4, 0, w / 2 + (sqrt(3) * radius / 2), 0);
    // For the middle circle
    path.arcToPoint(
      Offset(w / 2 + radius, (radius / 2)),
      radius: Radius.circular(radius),
      clockwise: true,
    );
    path.arcToPoint(
      Offset(w / 2 - radius, (radius / 2)),
      radius: Radius.circular(radius),
      clockwise: true,
    );
    path.arcToPoint(
      Offset(w / 2 - (sqrt(3) * radius / 2), 0),
      radius: Radius.circular(radius),
      clockwise: true,
    );
    path.quadraticBezierTo(w / 4, 0, 0, 0.2 * h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
