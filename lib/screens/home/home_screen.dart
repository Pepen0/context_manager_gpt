import 'package:flutter/material.dart';
import '/screens/home/components/record_list.dart';
import '/screens/home/components/add_context_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _addRecord() {
    setState(() {
      _counter++;
    });
  }

  void _removeRecord() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Uploaded records',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: RecordList(
              count: _counter,
              onDeleteRecord: _removeRecord,
            ),
          ),
          const SizedBox(height: 8),
          AddContextButton(
            onPressed: _addRecord,
          ),
        ],
      ),
    );
  }
}