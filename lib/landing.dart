import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: Padding (
            padding: new EdgeInsets.all(23),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Rotator()),
              ElevatedButton(
                onPressed: () { Navigator.pushNamed(context, '/login'); },
                child: Text('Login', style: TextStyle(fontSize: 20))
              ),
              TextButton(
                onPressed: () { Navigator.pushNamed(context, '/signup'); },
                child: Text('Register', style: TextStyle(fontSize: 20))
              )
            ]
          ),
        )
      )
    );
  }
}

class Rotator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
    );
  }
}