import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Center(
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
                              Icon(Icons.filter_frames_outlined, size: 30,),
                              Text('125'),
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
                              Icon(Icons.person, size: 30,),
                              Text('125'),
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
                              Icon(Icons.monetization_on_outlined, size: 30,),
                              Text('125'),
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index){
                        return Card(
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(''
                                  'assets/images/placeholder.jpg',
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.width * 0.3,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
                                child: Text(
                                    'Wildlife projects',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                    '12th December 2021',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey
                                    )
                                ),
                              ),
                              //no of days left
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                    '12 days left',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.red
                                    )
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
