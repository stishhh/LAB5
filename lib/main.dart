import 'package:flutter/material.dart';
import 'account_activation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factory Monitoring System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountActivationPage(),
    );
  }
}