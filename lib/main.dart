import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

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

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Immunize',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: [
          Image(image: AssetImage('assets/images/rotate1.png')),
          Image(image: AssetImage('assets/images/rotate2.png')),
          Image(image: AssetImage('assets/images/rotate3.png')),
        ].map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.white),
                  child: item);
            },
          );
        }).toList(),
      ),
    );
  }
}