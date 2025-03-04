import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/Screens/SignUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify Email")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please check your inbox for a verification email.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                User? user = FirebaseAuth.instance.currentUser;
                await user?.reload();
                if (user != null && user.emailVerified) {
                  try {
                    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
                    if (userDoc.exists) {
                      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
                        'verified': true,
                      });
                    } else {
                      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                        'verified': true,
                        'uid': user.uid,  // Add any other fields as necessary
                      });
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('An error occurred while updating Firestore: $e')),
                    );
                  }
                } else {
                  // Notify the user to check again after some time
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please wait until the email is verified')),
                  );
                }
              },
              child: Text("Check Email Verification"),
            ),
          ],
        ),
      ),
    );
  }
}
