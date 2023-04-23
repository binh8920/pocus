import 'package:flutter/material.dart';
import 'package:pocus/presentation/theme/palette.dart';
import 'package:sizer/sizer.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 60.w,
        child: const Divider(
          color: AppPalette.openGreyColor,
          thickness: 1,
        ),
      ),
    );
  }
}
