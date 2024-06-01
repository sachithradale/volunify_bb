import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'applicationView.dart';
import 'common/header.dart';

class Applications extends StatefulWidget {
  const Applications({super.key});

  @override
  State<Applications> createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customizedAppBar(title: 'Manage Applications').header(context),
      drawer: CustomizedOrganizationDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              )
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                Row(
                  //Received and approved counts
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicationFull( applicationType: 'Received',)));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text('Received', style: TextStyle(fontSize: 20, color: Colors.blue[500]),),
                              Text('10', style: TextStyle(fontSize: 20, color: Colors.blue[500]),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text('Approved', style: TextStyle(fontSize: 20, color: Colors.green[500]),),
                            Text('5', style: TextStyle(fontSize: 20, color: Colors.green[500]),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  //Rejected and pending counts
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text('Rejected', style: TextStyle(fontSize: 20, color: Colors.red[500]),),
                            Text('2', style: TextStyle(fontSize: 20, color: Colors.red[500]),),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text('Pending', style: TextStyle(fontSize: 20, color: Colors.orange[500]),),
                            Text('3', style: TextStyle(fontSize: 20, color: Colors.orange[500]),),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
