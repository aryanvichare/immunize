import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

import 'package:immunize/landing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        /*if (snapshot.hasError) {
          return SomethingWentWrong();
        }*/

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Landing();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            color: Color.fromARGB(255, 45, 76, 198),
            child: Image(image: AssetImage('assets/images/immunize.png')),
          );
  }
}