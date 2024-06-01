import 'package:flutter/material.dart';
import 'package:volunify_bb/main.dart'; // Ensure this import is necessary
import 'package:supabase_flutter/supabase_flutter.dart';

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
          backgroundImage:
              AssetImage(imagePath), // Use NetworkImage for network images
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

class CompanyList extends StatefulWidget {
  const CompanyList({super.key});

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  final _orgStream = Supabase.instance.client
      .from('organization')
      .select('name')
      .asStream(); // Ensure `supabase` is correctly configured

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Use Expanded to ensure the ListView.builder expands to fill the available space
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
                padding:
                    const EdgeInsets.all(8.0), // Add padding to separate items
                child: CircularItem(
                  imagePath:
                      'assets/images/placeholder.jpg', // Ensure 'imagePath' exists in the map
                  label: note['name'], // Ensure 'label' exists in the map
                ),
              );
            },
          );
        },
      ),
    );
  }
}
