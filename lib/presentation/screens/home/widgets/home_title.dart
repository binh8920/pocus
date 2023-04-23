import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pocus/presentation/theme/styles.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Time is running, let POCUS now!',
        style: AppStyles.mainHeadlineColor18spw700PoppinsLineHeight);
  }
}
