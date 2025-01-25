import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 
 try {
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   
   // Optional: Firebase Authentication initialization
   FirebaseAuth.instance.authStateChanges().listen((User? user) {
     if (user == null) {
       print('User is currently signed out');
     } else {
       print('User is signed in');
     }
   });
 } catch (e) {
   print('Firebase initialization error: $e');
 }

 await SystemChrome.setPreferredOrientations([
   DeviceOrientation.portraitUp,
   DeviceOrientation.portraitDown,
 ]);

 runApp(
   const ProviderScope(
     child: App(),
   ),
 );
}

class App extends StatelessWidget {
 const App({super.key});

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'SafeGuardHer',
     navigatorKey: navigatorKey,
     theme: ThemeData(
       primarySwatch: Colors.blue,
       appBarTheme: AppBarTheme(
         backgroundColor: Colors.blue[800],
       ),
     ),
     home: const SafeGuardHer(),
     debugShowCheckedModeBanner: false,
   );
 }
}

class SafeGuardHer extends StatefulWidget {
 const SafeGuardHer({super.key});

 @override
 _SafeGuardHerState createState() => _SafeGuardHerState();
}

class _SafeGuardHerState extends State<SafeGuardHer> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('SafeGuardHer'),
     ),
     body: Center(
       child: Text('Welcome to SafeGuardHer'),
     ),
   );
 }
}