import 'package:flutter/material.dart';
import 'package:volunify_bb/components/home/EventDataListHorizontal.dart';
import 'package:volunify_bb/components/home/companyList.dart';
import '../components/home/EventDataList.dart';
import 'common/header.dart';

class HomeVolunteer extends StatelessWidget {
   HomeVolunteer({super.key});

  List<String> organizations = [
    'Education',
    'Health',
    'Environment',
    'Poverty',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: Colors.blueAccent,
        ),
        drawer: VolunteerAppplicantDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Featured Events',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                height: 240,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  addAutomaticKeepAlives: false,
                  children: [
                    Container(
                      width: 400,
                    ),
                    Container(width: 500, height: 250, child: const EventListHorizontal()),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Organizations',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: organizations.map((causeArea) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          RawMaterialButton(
                            fillColor: Colors.grey,
                            shape: CircleBorder(),
                            elevation: 2,
                            onPressed: () {  },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            causeArea,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Events',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                height: 240,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  addAutomaticKeepAlives: false,
                  children: [
                    Container(
                      width: 400,
                    ),
                    Container(width: 500, height: 250, child: const EventListHorizontal()),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
