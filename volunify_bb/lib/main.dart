import 'package:flutter/material.dart';
import 'package:volunify_bb/pages/applicationView.dart';
import 'package:volunify_bb/pages/applications.dart';
import 'package:volunify_bb/pages/createEvent.dart';
import 'package:volunify_bb/pages/login.dart';
import 'package:volunify_bb/pages/register.dart';
import 'package:volunify_bb/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginPage(),
        '/login':(context)=> LoginPage(),
        '/register': (context) => Register(),
        '/home': (context) => Home(),
        '/createEvent': (context) => CreateEvent(),
        '/applications': (context) => Applications(),
      }
    );
  }
}