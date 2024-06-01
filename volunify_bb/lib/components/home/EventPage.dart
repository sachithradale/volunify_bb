import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Page'),
      ),
      body: Expanded(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            // Cover Image
            Image.asset(
              'assets/images/placeholder.jpg',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            // Date
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey),
                SizedBox(width: 8.0),
                Text(
                  '12th December 2021',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            // Location
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 8.0),
                Text(
                  'Nairobi, Kenya',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.people, color: Colors.grey),
                SizedBox(width: 8.0),
                Text(
                  '24 Applicants',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Apply Now Button
            ElevatedButton(
              onPressed: () {
                // Handle apply action
              },
              child: Text('Apply Now'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            // Contact Details
            Row(
              children: [
                Icon(Icons.phone, color: Colors.grey),
                SizedBox(width: 8.0),
                Text(
                  '+123 456 7890',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.email, color: Colors.grey),
                SizedBox(width: 8.0),
                Text(
                  'contact@event.com',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Event Description
            Text(
              'Event Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Join us for a day of exciting wildlife projects aimed at conserving our precious natural habitats. '
              'This event is perfect for nature enthusiasts and those looking to make a positive impact on the environment. '
              'Activities will include habitat restoration, wildlife monitoring, and educational workshops. '
              'All participants will receive a certificate of participation. Don\'t miss out on this opportunity to contribute to conservation efforts!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
