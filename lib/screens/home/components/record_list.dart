import 'package:flutter/material.dart';

class RecordList extends StatelessWidget {
  final int count;
  final VoidCallback onDeleteRecord;

  const RecordList({
    Key? key,
    required this.count,
    required this.onDeleteRecord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      return const Center(
        child: Text('No records have been added yet'),
      );
    }

    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey[200],
              child: Text(
                'R$index', // e.g., initials or user’s name
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            title: Text('Person $index'),
            subtitle: Text('person$index@attio.com'),
            trailing: IconButton(
              icon: const Icon(Icons.lock, color: Colors.blue),
              onPressed: onDeleteRecord,
            ),
          ),
        );
      },
    );
  }
}