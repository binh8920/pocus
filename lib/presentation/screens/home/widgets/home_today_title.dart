import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pocus/presentation/theme/styles.dart';
import 'package:pocus/presentation/theme/palette.dart';

class HomeTodayTitle extends StatelessWidget {
  const HomeTodayTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(
            'You have not Pocused to day',
            style: AppStyles.mainHeadlineColor17spw700Poppins,
          ),
        ),
      ],
    );
  }

  //bool get _isHabitsEmpty => _state == const TodayHabitsState.empty();

  // String get _title => _isHabitsEmpty
  //     ? _localization.homeNoTodayHabitsTitle
  //     : _localization.homeTodayHabitsTitle;
}
