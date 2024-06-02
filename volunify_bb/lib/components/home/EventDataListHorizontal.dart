import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:volunify_bb/components/home/EventCardVol.dart';

class EventListHorizontal extends StatefulWidget {
  const EventListHorizontal({Key? key}) : super(key: key);

  @override
  State<EventListHorizontal> createState() => _EventListHorizontalState();
}

class _EventListHorizontalState extends State<EventListHorizontal> {
  final _orgStream = Supabase.instance.client
      .from('project')
      .select('project_id,description,location')
      .asStream();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _orgStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          final data = snapshot.data!;

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/EventPage');
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final project = data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[200],
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: EventCardVol(
                        imageUrl: index % 2 == 0
                            ? 'assets/images/one.png'
                            : 'assets/images/two.png',
                        title: project['description'],
                        location: project['location']),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
