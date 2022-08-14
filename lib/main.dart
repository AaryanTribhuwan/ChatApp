
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Authentication/main_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDdg2VgQYiqNWKPJ1S6gu1TAgdUShLqWBE",
  authDomain: "chatapppp-a3479.firebaseapp.com",
  projectId: "chatapppp-a3479",
  storageBucket: "chatapppp-a3479.appspot.com",
  messagingSenderId: "434797337043",
  appId: "1:434797337043:web:303a03ca1acc5afc76f726",
  measurementId: "G-NZLC4PY5JG"
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat',
      theme: ThemeData(
        primaryColor: Colors.orange[900],
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}