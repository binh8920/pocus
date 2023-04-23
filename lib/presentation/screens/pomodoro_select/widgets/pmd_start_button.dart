import 'package:flutter/material.dart';
import 'package:pocus/presentation/screens/pomodoro/pomodoro_screen.dart';
import 'package:pocus/presentation/screens/pomodoro_select/pomodoro_select_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:pocus/presentation/theme/styles.dart';
import 'package:pocus/presentation/theme/palette.dart';

class PmdStartButton extends StatelessWidget {
  final String title;
  const PmdStartButton(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: AppPalette.transparentColor,
        highlightColor: AppPalette.transparentColor,
      ),
      child: Container(
        height: AppStyles.deviceTablet ? 10.h : 8.h,
        width: 50.w,
        margin: EdgeInsets.only(bottom: 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppPalette.orange,
          boxShadow: [
            BoxShadow(
              color: AppPalette.orange.withOpacity(0.55),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: AppPalette.transparentColor,
          child: InkWell(
              onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PmdSelectPage(
                          callback: (p) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PomodoroScreen(
                                  pmdStateChangeNotifier: p,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  },
              child: Center(
                  child: Text(
                title,
                style: AppStyles.whiteColor14spw700NotoSans,
                textAlign: TextAlign.center,
              ))),
        ),
      ),
    );
  }
}
