import 'package:flutter/material.dart';
import 'package:volunify_bb/pages/home.dart';
import 'package:volunify_bb/pages/login.dart';
import 'package:volunify_bb/pages/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:volunify_bb/pages/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    await Supabase.initialize(
    url: 'https://epyifmpezkyiwkcdgade.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVweWlmbXBlemt5aXdrY2RnYWRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcyMzQ3MzcsImV4cCI6MjAzMjgxMDczN30.HrrLLYmA5fmJAToL9PiqLfWZdMhfWI7smD2P4fgjVIM',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => Wrapper(),
      '/login': (context) => LoginPage(),
      '/register': (context) => Register(),
      '/volhome': (context) => Home(),
    });
  }
}
