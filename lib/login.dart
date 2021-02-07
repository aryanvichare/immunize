import 'package:flutter/material.dart';
import 'package:immunize/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
  }

  Future<void> loginWithEmailAndPassword(BuildContext context) async {
    final auth = Provider.of<FirebaseAuthService>(context, listen: false);
    final user = await auth.signInWithEmailAndPassword(
        emailController.text.trim(), passwordController.text.trim());
    
    if (user != null) {
      if (user.registered != null)
        Navigator.pushNamed(context, '/' );
      else
        Navigator.pushNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: new EdgeInsets.fromLTRB(22, 63, 22, 37),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Welcome!",
                style: TextStyle(color: Color.fromARGB(255, 45, 76, 198), fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Text(
                "Sign in to continue",
                style: TextStyle(color: Color.fromARGB(255, 196, 196, 196), fontSize: 12, fontWeight: FontWeight.w400)
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.mail_outline)
                )
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline)
                ),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () { loginWithEmailAndPassword(context); },
                child: Text('Login', style: TextStyle(fontSize: 20))
              ),
              TextButton(
                onPressed: () { /* TODO */},
                child: Text('Forgot Password')
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 235, 235, 235)),
                onPressed: () { Navigator.pushNamed(context, '/signup'); },
                child: Text('Sign up', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 45, 76, 198)))
              )
            ]
          )
        )
      )
    );
  }
}