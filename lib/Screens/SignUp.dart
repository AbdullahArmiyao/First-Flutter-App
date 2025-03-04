import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _signup();
}

class _signup extends State<Signup> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final FirebaseStorage _storage = FirebaseStorage.instance;
  final TextEditingController usernameController = TextEditingController();
  String _errorMessage = '';

  // Method to update user profile (name and photo)
  Future<void> updateProfile(String newName) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.updateDisplayName(newName);
        await _firestore.collection('users').doc(user.uid).update({
          'username': newName,
        });
        setState(() {
          _errorMessage = 'Profile updated successfully!';
        }); 
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      } catch (e) {
        setState(() {
          _errorMessage = 'Error updating profile: $e';
        });
      }
    }
  }

  Future<void> pickImage() async {
    String username = usernameController.text.trim();
    await updateProfile(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customize Profile"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              "Enter a username",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    autocorrect: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Name",
                      icon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (usernameController.text.trim().isEmpty) {
                        setState(() {
                          _errorMessage = 'Please enter a username!';
                        });
                      } else {
                        pickImage();
                      }
                    },
                    child: Text("Proceed"),
                  ),
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
