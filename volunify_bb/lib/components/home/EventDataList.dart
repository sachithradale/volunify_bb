import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:volunify_bb/components/home/EventCardVol.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final _orgStream = Supabase.instance.client
      .from('project')
      .select('project_id,description,location')
      .asStream();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Events')),
      body: Expanded(
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

            return ListView.builder(
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
                        imageUrl: 'assets/images/placeholder.jpg',
                        title: project['description'],
                        location: project['location']),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
