import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pocus/presentation/theme/styles.dart';
import 'package:pocus/presentation/theme/palette.dart';
import 'package:pocus/presentation/common/vertical_spacer.dart';

class DonePage extends StatelessWidget {
  const DonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.w,
                      height: 40.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/finish.png'),
                        fit: BoxFit.fitWidth,
                      )),
                    ),
                    Text(
                      "Good job. The future starts today, not tomorrow!",
                      style:
                          AppStyles.mainHeadlineColor18spw700PoppinsLineHeight,
                      textAlign: TextAlign.center,
                    ),
                    const VerticalSpacer(2),
                    Text(
                      "Stay focused, go after your dreams and keep moving toward your goals.",
                      style: AppStyles.quotesFocus,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Theme(
          data: ThemeData(
            splashColor: AppPalette.transparentColor,
            highlightColor: AppPalette.transparentColor,
          ),
          child: Container(
            height: AppStyles.deviceTablet ? 7.h : 6.h,
            width: 15.w,
            margin: EdgeInsets.only(bottom: 1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
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
                  onTap: () {
                    Navigator.of(context).popUntil(
                      (route) => route.isFirst,
                    );
                  },
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward,
                    color: AppPalette.whiteColor,
                    size: 3.h,
                  ))),
            ),
          ),
        ),
      ),
    );
  }
}
