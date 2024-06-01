import 'package:flutter/material.dart';
import 'package:volunify_bb/pages/createEvent.dart';
import 'package:volunify_bb/pages/login.dart';
import 'package:volunify_bb/pages/register.dart';
import 'package:volunify_bb/pages/home.dart';
import 'package:volunify_bb/pages/common/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          primarySwatch: Colors.blue,
          // Define the default font family.
          fontFamily: 'Montserrat',
        ),
      routes: {
        '/': (context) => BackgroundImage(child: LoginPage()),
        '/login': (context) => BackgroundImage(child: LoginPage()),
        '/register': (context) => BackgroundImage(child: Register()),
        '/home': (context) => BackgroundImage(child: Home()),
        '/createEvent': (context) => BackgroundImage(child: CreateEvent()),
      }
    );
  }
}