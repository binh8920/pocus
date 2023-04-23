import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VerticalSpacer extends StatelessWidget {
  final double size;
  const VerticalSpacer(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.h,
    );
  }
}
