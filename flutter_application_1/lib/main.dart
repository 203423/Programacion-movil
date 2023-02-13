import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/login.dart';
// import 'package:flutter_application_1/screens/body_boarding.dart';
// import 'package:flutter_application_1/screens/components/on_boarding.dart';
// import 'package:flutter_application_1/pages/view01.dart';
// import 'package:flutter_application_1/pages/register.dart';
import 'package:flutter_application_1/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
