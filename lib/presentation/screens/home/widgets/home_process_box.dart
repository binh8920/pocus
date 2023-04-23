import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pocus/presentation/theme/styles.dart';
import 'package:pocus/presentation/theme/palette.dart';

class HomeProgressBox extends StatelessWidget {
  //const HomeProgressBox({Key? key}) : super(key: key);
  List<String> days = ["We", "Th", "Fr", "Sa", "Su"];

  static String dateTimetoHumanReadable(DateTime dt) {
    String dateSlug =
        "${dt.year.toString()}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}";
    return dateSlug;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.horizontalVerticalPadding(3.w, 2.h),
      decoration: BoxDecoration(
          color: AppPalette.orange, borderRadius: BorderRadius.circular(35)),
      child: Container(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today: ${dateTimetoHumanReadable(DateTime.now())}",
                  style: AppStyles.whiteColor12spw600MontserratLineHeight,
                ),
                Text(
                  "Keep Your Pocus Streak",
                  style: AppStyles.whiteColor12spw600MontserratLineHeight,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              color: AppPalette.whiteColor,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: days
                  .map(
                    (e) => Expanded(
                      child: Center(
                        child: Text(
                          e,
                          style: AppStyles.white54Color10spw600NotoSans,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  //bool get _isHabitsEmpty => _state == const TodayHabitsState.empty();
}
