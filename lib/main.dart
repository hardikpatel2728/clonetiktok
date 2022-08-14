import 'package:clonetiktok/constants.dart';
import 'package:clonetiktok/view/screens/auth/Signup_Screen.dart';
import 'package:clonetiktok/view/screens/auth/login_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Person Vidz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      home:SignupScreen(),
    );
  }
}

