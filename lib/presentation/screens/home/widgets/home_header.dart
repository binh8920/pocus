import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocus/presentation/theme/styles.dart';
import 'package:pocus/presentation/screens/home/widgets/home_circle_icon.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat('EEEE, MMMM dd').format(DateTime.now()),
                  style: AppStyles.secondaryGreyColor12spw700Poppins),
            ],
          ),
        ),
        HomeLanguageIconCircle()
      ],
    );
  }
}
