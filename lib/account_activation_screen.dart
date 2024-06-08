import 'package:flutter/material.dart';
import 'otp_screen.dart';

class AccountActivationPage extends StatefulWidget {
  @override
  _AccountActivationPageState createState() => _AccountActivationPageState();
}

class _AccountActivationPageState extends State<AccountActivationPage> {
  final TextEditingController _phoneController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _getActivationCode() {
    if (_agreeToTerms) {
      // Simulate sending OTP and navigate to OTPPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OTPPage(phoneNumber: _phoneController.text)),
      );
    } else {
      // Show error if terms are not agreed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must agree to the terms and conditions')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activate Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Enter mobile number to activate account',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Enter your mobile number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                ),
                Text('Agree to terms and conditions'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getActivationCode,
              child: Text('Get Activation Code'),
            ),
          ],
        ),
      ),
    );
  }
}
