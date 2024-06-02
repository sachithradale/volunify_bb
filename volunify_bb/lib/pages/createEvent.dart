import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'common/buttons.dart';
import 'common/dropDown.dart';
import 'common/fonts.dart';
import 'common/textField.dart';
import 'package:intl/intl.dart';
import 'dart:io';

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
  TextEditingController deadlineController = TextEditingController();
  TextEditingController regLinkController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController tagController = TextEditingController();


  String? _selectedLocation;
  String? _selectedAgeRestriction;
  File? _image;

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

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
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
                              SizedBox(height: 10,)
                            ]
                        ),
                      ),
                    ),
                    //page 2
                    Container(
                      child: SingleChildScrollView(
                        child:Column(
                          children:[
                            Container(
                              width:MediaQuery.of(context).size.width * 0.9,
                              child: TextFields.textField('Number of Volunteers', Icons.people, false, numberOfVolunteersController),
                            ),
                            SizedBox(height: 10,),
                            //skills
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFormField(
                                controller: selectedSkiils.length>0?TextEditingController(text: selectedSkiils.join(',')):TextEditingController(),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'Add Skills',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: (){
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Select Skills'),
                                              content: Container(
                                                width: MediaQuery.of(context).size.width * 0.8,
                                                height: MediaQuery.of(context).size.height * 0.5,
                                                child: ListView.builder(
                                                  itemCount: skills.length,
                                                  itemBuilder: (context, index) {
                                                    return CheckboxListTile(
                                                      title: Text(skills[index]),
                                                      value: selectedSkiils.contains(skills[index]),
                                                      onChanged: (bool? value) {
                                                        if(value==true){
                                                          setState(() {
                                                            selectedSkiils.add(skills[index]);
                                                          });
                                                        }else{
                                                          setState(() {
                                                            selectedSkiils.remove(skills[index]);
                                                          });
                                                        }
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              actions: <Widget>[
                                                Button.textButton('Done', () {
                                                  Navigator.of(context).pop();
                                                }, 15),
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: dropDown.customizeDropDown('Age Restrictions', ageRestrictions, _selectedAgeRestriction!=null?_selectedAgeRestriction!:ageRestrictions[0], (String? value) {
                                setState(() {
                                   _selectedAgeRestriction = value;
                                });
                              }),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFormField(
                                controller: deadlineController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Deadline',
                                  suffixIcon: Icon(Icons.calendar_today),
                                ),
                                readOnly: true,
                                onTap: () {
                                  _selectDate(context,deadlineController);
                                },
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFields.textField('Registration Link', Icons.link, false, regLinkController),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFormField(
                                maxLines: 3,
                                controller: noteController,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'Note',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
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
                        )
                      ),
                    ),
                    //page 3
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children:[
                            //upload photo and video
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ElevatedButton(
                                    onPressed: _pickImage,
                                    child: Text('Select Image'),
                                  ),
                                  SizedBox(height: 20),
                                  if (_image != null)
                                    Image.file(
                                      _image!,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextFields.textField('Add Tags', Icons.tag, false, tagController),
                            ),
                            SizedBox(height: 10,),
                            Button.formButtton('Create',
                                    () =>
                                {
                                  Navigator.pushNamed(context, '/home')
                                  //create event
                                }, MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9),
                          ]
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
