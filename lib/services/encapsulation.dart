import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Encapsulation extends ChangeNotifier {
  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // instance of firestore
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  // get name
  Future<String> getUserName() async {
    final user = await _firebase
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .get();
    return user['name'].toString();
  }
}
