import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocus/providers/history_provider.dart';
import 'package:pocus/models/history_model.dart';
import 'package:pocus/presentation/theme/colors.dart';
import 'package:pocus/presentation/screens/home/widgets/history_item.dart';

class HomeHistory extends StatefulWidget {
  const HomeHistory({Key? key}) : super(key: key);

  @override
  _HomeHistoryState createState() => _HomeHistoryState();
}

class _HomeHistoryState extends State<HomeHistory> {
  HistoryController historyController = HistoryController();
  List<History> listHistory = [];

  @override
  void initState() {
    super.initState();
    HistoryController.init();
    listHistory.addAll(historyController.read("history"));
    listHistory.sort((a, b) {
      return b.dateTime.compareTo(a.dateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = listHistory.elementAt(index);
        if (index != 0 &&
            (item.dateTime.day ==
                listHistory.elementAt(index - 1).dateTime.day) &&
            (item.dateTime.month ==
                listHistory.elementAt(index - 1).dateTime.month) &&
            (item.dateTime.year ==
                listHistory.elementAt(index - 1).dateTime.year)) {
          return HistoryItem(
            history: item,
            isNewDay: false,
          );
        } else {
          return HistoryItem(
            history: item,
            isNewDay: true,
          );
        }
      },
      itemCount: listHistory.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 0,
        color: Colors.transparent,
      ),
    );
  }
}
