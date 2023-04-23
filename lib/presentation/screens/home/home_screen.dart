import 'package:flutter/material.dart';
import 'package:pocus/presentation/screens/home/widgets/home_today_title.dart';
import 'package:sizer/sizer.dart';
import 'package:pocus/presentation/screens/home/widgets/home_header.dart';
import 'package:pocus/presentation/screens/home/widgets/home_title.dart';
import 'package:pocus/presentation/screens/home/widgets/home_process_box.dart';
import 'package:pocus/presentation/screens/home/widgets/home_button.dart';
import 'package:pocus/presentation/screens/home/widgets/home_today_pmd.dart';
import 'package:pocus/presentation/common/vertical_spacer.dart';
import 'package:pocus/presentation/common/vertical_divider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> days = ["We", "Th", "Fr", "Sa", "Su"];

  static String dateTimetoHumanReadable(DateTime dt) {
    String dateSlug =
        "${dt.year.toString()}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}";
    return dateSlug;
  }

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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const VerticalSpacer(1),
                  HomeHeader(),
                  const VerticalSpacer(1),
                  CustomDivider(),
                  HomeTitle(),
                  const VerticalSpacer(3),
                  HomeProgressBox(),
                  const VerticalSpacer(3),
                  CustomDivider(),
                  //HomeTodayTitle(),
                  HomeTodayPmd()
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: HomeFloatingButton('Start a Pomodoro'),
      ),
    );
  }
}
