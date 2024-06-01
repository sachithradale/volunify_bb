import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'common/buttons.dart';
import 'common/dropDown.dart';
import 'common/fonts.dart';
import 'common/textField.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int _currentPage = 0;
  final int _numPages =3;

  final PageController _pageController = PageController();
  TextEditingController eventController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController numberOfVolunteersController = TextEditingController();


  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController requirementsController = TextEditingController();
  TextEditingController responsibilitiesController = TextEditingController();
  TextEditingController aboutCompanyController = TextEditingController();
  TextEditingController newLocationController = TextEditingController();


  String? _selectedLocation;
  String? _selectedCategory;
  String? _selectedJobType;
  String? _selectedWorkplace;

  List<String> locations = ['Location 1', 'Location 2', 'Location 3'];
  List<String> skills = ['Skill 1', 'Skill 2', 'Skill 3'];
  List<String> ageRestrictions = ['18-25', '25-30', '30-35'];
  List<String> selectedSkiils =[];

  Future<void> _selectDate(BuildContext context,_dateController) async {
    //selectedDate
    DateTime? _selectedDate;
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Create Event',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
              )
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _numPages,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.blue
                            : Colors.grey, // Change the colors as needed
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    // page 1
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                  child: TextFields.textField('Event Name', Icons.event, false, eventController)),
                              SizedBox(height: 10,),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: dropDown.customizeDropDown('Cause Ares', locations, _selectedLocation!=null?_selectedLocation!:locations[0], (String? value) {
                                  setState(() {
                                    _selectedLocation = value;
                                  });
                                }),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: TextFormField(
                                  maxLines: 5,
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Description',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    child: TextFormField(
                                      controller: startDateController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        labelText: 'Start Date',
                                        suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                      readOnly: true,
                                      onTap: () {
                                        _selectDate(context,startDateController);
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    child: TextFormField(
                                      controller: endDateController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        labelText: 'End Date',
                                        suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                      readOnly: true,
                                      onTap: () {
                                        _selectDate(context,endDateController);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  child: TextFields.textField('Location', Icons.location_on_outlined, false, locationController)),
                              SizedBox(height: 10,),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  child: TextFields.textField('Phone Number', Icons.phone, false, phoneController)),
                              SizedBox(height: 10,),
                              Button.formButtton('Next',
                                      () =>
                                  {
                                    _pageController.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease)
                                  }, MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.9),
                            ]
                        ),
                      ),
                    ),
                    //page 2
                   
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AppFonts.title('Details', Colors.black),
                            SizedBox(height: 20),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppFonts.customizeText(
                                      'Job Description', Colors.black, 18,
                                      FontWeight.bold),
                                  TextFormField(
                                    maxLines: 3,
                                    controller: jobDescriptionController,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      hintText: 'Developed software for Google',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  AppFonts.customizeText(
                                      'Requirements', Colors.black, 18,
                                      FontWeight.bold),
                                  TextFormField(
                                    maxLines: 3,
                                    controller: requirementsController,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      hintText: 'Developed software for Google',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  AppFonts.customizeText(
                                      'Responsibilities', Colors.black, 18,
                                      FontWeight.bold),
                                  TextFormField(
                                    maxLines: 3,
                                    controller: responsibilitiesController,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      hintText: 'Developed software for Google',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  AppFonts.customizeText(
                                      'About Company', Colors.black, 18,
                                      FontWeight.bold),
                                  TextFormField(
                                    maxLines: 3,
                                    controller: aboutCompanyController,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      hintText: 'Developed software for Google',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Button.formButtton('Post Job',
                                          () =>
                                      {
                                      }
                                      , MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.8),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //age restrictions drop down

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
