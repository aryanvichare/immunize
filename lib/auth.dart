import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immunize/landing.dart';
import 'package:immunize/main.dart';
import 'package:immunize/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService =
        Provider.of<FirebaseAuthService>(context, listen: false);
    return StreamBuilder<User>(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var user = snapshot.data;

          if (user != null) {
            return Column(
              children: <Widget>[
                Text(user.uid),
                Text(user.email),
                ElevatedButton(
                  onPressed: () { authService.signOut(); }, 
                  child: Text("Log Out")
                )
              ]
            );
          } else {
            return Splash();
          }
        } 
        return Loading();
      },
    );
  }
}