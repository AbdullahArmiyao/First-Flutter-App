import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authScreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _homepage();
}

class _homepage extends State<Homepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _handleLogout() async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => authScreen()),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out. Please try again.')),
      );
    }
  }

  Future<String?> getUsername() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return user.displayName;
    } else {
      return null;
    }
  }

  Future<String?> getProfilePicture() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.photoURL; // URL of the profile picture
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: Text("Home"),
        actions: [
          FutureBuilder<String?>(
            future: getUsername(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error fetching username');
              } else if (snapshot.hasData) {
                return Text(snapshot.data ?? 'No username');
              } else {
                return Text('No username');
              }
            },
          ),
          FutureBuilder<String?>(
              future: getProfilePicture(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Icon(Icons.error, size: 50);
                } else if (snapshot.hasData && snapshot.data != null) {
                  // If there is a profile picture URL
                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(snapshot.data!),
                  );
                } else {
                  // If no profile picture is available
                  return CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  );
                }
              }
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 40,),
              Text("Welcome To The Homepage"),
            ],
          ),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(
            icon:
                IconButton(onPressed: _handleLogout, icon: Icon(Icons.logout)),
            label: "Logout",
          ),
        ],
      ),
    );
  }
}
