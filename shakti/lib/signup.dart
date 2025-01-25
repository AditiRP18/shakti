import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                'Create your account',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Name input
              _buildTextField(_nameController, 'Full Name', Icons.person),

              SizedBox(height: 15),
              // Email input
              _buildTextField(_emailController, 'Email', Icons.email),

              SizedBox(height: 15),
              // Phone input
              _buildPhoneInput(),

              SizedBox(height: 15),
              // Password input
              _buildTextField(_passwordController, 'Password', Icons.lock, isPassword: true),

              SizedBox(height: 25),
              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  // Handle signup logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Sign Up',
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

              // Google sign-up button
              OutlinedButton.icon(
                icon: Image.asset('assets/google.png', width: 24, height: 24),
                label: Text('Google', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  // Handle Google sign-up logic
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green,
                  side: BorderSide(color: Colors.green),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                ),
              ),

              SizedBox(height: 20),
              // Already have an account? Login
              TextButton(
                onPressed: () {
                  // Navigate to login page
                },
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create text fields
  Widget _buildTextField(TextEditingController controller, String hintText, IconData icon, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.green),
        hintText: hintText,
        filled: true,
        fillColor: Colors.green.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Phone input with country flag and prefix
  Widget _buildPhoneInput() {
    return Container(
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
    );
  }
}