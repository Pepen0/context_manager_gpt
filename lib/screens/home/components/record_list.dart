import 'package:flutter/material.dart';
import 'package:context_manager_gpt/models/file_record.dart';

class RecordList extends StatelessWidget {
  final List<FileRecord> files;
  final ValueChanged<int> onDeleteIndex;
  
  const RecordList({
    Key? key,
    required this.files,
    required this.onDeleteIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) {
      return const Center(
        child: Text('No records have been added yet'),
      );
    }

    return ListView.builder(
      itemCount: files.length,
      itemBuilder: (context, index) {
        final record = files[index];

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            // 1) Circular avatar for file extension
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Text(
                record.extension, 
                style: const TextStyle(color: Colors.black),
              ),
            ),

            // 2) Title & subtitle
            title: Text(record.name),
            subtitle: Text(record.path),
            
            // 3) Delete button
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.blue),
              onPressed: () => onDeleteIndex(index),
            ),
          ),
        );
      },
    );
  }
}