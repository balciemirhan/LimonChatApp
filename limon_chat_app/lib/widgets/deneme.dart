
/* import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseRegister extends StatefulWidget {
  @override
  _FirebaseRegisterState createState() => _FirebaseRegisterState();
}

class _FirebaseRegisterState extends State<FirebaseRegister> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Register')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) => value.isEmpty ? 'Email cannot be empty' : null,
              onSaved: (value) => _email = value,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              validator: (value) => value.isEmpty ? 'Password cannot be empty' : null,
              onSaved: (value) => _password = value,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Register'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_) {
                    // Registration successful
                    Navigator.pop(context);
                  }).catchError((error) {
                    // Registration failed
                    print(error.code);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
 */