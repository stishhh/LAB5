import 'package:flutter/material.dart';
import 'engineer_list_screen.dart';
import 'notification_settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedFactory = 1;
  bool _isEditing = false;

  // Create a Map to hold TextEditingController for each factory
  final Map<int, Map<String, TextEditingController>> _controllers = {
    1: {
      'steamPressure': TextEditingController(text: '0.0'),
      'steamFlow': TextEditingController(text: '0.0'),
      'waterLevel': TextEditingController(text: '0.0'),
      'powerFrequency': TextEditingController(text: '0.0'),
    },
    2: {
      'steamPressure': TextEditingController(text: '0.0'),
      'steamFlow': TextEditingController(text: '0.0'),
      'waterLevel': TextEditingController(text: '0.0'),
      'powerFrequency': TextEditingController(text: '0.0'),
    },
    3: {
      'steamPressure': TextEditingController(text: '0.0'),
      'steamFlow': TextEditingController(text: '0.0'),
      'waterLevel': TextEditingController(text: '0.0'),
      'powerFrequency': TextEditingController(text: '0.0'),
    },
    4: {
      'steamPressure': TextEditingController(text: '0.0'),
      'steamFlow': TextEditingController(text: '0.0'),
      'waterLevel': TextEditingController(text: '0.0'),
      'powerFrequency': TextEditingController(text: '0.0'),
    },
    5: {
      'steamPressure': TextEditingController(text: '0.0'),
      'steamFlow': TextEditingController(text: '0.0'),
      'waterLevel': TextEditingController(text: '0.0'),
      'powerFrequency': TextEditingController(text: '0.0'),
    },
  };

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _controllers.forEach((key, controllers) {
      controllers.forEach((key, controller) {
        controller.dispose();
      });
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory $_selectedFactory'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                SensorCard(
                  title: 'Steam Pressure',
                  unit: 'bar',
                  controller: _controllers[_selectedFactory]!['steamPressure']!,
                  isEditing: _isEditing,
                ),
                SensorCard(
                  title: 'Steam Flow',
                  unit: 'T/H',
                  controller: _controllers[_selectedFactory]!['steamFlow']!,
                  isEditing: _isEditing,
                ),
                SensorCard(
                  title: 'Water Level',
                  unit: '%',
                  controller: _controllers[_selectedFactory]!['waterLevel']!,
                  isEditing: _isEditing,
                ),
                SensorCard(
                  title: 'Power Frequency',
                  unit: 'Hz',
                  controller: _controllers[_selectedFactory]!['powerFrequency']!,
                  isEditing: _isEditing,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Assuming there are 5 factories for simplicity
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFactory = index + 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    color: _selectedFactory == index + 1
                        ? Colors.blue
                        : Colors.grey,
                    child: Text('Factory ${index + 1}'),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text('1549.7 kW'),
          Text('Timestamp: ${DateTime.now()}'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Engineers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EngineerListScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationSettingsScreen()),
            );
          }
        },
      ),
    );
  }
}

class SensorCard extends StatelessWidget {
  final String title;
  final String unit;
  final TextEditingController controller;
  final bool isEditing;

  const SensorCard({
    required this.title,
    required this.unit,
    required this.controller,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isEditing)
                  Container(
                    width: 60,
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )
                else
                  Text(
                    controller.text,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                SizedBox(width: 8),
                Text(unit, style: TextStyle(fontSize: 24)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
