import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocus/presentation/screens/home/home_screen.dart';
import 'package:pocus/presentation/screens/timer/widgets/durations/duration.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  var _isInit = true;
  var _isLoading = false;
  bool isShow = false;
  var duration;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FloatingActionButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        final url = Uri.parse(
            '${dotenv.get('API_URL', fallback: '')}api/v1/pomodoro/view');
        http.get(url).then((value) {
          final extractedData =
              json.decode(value.body) as Map<dynamic, dynamic>;
          if (extractedData['duration'] == null) {
            isShow = true;
          } else {
            isShow = false;
          }
          duration = extractedData['duration'].toString();
          setState(() {
            _isLoading = false;
          });
        });
      } catch (error) {
        const errorMessage = 'Something went wrong. Please try again later.';
        _showErrorDialog(errorMessage);
      }
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return _isLoading
          ? const Center(
              child: SizedBox(),
            )
          : MaterialApp(
              title: 'Pocus',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'RedHatDisplay').copyWith(
                scaffoldBackgroundColor: const Color(0xffF8F8FF),
                cardTheme: CardTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              themeMode: ThemeMode.dark,
              home: isShow
                  ? const RootPage()
                  : MyDurations(
                      duration: duration,
                    ),
            );
    });
  }
}

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: HomeScreen());
  }
}
