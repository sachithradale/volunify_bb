import 'package:flutter/material.dart';

import 'common/header.dart';

class Programs extends StatefulWidget {
  const Programs({super.key});

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  List<Map<String,Object>> projectDetails=[
    {
      'title':'Project 1',
      'location':'Nairobi, Kenya',
      'date':'12th December 2021',
      'applicants':'24 Applicants',
    },
    {
      'title':'Project 2',
      'location':'Nairobi, Kenya',
      'date':'12th December 2021',
      'applicants':'24 Applicants',
    },
    {
      'title':'Project 3',
      'location':'Nairobi, Kenya',
      'date':'12th December 2021',
      'applicants':'24 Applicants',
    },
    {
      'title':'Project 4',
      'location':'Nairobi, Kenya',
      'date':'12th December 2021',
      'applicants':'24 Applicants',
    },
    {
      'title':'Project 5',
      'location':'Nairobi, Kenya',
      'date':'12th December 2021',
      'applicants':'24 Applicants',
    },
    {
      'title':'Project 6',
      'location':'Nairobi, Kenya',
      'date':'12th December 2021',
      'applicants':'24 Applicants',
    },
    {
      'title':'Project 7',
      'location':'Nairobi, Kenya',
      'date':'12th December 2021',
      'applicants':'24 Applicants',
    },
    {
      'title':'Project 8',
      'location':'Nairobi, Kenya',
      'date':'12th December 2021',
      'applicants':'24 Applicants',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomizedOrganizationDrawer(),
      appBar: customizedAppBar(title: 'Home').header(context),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView(
          children: projectDetails.map((project) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/placeholder.jpg',
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
                    child: Text(
                      project['title'].toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      project['date'].toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      project['location'].toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      project['applicants'].toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        )
      ),
    );
  }
}
