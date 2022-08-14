
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:realchatapp/ReadData/GetUserName.dart';
import 'package:realchatapp/pages/ChatScreen.dart';
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  List<String> docIds = [];

  Future<void> getDocs() async {
   await FirebaseFirestore.instance.collection('users').get().then(
    (snapshot) => snapshot.docs.forEach((element) {
       docIds.add(element.reference.id);
       }));
      
  }
  @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('Home Page'),
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
        ),
      ],
    ),
        
    body:Center(
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Expanded(
            child: FutureBuilder(
              future: getDocs(),
              builder: (context, snapshot) {
                return ListView.builder(
                itemCount: docIds.length,
                itemBuilder: (context,index) {
                  return ListTile(
                     title: GetUserName(documentID: docIds[index]),
                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()),
                  ));
                },
              );
              },
            ),
          )
        ]//children
      ),// Column
    ),// Center
  );// Scaffold
  }
}