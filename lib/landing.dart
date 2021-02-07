import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Splash()
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
