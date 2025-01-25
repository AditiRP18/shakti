import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'signup.dart';
import 'login.dart'; // Import the LoginScreen file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://kdlmpcljdfvzvbxpecbq.supabase.co', // Replace with your Supabase URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtkbG1wY2xqZGZ2enZieHBlY2JxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc4MDUxMTAsImV4cCI6MjA1MzM4MTExMH0.p9YfrCeNwbhpGrGejysB3IMRCELk4LNibPsR54-mO2U', // Replace with your Anon Key
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Overlay
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/homepage.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Title
                Text(
                  'Fake Calls',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),

                // Subtitle
                Text(
                  'Now you can schedule your fake calls in difficult situations',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Page Indicator (Dots)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: index == 1 ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: index == 1 ? Colors.white : Colors.white54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 30),

                // Get Started Button
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Login Text
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
