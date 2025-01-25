import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SetupAccountPage(),
    );
  }
}

class SetupAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome text
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Let’s set up your new account.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),

            // Setup options
            _buildSetupOption(
              icon: Icons.call,
              title: 'Verify phone number',
              subtitle: 'In order to receive SMS and Send SOS you need to verify your phone number',
              buttonText: 'Edit',
            ),
            SizedBox(height: 15),
            _buildSetupOption(
              icon: Icons.lock,
              title: 'Set emergency PIN',
              subtitle: 'To cancel your SOS and activate / deactivate other alerts',
              buttonText: 'Set',
            ),
            SizedBox(height: 15),
            _buildSetupOption(
              icon: Icons.contacts,
              title: 'Add emergency contacts',
              subtitle: 'For sending notifications and SOS when you are in trouble',
              buttonText: 'Set',
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each setup option card
  Widget _buildSetupOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 40),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle button action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}