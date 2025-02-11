import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '/screens/home/components/record_list.dart';
import '/screens/home/components/directory_list.dart';

import '/screens/home/components/add_context_button.dart';
import '/screens/home/components/add_directory_button.dart';

import 'package:context_manager_gpt/models/file_record.dart';
import 'package:context_manager_gpt/models/directory_record.dart';

String _buildDirectoryTree(String rootPath) {
  final buffer = StringBuffer();

  void traverse(Directory dir, int depth) {
    // Indent sub-folders with spaces based on depth
    final prefix = '  ' * depth;

    // List everything in this directory
    for (var entity in dir.listSync()) {
      final name = entity.path.split('/').last; 
      
      // Write this entity's name
      buffer.writeln('$prefix- $name');

      // If it's a sub-directory, recurse
      if (entity is Directory) {
        traverse(entity, depth + 1);
      }
    }
  }

  final rootDir = Directory(rootPath);
  buffer.writeln('Directory tree for: $rootPath');
  traverse(rootDir, 0);

  return buffer.toString();
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<FileRecord> _files = [];
  final List<DirectoryRecord> _directories = [];

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      final pickedFile = result.files.first;

      final name = pickedFile.name;            
      final extension = _extensionFromName(name); 

      String content = '';
      if (pickedFile.bytes != null) {
        try {
          content = String.fromCharCodes(pickedFile.bytes!);
        } catch (e) {
          content = 'Error reading file as text: $e';
        }
      } else {
        content = 'No file content available.';
      }

      final record = FileRecord(
        name: name,
        extension: extension,
        content: content,
      );

      setState(() {
        _files.add(record);
      });
    }
  }

  Future<void> _pickDirectory() async {
    final selectedDirectory = await FilePicker.platform.getDirectoryPath();
    
    if (selectedDirectory == null) return;

    final dirName = selectedDirectory.split('/').last;

    final treeString = _buildDirectoryTree(selectedDirectory);

    final record = DirectoryRecord(
      directoryName: dirName,
      directoryTree: treeString,
    );

    setState(() {
      _directories.add(record);
    });
  }

  String _extensionFromName(String fileName) {
    final dotIndex = fileName.lastIndexOf('.');
    if (dotIndex == -1) return '';
    return fileName.substring(dotIndex);
  }

  void _deleteFileAt(int index) {
    setState(() {
      _files.removeAt(index);
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[200],
    body: Column(
      children: [
        // 1) Title for file picking
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                'Related Records',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),

        // 2) The File List
        Expanded(
          flex: 1,
          child: RecordList(
            files: _files,
            onDeleteIndex: _deleteFileAt, // existing code
          ),
        ),

        // 3) A row with one button: Add File
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AddContextButton(onPressed: _pickFile),
            ],
          ),
        ),

        // 4) Title for directories
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                'Selected Directories',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),

        // 5) The Directory List
        Expanded(
          flex: 1,
          child: DirectoryList(
            directories: _directories,
            onDeleteIndex: (index) {
              setState(() {
                _directories.removeAt(index);
              });
            },
          ),
        ),

        // 6) Add Directory button
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AddDirectoryButton(
              onPressed: _pickDirectory, // same callback as before
            ),
        ),
      ],
    ),
  );
}
}