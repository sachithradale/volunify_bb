import 'package:flutter/material.dart';
import 'fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class customizedAppBar{
  customizedAppBar({required this.title});
  String title;
  AppBar header(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: AppFonts.subtitle(
          title,
          Colors.white,
      ),
    );
  }
}

class CustomizedOrganizationDrawer extends StatelessWidget {
  var token;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/placeholder.jpg'),
                  radius: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Pasindu',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            //Profile Picture and Name


          ),
          ListTile(
            title: AppFonts.normal('Home', Colors.black),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: AppFonts.normal('Applications', Colors.black),
            onTap: () {
               Navigator.pushNamed(context, '/applications');
            },
          ),
          ListTile(
            title: AppFonts.normal('Program', Colors.black),
            onTap: () {
              Navigator.pushNamed(context, '/program');
            },
          ),
          ListTile(
            title: AppFonts.normal('Volunteers', Colors.black),
            onTap: () {
              Navigator.pushNamed(context, '/volunteers');
            },
          ),
          ListTile(
            title: AppFonts.normal('Notifications', Colors.black),
            onTap: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          ListTile(
            title: AppFonts.normal('Chats', Colors.black),
            onTap: () {
              Navigator.pushNamed(context, '/chats');
            },
          ),
          ListTile(
            title: AppFonts.normal('Logout', Colors.red),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            }
          ),
          //
        ],
      ),
    );
  }
}

class VolunteerAppplicantDrawer extends StatelessWidget {
  var token;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              '',
              style: TextStyle(
                fontFamily: 'poppins',
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: AppFonts.normal('Home', Colors.black),
            onTap: () {
              Navigator.pushNamed(context, '/homeVol');
            },
          ),
          ListTile(
            title: AppFonts.normal('Applications', Colors.black),
            onTap: () {
              Navigator.pushNamed(context, '/applicationsVol');
            },
          ),
          ListTile(
            title: AppFonts.normal('Events', Colors.black),
            onTap: () {
               Navigator.pushNamed(context, '/events');
            },
          ),
          ListTile(
            title: AppFonts.normal('Notifications', Colors.black),
            onTap: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          ListTile(
            title: AppFonts.normal('Chats', Colors.black),
            onTap: () {
              Navigator.pushNamed(context, '/chats');
            },
          ),
          ListTile(
            title: AppFonts.normal('Logout', Colors.red),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            }
          )
          //
        ],
      ),
    );
  }
}
