import 'package:flutter/material.dart';
import 'package:volunify_bb/pages/applicationView.dart';
import 'package:volunify_bb/pages/applications.dart';
import 'package:volunify_bb/pages/createEvent.dart';
import 'package:volunify_bb/components/home/EventDataList.dart';
import 'package:volunify_bb/components/home/EventPage.dart';
import 'package:volunify_bb/pages/exploreVol.dart';
import 'package:volunify_bb/pages/homeVol.dart';
import 'package:volunify_bb/pages/login.dart';
import 'package:volunify_bb/pages/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:volunify_bb/pages/home.dart';
import 'package:volunify_bb/pages/wrapper.dart';




void main() async {

  await Supabase.initialize(
    url: 'https://auslmepkwawokgoycsjx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF1c2xtZXBrd2F3b2tnb3ljc2p4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcyODAzNjAsImV4cCI6MjAzMjg1NjM2MH0.7Okimzclb6eLvZvOUfKZA_MlV0D_OI5pRw5kJjZDeYU',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (context) => ExploreVol(),
        '/login':(context)=> LoginPage(),
        '/register': (context) => Register(),
        '/home': (context) => Home(),
        '/homeVol': (context) => HomeVolunteer(),
        '/createEvent': (context) => CreateEvent(),
        '/applications': (context) => Applications(),
        '/exploreVol': (context) => ExploreVol(),
         '/EventPage': (context) => EventPage(),
    });
  }
}
