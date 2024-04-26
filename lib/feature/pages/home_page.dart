import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/theme/app_color.dart';
import 'package:weather_app/core/values/app_assets.dart';
import 'package:weather_app/core/values/app_strings.dart';
import 'package:weather_app/core/values/text_styles.dart';
import 'package:weather_app/core/values/values.dart';
import 'package:weather_app/feature/widgets/custom_button.dart';
import 'package:weather_app/feature/widgets/temp_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            gap_v20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_sharp,
                  size: size18,
                  color: whiteColor.withOpacity(0.5),
                ),
                gap_h10,
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
            SizedBox(
              height: size150,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => TempCard(
                        time: "4PM",
                        icon: cloudIcon,
                        temp: "$index°",
                      )),
            )
          ],
        ),
      ),
    );
  }
}
