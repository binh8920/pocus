import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'widget/duration_stack.dart';

class MyDurations extends StatefulWidget {
  const MyDurations({Key? key, this.duration}) : super(key: key);
  final duration;

  @override
  State<MyDurations> createState() => _MyDurationsState();
}

class _MyDurationsState extends State<MyDurations> {
  final controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DurationTimer(
        controller: controller,
        duration: widget.duration,
      ),
    );
  }
}
