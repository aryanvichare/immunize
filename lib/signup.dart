import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: new EdgeInsets.fromLTRB(22, 63, 22, 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Create an account",
              style: TextStyle(color: Color.fromARGB(255, 45, 76, 198), fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Text(
              "Start your rescue now",
              style: TextStyle(color: Color.fromARGB(255, 196, 196, 196), fontSize: 12, fontWeight: FontWeight.w400)
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.emoji_emotions_outlined)
              )
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.mail_outline)
              )
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline)
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () { /* Submit */ },
              child: Text('Sign up', style: TextStyle(fontSize: 20))
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Already have an account?",
                    style: TextStyle(color: Color.fromARGB(255, 196, 196, 196), fontSize: 12, fontWeight: FontWeight.w400)
                  )
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 235, 235, 235)),
                  onPressed: () { Navigator.pushNamed(context, '/login'); },
                  child: Text('Login', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 45, 76, 198)))
                ),
              ]
            )
          ]
        )
      )
    );
  }
}