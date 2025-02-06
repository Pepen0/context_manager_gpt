import 'package:flutter/material.dart';
import 'package:context_manager_gpt/models/directory_record.dart';

class DirectoryList extends StatelessWidget {
  final List<DirectoryRecord> directories;
  final ValueChanged<int> onDeleteIndex;

  const DirectoryList({
    Key? key,
    required this.directories,
    required this.onDeleteIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (directories.isEmpty) {
      return const Center(
        child: Text('No directories have been added yet'),
      );
    }

    return ListView.builder(
      itemCount: directories.length,
      itemBuilder: (context, index) {
        final record = directories[index];

        const maxLength = 30;
        final snippet = record.directoryTree.length > maxLength
            ? '${record.directoryTree.substring(0, maxLength)}...'
            : record.directoryTree;

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
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: const Text(
                'DIR',
                style: TextStyle(color: Colors.black),
              ),
            ),
            title: Text(record.directoryName),
            subtitle: Text(snippet),
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