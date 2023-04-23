import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pocus/presentation/theme/styles.dart';
import 'package:pocus/presentation/theme/palette.dart';

class HomeLanguageIconCircle extends StatelessWidget {
  const HomeLanguageIconCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => showLanguageSelectionModalBottomSheet(context, _localization)
      //     .then((value) {
      //   if (value != null) {
      //     context.read<AppLanguageCubit>().changeLanguage(value);
      //   }
      // }),
      child: Container(
        height: 5.5.h,
        width: 5.5.h,
        decoration: BoxDecoration(
            color: AppPalette.whiteColor,
            border: Border.all(color: AppPalette.openGreyColor, width: 1),
            shape: BoxShape.circle),
        child: buildLangIcon(),
      ),
    );
  }

  Center buildLangIcon() {
    return Center(
        child: Icon(
      Icons.date_range,
      color: AppPalette.darkblue,
      size: 3.h,
    ));
  }
}
