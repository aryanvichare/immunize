import 'package:flutter/material.dart';
import 'package:immunize/landing.dart';
import 'package:immunize/main.dart';
import 'package:immunize/register.dart';
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
    return StreamBuilder<AppUser>(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var user = snapshot.data;

          if (user != null) {
            if (user.registered != null)
              return Column(
                children: <Widget>[
                  Text(user.uid),
                  Text(user.email),
                  Text(user.name == null ? 'No Name' : user.name),
                  Text(user.avatar == null ? 'No Avatar' : user.name),
                  Text(user.registered.toString()),
                  ElevatedButton(
                    onPressed: () { authService.signOut(); }, 
                    child: Text("Log Out")
                  )
                ]
              );
            else
              return CameraRegister();
          } else {
            return Splash();
          }
        } 
        return Loading();
      },
    );
  }
}