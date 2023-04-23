import 'dart:async';

import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocus/providers/history_provider.dart';
import 'package:pocus/models/history_model.dart';
//import 'package:focustimer/screens/history_screen.dart';
//import 'package:pocus/presentation/theme/colors.dart';
import 'package:pocus/presentation/theme/styles.dart';
import 'package:pocus/presentation/theme/palette.dart';
import 'package:pocus/presentation/screens/finish/finish_screen.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TimerScreen extends StatefulWidget {
  final double timer;
  const TimerScreen(this.timer, {Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late double defaultValue = widget.timer;
  late double value = widget.timer;
  bool isStarted = false;
  int focusedMins = 0;

  List<History> listHistory = [];

  Timer? _timer;

  HistoryController historyController = HistoryController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppPalette.orange));
    HistoryController.init();
    print(historyController.read("history"));
  }

  void startTimer() {
    focusedMins = value.toInt();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (value <= 1) {
          setState(() {
            timer.cancel();
            value = defaultValue;
            isStarted = false;
            listHistory = historyController.read("history");
            listHistory.add(
                History(dateTime: DateTime.now(), focusedSecs: focusedMins));
            historyController.save("history", listHistory);
            print(historyController.read("history"));
          });
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DonePage(),
            ),
          );
        } else {
          setState(() {
            value--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s Pocus!',
              style: AppStyles.secondaryGreyColor12spw700Poppins),
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: 250,
                        height: 250,
                        child: Stack(
                          children: [
                            SleekCircularSlider(
                              initialValue: value,
                              min: 0,
                              max: 7200,
                              appearance: CircularSliderAppearance(
                                customWidths: CustomSliderWidths(
                                  trackWidth: 15,
                                  handlerSize: 20,
                                  progressBarWidth: 15,
                                  shadowWidth: 0,
                                ),
                                customColors: CustomSliderColors(
                                  trackColor: Colors.blueGrey,
                                  progressBarColor: AppPalette.orange,
                                  hideShadow: true,
                                  dotColor: AppPalette.orange,
                                ),
                                size: 250,
                                angleRange: 360,
                                startAngle: 270,
                              ),
                              onChange: (newValue) {
                                setState(() {
                                  value = newValue;
                                  print(value);
                                });
                                if (value == 0) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DonePage(),
                                    ),
                                  );
                                }
                              },
                              innerWidget: (double newValue) {
                                return Center(
                                  child: Text(
                                    "${(value ~/ 60).toInt().toString().padLeft(2, '0')}:${(value % 60).toInt().toString().padLeft(2, '0')}",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 46,
                                    ),
                                  ),
                                );
                              },
                            ),
                            if (isStarted)
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 250,
                                  height: 250,
                                  color: Colors.transparent,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Theme(
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
                              onTap: () {
                                setState(() {
                                  if (!isStarted) {
                                    isStarted = true;
                                    startTimer();
                                  } else {
                                    _timer?.cancel();
                                    value = defaultValue;
                                    isStarted = false;
                                  }
                                });
                              },
                              child: Center(
                                  child: Text(
                                isStarted ? "STOP" : "START",
                                style: AppStyles.whiteColor14spw700NotoSans,
                                textAlign: TextAlign.center,
                              ))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
