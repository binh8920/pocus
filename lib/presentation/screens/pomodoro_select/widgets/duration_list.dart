import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pocus/data/duration_data.dart';
import 'package:pocus/presentation/theme/styles.dart';
import 'package:pocus/presentation/screens/timer/timer_screen.dart';

class DurationList extends StatelessWidget {
  const DurationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: duration.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 7, crossAxisCount: 1, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TimerScreen(duration[index].timer),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(duration[index].backImage),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          duration[index].text,
                          style:
                              AppStyles.whiteColor12spw600MontserratLineHeight,
                        ),
                        Text(
                          duration[index].lessons,
                          style: AppStyles.white54Color10spw600NotoSans,
                        ),
                        CircularPercentIndicator(
                          radius: 9.w,
                          lineWidth: 8,
                          animation: true,
                          animationDuration: 1500,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: duration[index].percent / 100,
                          progressColor: Colors.white,
                          center: Text("${duration[index].percent}%",
                              style: AppStyles.whiteColor11spw600Montserrat),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          duration[index].imageUrl,
                          height: 12.h,
                          width: 30.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
