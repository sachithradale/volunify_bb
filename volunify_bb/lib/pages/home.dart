import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/home/EventDataListHorizontal.dart';
import 'common/fonts.dart';
import 'common/header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      drawer: CustomizedOrganizationDrawer(),
      appBar: customizedAppBar(title: 'Home').header(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createEvent');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value){
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            searchController.clear();
                          });
                        },
                        child: Icon(Icons.remove)
                    ),
                    prefixIcon: Icon(Icons.search),
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
                )
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_frames_outlined, size: 30,
                                color: Colors.blueAccent,
                              ),
                              Text('12'),
                              Text('Projects'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.person, size: 30,
                              color: Colors.amber,),
                              Text('2'),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Volunteers'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.monetization_on_outlined, size: 30,
                              color: Colors.green,),
                              Text('5'),
                              Text('Donations'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: AppFonts.subtitle('Next Event', Colors.black),
                  ),
                  //horizontal list view with images
                  Container(
                    height: MediaQuery.of(context).size.width * 0.6,
                    child: EventListHorizontal(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: AppFonts.subtitle('Organizations', Colors.black),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              RawMaterialButton(
                                onPressed: () {},
                                fillColor: Colors.grey,
                                shape: CircleBorder(),
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Organization 1', style: TextStyle(color: Colors.black),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              RawMaterialButton(
                                onPressed: () {},
                                fillColor: Colors.grey,
                                shape: CircleBorder(),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Organization 2', style: TextStyle(color: Colors.black),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              RawMaterialButton(
                                onPressed: () {},
                                fillColor: Colors.grey,
                                shape: CircleBorder(),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Organization 3', style: TextStyle(color: Colors.black),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              RawMaterialButton(
                                onPressed: () {},
                                fillColor: Colors.grey,
                                shape: CircleBorder(),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Organization 4', style: TextStyle(color: Colors.black),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final int daysLeft;

  const EventCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.daysLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.3,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              '$daysLeft days left',
              style: TextStyle(
                fontSize: 14,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

