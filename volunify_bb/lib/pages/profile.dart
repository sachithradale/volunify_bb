import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  bool switch_value1 = false;
  bool switch_value2 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Avatar and Name
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/placeholder.jpg'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Pasindu',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(
                          'Your Location',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'pasindu@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                  ],
                ),
              ),
              // Event Count, Followers, Following
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildInfoBlock('Events', '10'),
                  _buildInfoBlock('Followers', '100'),
                  _buildInfoBlock('Following', '50'),
                ],
              ),
              SizedBox(height: 20),
              // Switches
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Available'),
                      Switch(
                        value: true,
                        onChanged: (value) {
                          switch_value1 = value;
                        },
                        activeColor: Colors.grey,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Notifications'),
                      Switch(
                        value: true,
                        onChanged: (value) {
                          switch_value2 = value;
                        },
                        activeColor: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Additional Text Blocks
              _buildTextBlock('Impact Statistics'),
              _buildTextBlock('Certifications'),
              _buildTextBlock('Feedbacks'),
              SizedBox(height: 20),
              // Logout Button
              ElevatedButton(
                onPressed: () {
                  // Add logout functionality here
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBlock(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildTextBlock(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

void main() {
  runApp(ProfilePage());
}
