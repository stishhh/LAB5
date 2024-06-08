import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedFactory = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory $_selectedFactory Dashboard'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFactory = index + 1;
                    });
                  },
                  child: Container(
                    width: 100,
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'Factory ${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return Card(
                  child: Center(
                    child: Text('Sensor ${index + 1} Reading'),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total Power Consumption: 1549.7 kW'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Timestamp: 2024-05-30 12:34:56'),
          ),
        ],
      ),
    );
  }
}
