import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:immunize/screens/homepage.dart';
import 'package:immunize/utils/constants.dart';
import 'package:immunize/signup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Immunize',
    theme: ThemeData(
        primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
    initialRoute: '/',
    routes: {
      '/': (context) => App(),
      '/signup': (context) => Signup(),
    },
  ));
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: APP_NAME, home: Homepage());
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, //Color.fromARGB(255, 45, 76, 198),
      child: Image(image: AssetImage('assets/images/immunize.png')),
    );
  }
}
