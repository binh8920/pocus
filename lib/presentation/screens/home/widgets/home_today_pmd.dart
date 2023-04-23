import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pocus/providers/history_provider.dart';
import 'package:pocus/models/history_model.dart';
import 'package:pocus/presentation/theme/styles.dart';
import 'package:pocus/presentation/theme/palette.dart';
import 'package:pocus/presentation/screens/home/widgets/home_history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTodayPmd extends StatefulWidget {
  const HomeTodayPmd({Key? key}) : super(key: key);

  @override
  _HomeTodayPmdState createState() => _HomeTodayPmdState();
}

class _HomeTodayPmdState extends State<HomeTodayPmd> {
  HistoryController historyController = HistoryController();
  final List<History> listHistory = [];
  final List<String> list = [];
  bool isPocused = false;

  @override
  void initState() {
    super.initState();
    HistoryController.init();
    listHistory.addAll(historyController.read("history"));
    if (listHistory.isNotEmpty) {
      isPocused = true;
    }
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      list.addAll(prefs.getStringList('history')!);
      for (var item in list) {
        listHistory.add(History.fromJson(json.decode(item)));
      }
      if (listHistory.isNotEmpty) {
        isPocused = true;
      }
      print(listHistory.isEmpty);
      print(listHistory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isPocused
        ? Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(
                    'Amazing! You are doing great',
                    style: AppStyles.mainHeadlineColor17spw700Poppins,
                  ),
                ),
              ],
            ),
            HomeHistory()
          ])
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      'You have not Pocused to day',
                      style: AppStyles.mainHeadlineColor17spw700Poppins,
                    ),
                  ),
                ],
              ),
              Container(
                width: 100.w,
                height: 40.h,
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/sloth.png'),
                  fit: BoxFit.fitWidth,
                )),
              ),
            ],
          );
  }
}
