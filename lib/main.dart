import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:immunize/register.dart';
import 'package:immunize/services/file_storage_service.dart';
import 'package:immunize/utils/constants.dart';
import 'package:immunize/auth.dart';
import 'package:immunize/login.dart';
import 'package:immunize/services/firebase_auth_service.dart';
import 'package:immunize/signup.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService(),
        ),
        Provider<FirebaseStorageService>(
            create: (_) => FirebaseStorageService()
        ),
      ],
      child: MaterialApp(
        title: APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => App(),
          '/signup': (context) => Signup(),
          '/login': (context) => Login(),
          '/register': (context) => CameraRegister()
        },
      )
    )
  );
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
          return AuthWidget();
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
      color: Colors.white, //Color.fromARGB(255, 45, 76, 198),
      child: Image(image: AssetImage('assets/images/immunize.png')),
    );
  }
}
