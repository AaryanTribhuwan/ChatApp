import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
 final _passwordController = TextEditingController();
 final _confirmpassworContorller = TextEditingController();
 final  _firstnamecontroller = TextEditingController();
 final _lastnamecontroller = TextEditingController();
 @override
   void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      _firstnamecontroller.dispose();
      _lastnamecontroller.dispose();
     super.dispose();
   }
  Future signup() async {
       if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(), password: _passwordController.text.trim());
        adduserdetails(
          _emailController.text.trim(), 
          _passwordController.text.trim(),
          _firstnamecontroller.text.trim(),
          _lastnamecontroller.text.trim()
          );
  }
  }
 
  Future adduserdetails(
    String email,
    String password,
    String firstname,
    String lastname,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
      'uid': FirebaseAuth.instance.currentUser!.uid,
    });
  }
  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmpassworContorller.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hello There!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Register Below to get started!',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextField(
                      controller: _firstnamecontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'First Name',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextField(
                      controller: _lastnamecontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Last Name',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _confirmpassworContorller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: signup,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.deepPurple[300],
                      ),
                      child: const Center(child: Text(
                        'Sign up'
                          , style: TextStyle(color: Colors.white, fontSize: 20))),
                      ),
                  ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('I am a Member! '),
                        GestureDetector(
                          onTap: widget.showLoginPage, 
                          child: const Text(
                            ' Login now',
                            style: TextStyle(
                              color: Colors.blue 
                              )),
                        )
                      ],
                    ),
                  ],),
          ),
              )
            )
            );
  }
}