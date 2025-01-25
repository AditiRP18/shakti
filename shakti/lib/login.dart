import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(Icons.security, size: 60, color: Colors.green),
            SizedBox(height: 10),
            Text(
              'URSAFE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome Back,\nYou\'ve been missed!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Tabs (Phone / Email)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Phone',
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Email',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Phone input field
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green.withOpacity(0.1),
              ),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.flag, color: Colors.green),
                        SizedBox(width: 5),
                        Text('+1', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  hintText: 'Enter your number',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Get OTP button
            ElevatedButton(
              onPressed: () {
                // Handle OTP logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Get OTP',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            // Divider with "or continue with"
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('or continue with'),
                ),
                Expanded(child: Divider(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 10),
            // Google sign-in button
            OutlinedButton.icon(
              icon: Image.asset('assets/google.png', width: 24, height: 24),
              label: Text('Google', style: TextStyle(fontSize: 16)),
              onPressed: () {
                // Handle Google sign-in logic
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: BorderSide(color: Colors.green),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
            ),
            SizedBox(height: 20),
            // Register link
            TextButton(
              onPressed: () {
                // Navigate to register page
              },
              child: Text(
                'Don\'t have an account? Register',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}