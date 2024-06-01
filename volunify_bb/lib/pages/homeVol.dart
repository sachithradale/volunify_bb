import 'package:flutter/material.dart';

class HomeVolunteer extends StatelessWidget {
  const HomeVolunteer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: ListView(
          scrollDirection: Axis.vertical,
          addAutomaticKeepAlives: false,
          children: [
            Container(
              color: Colors.blue,
              width: 500,
              height: 100,
            ),
            Container(
              color: Colors.red,
              width: 500,
              height: 500,
            ),
            Container(
              color: Colors.orange,
              width: 500,
              height: 500,
            )
          ],
        ));
  }
}
