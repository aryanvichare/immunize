import 'package:flutter/material.dart';
import 'package:immunize/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = new TextEditingController();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
  }

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    final auth = Provider.of<FirebaseAuthService>(context, listen: false);
    final user = await auth.createUserWithEmailAndPassword(
        emailController.text.trim(), passwordController.text.trim(), nameController.text.trim());
    
    if (user != null) {
      Navigator.pushNamed(context, '/' );
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
                "Create an account",
                style: TextStyle(color: Color.fromARGB(255, 45, 76, 198), fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Text(
                "Start your rescue now",
                style: TextStyle(color: Color.fromARGB(255, 196, 196, 196), fontSize: 12, fontWeight: FontWeight.w400)
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.emoji_emotions_outlined)
                )
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
                onPressed: () { createUserWithEmailAndPassword(context); },
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
      )
    );
  }
}