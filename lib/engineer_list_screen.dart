import 'package:flutter/material.dart';
import 'invitation_screen.dart';

class EngineerListScreen extends StatefulWidget {
  @override
  _EngineerListScreenState createState() => _EngineerListScreenState();
}

class _EngineerListScreenState extends State<EngineerListScreen> {
  final List<String> _engineers = [
    'Engineer 1',
    'Engineer 2',
    'Engineer 3',
  ];

  void _addEngineer(String name) {
    setState(() {
      _engineers.add(name);
    });
  }

  void _navigateToInvitationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InvitationPage(onSubmit: _addEngineer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Engineer List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _navigateToInvitationPage,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _engineers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_engineers[index]),
          );
        },
      ),
    );
  }
}
