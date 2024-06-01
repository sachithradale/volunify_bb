import 'package:flutter/material.dart';
import 'package:volunify_bb/components/home/EventDataList.dart';
import 'package:volunify_bb/components/home/EventPage.dart';
import 'package:volunify_bb/pages/homeVol.dart';
import 'package:volunify_bb/pages/login.dart';
import 'package:volunify_bb/pages/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:volunify_bb/pages/createEvent.dart';
import 'package:volunify_bb/pages/home.dart';
import 'package:volunify_bb/pages/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MaterialApp(routes: {
      '/': (context) => const Wrapper(),
      '/login': (context) => LoginPage(),
      '/register': (context) => Register(),
      '/volhome': (context) => HomeVolunteer(),
      '/home': (context) => Home(),
      '/createEvent': (context) => CreateEvent(),
      '/EventPage': (context) => EventPage(),
    });
  }
}
