import 'package:flutter/material.dart';
import 'package:volunify_bb/components/home/EventDataListHorizontal.dart';
import 'package:volunify_bb/components/home/companyList.dart';
import '../components/home/EventDataList.dart';

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
              width: 500,
              height: 100,
            ),
            //Container(width: 500, height: 250, child: const EventListHorizontal()),
            Container(child: const CompanyList())
          ],
        ));
  }
}
