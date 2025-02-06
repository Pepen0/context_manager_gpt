import 'package:flutter/material.dart';
import '/screens/home/components/record_list.dart';
import '/screens/home/components/add_context_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:context_manager_gpt/models/file_record.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<FileRecord> _files = [];

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      final pickedFile = result.files.first;
      final name = pickedFile.name;
      final path = pickedFile.path ?? 'Unknown';
      final extension = _extensionFromName(name);

      final record = FileRecord(
        name: name,
        path: path,
        extension: extension,
      );

      setState(() {
        _files.add(record);
      });
    }
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
          Expanded(
            child: RecordList(
              files: _files,
              onDeleteIndex: (index) => _deleteFileAt(index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: AddContextButton(
              onPressed: _pickFile,
            ),
          ),
        ],
      ),
    );
  }
}