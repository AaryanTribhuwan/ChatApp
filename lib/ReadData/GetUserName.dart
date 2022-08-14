import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  const GetUserName({Key? key, required this.documentID}) : super(key: key);
 final String documentID;
  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: currentUser) as CollectionReference<Object?> ;
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentID).get(),
      builder: (( context,snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['firstname']} ${data['lastname']}');
        } 
        return  Text('Loading...');
      }
      ),
    );
  }
}