import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocus/models/pmd_model.dart';
import 'package:pocus/providers/pmd_provider.dart';
import 'package:pocus/presentation/theme/styles.dart';
import 'package:pocus/presentation/screens/pomodoro_select/widgets/duration_list.dart';
import 'package:pocus/presentation/common/vertical_spacer.dart';
import 'package:pocus/presentation/screens/pomodoro_select/widgets/pmd_start_button.dart';
import 'package:pocus/presentation/screens/timer/timer_screen.dart';

class PmdSelectPage extends StatefulWidget {
  const PmdSelectPage({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final Function(ChangeNotifierProvider<PmdStateProvider>) callback;

  @override
  State<PmdSelectPage> createState() => _PmdSelectPageState();
}

class _PmdSelectPageState extends State<PmdSelectPage> {
  late PmdData _data;

  @override
  void initState() {
    super.initState();
    _data = PmdData(20, 5);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Start your Pomodoro',
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  VerticalSpacer(1),
                  DurationList(),
                  VerticalSpacer(6),
                  // Center(child: PmdStartButton('Begin')),
                  // VerticalSpacer(3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
