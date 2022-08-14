// ignore_for_file: prefer_const_constructors, non_constant_identifier_names


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotpasswordPage extends StatefulWidget {
  const forgotpasswordPage({Key? key}) : super(key: key);

  @override
  State<forgotpasswordPage> createState() => _forgotpasswordPageState();
}

class _forgotpasswordPageState extends State<forgotpasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future <void>? pwreset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
          showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Check your email for a password reset link'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Please enter a valid email'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Please enter your email address to reset your password',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white),
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  icon: Icon(Icons.email),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RaisedButton(
              onPressed: pwreset,
              child: Text('Reset Password'),
            ),
          ),
        ]));
  }
}
