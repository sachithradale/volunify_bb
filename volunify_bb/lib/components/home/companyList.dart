import 'package:flutter/material.dart';
import 'package:volunify_bb/main.dart'; // Ensure this import is necessary

class CircularItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const CircularItem({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath), // Use NetworkImage for network images
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final _orgStream = supabase.from('notes').stream(primaryKey: ['id']); // Ensure `supabase` is correctly configured

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Notes')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text('Organizations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          Expanded( // Use Expanded to ensure the ListView.builder expands to fill the available space
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _orgStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final notes = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0), // Add padding to separate items
                      child: CircularItem(
                        imagePath: note['imagePath'], // Ensure 'imagePath' exists in the map
                        label: note['label'], // Ensure 'label' exists in the map
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
