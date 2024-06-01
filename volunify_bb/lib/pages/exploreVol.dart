import 'package:flutter/material.dart';
import 'package:volunify_bb/pages/common/dropDown.dart';

import 'common/buttons.dart';

class ExploreVol extends StatefulWidget {
  @override
  State<ExploreVol> createState() => _ExploreVolState();
}

class _ExploreVolState extends State<ExploreVol> {
  final List<String> causeAreas = [
    'Education',
    'Health',
    'Environment',
    'Poverty',
    'Gender Equality',
    'Animal Welfare',
    'Human Rights',
    'Technology',
    // Add more cause areas as needed
  ];
  final List<String> locations=[
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Chennai',
    'Kolkata',
    'Hyderabad',
    'Pune',
    'Ahmedabad',
    'Jaipur',
    'Surat',
    'Lucknow',
    'Kanpur',
    'Nagpur',
    'Patna',
    'Indore',
    'Thane',
    'Bhopal',
    'Visakhapatnam',
    'Vadodara',
    'Firozabad',
    'Ludhiana',
  ];
  final List<String> timeCommitment = [
    '1-2 hours',
    '3-4 hours',
    '5-6 hours',
    '7-8 hours',
    '9-10 hours',
  ];
  final List<String> skills=[
    'Communication',
    'Leadership',
    'Problem Solving',
    'Teamwork',
    'Creativity',
  ];

  List<String> selectedCauseAreas = [];
  String? selectedLocation;
  String? selectedTimeCommitment;
  String? selectedSkill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
            child: Text(
              'Cause Areas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: causeAreas.map((causeArea) {
                bool isSelected = selectedCauseAreas.contains(causeArea);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            if (isSelected) {
                              selectedCauseAreas.remove(causeArea);
                            } else {
                              selectedCauseAreas.add(causeArea);
                            }
                          });
                        },
                        fillColor: isSelected ? Colors.black : Colors.grey,
                        shape: CircleBorder(),
                        elevation: 2,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
            child: Text(
              'Location',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
              child: dropDown.customizeDropDown('', locations, selectedLocation!=null?selectedLocation!:locations[0], (p0) => null)),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
            child: Text(
              'Time Commitment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //time commitment as set of  boxes
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: timeCommitment.map((time) {
                bool isSelected = selectedTimeCommitment == time;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTimeCommitment = isSelected ? null : time;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: isSelected ? Colors.black : Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected ? Colors.black : Colors.transparent,
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
            child: Text(
              'Skills',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: skills.map((skill) {
                bool isSelected = selectedSkill == skill;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                        selectedSkill = isSelected ? null : skill;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: isSelected ? Colors.black : Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected ? Colors.black : Colors.transparent,
                    ),
                    child: Text(
                      skill,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          Center(child: Button.formButtton('Find', () => null, MediaQuery.of(context).size.width * 0.8)),
        ],
      )
    );
  }
}