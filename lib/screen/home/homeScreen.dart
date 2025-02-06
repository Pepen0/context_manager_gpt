import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  Widget _buildRecordItem(int index) {
    if (_counter == 0) {
      return const ListTile(
        title: Text('No records have been added yet'),
      );
    }
    return ListTile(
      title: Text('Record $index'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _counter--;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 8), // Some spacing below the AppBar
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
            child: _counter == 0
            ? const Center(
              child: Text('No records have been added yet')
              )
            :ListView.builder(
              itemCount: _counter,
              itemBuilder: (_, index) => _buildRecordItem(index),
            ),
          ),
          const SizedBox(height: 8), // Optional spacing at the bottom
        ],
      ),
    );
  }
}