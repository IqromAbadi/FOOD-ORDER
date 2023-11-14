import 'package:flutter/material.dart';
import 'package:food_order/screens/homepage.dart';
import 'package:food_order/screens/splash_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _showSplash ? SplashScreen() : HomePage(),
      theme: ThemeData(primaryColor: Colors.green[900]),
    );
  }
}
