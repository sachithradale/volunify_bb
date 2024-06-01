import 'package:flutter/material.dart';
import 'common/header.dart';

class ApplicationFull extends StatefulWidget {
  const ApplicationFull({super.key, required this.applicationType});
  final String applicationType;

  @override
  State<ApplicationFull> createState() => _ApplicationFullState();
}

class _ApplicationFullState extends State<ApplicationFull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customizedAppBar(title: 'Manage Applications').header(context),
      drawer: CustomizedOrganizationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.9,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                  //search bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value){
                      },
                      decoration: InputDecoration(
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
                    ),
                  ),
                  SizedBox(height: 20,),
                  //Application type
                  ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        title: Text(
                            widget.applicationType,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                      ),
                    ],
                  ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/placeholder.jpg'), // Replace 'path_to_profile_photo' with the actual path
                      ),
                      title: Text('Application 1'),
                      subtitle: Text('Hours: 10'), // Display hours here
                      onTap: () {
                        // Handle onTap action
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/placeholder.jpg'), // Replace 'assets/images/profile_photo.jpg' with the actual path
                      ),
                      title: Text('Application 2'),
                      subtitle: Text('Hours: 8'), // Display hours here
                      onTap: () {
                        // Handle onTap action
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/placeholder.jpg'), // Replace 'path_to_profile_photo' with the actual path
                      ),
                      title: Text('Application 3'),
                      subtitle: Text('Hours: 12'), // Display hours here
                      onTap: () {
                        // Handle onTap action
                      },
                    ),
                  ],
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
