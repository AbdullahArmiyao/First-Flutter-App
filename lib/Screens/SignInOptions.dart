// import 'package:flutter/material.dart';
// import 'authScreen.dart';
// import 'HomePage.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Signinoptions extends StatefulWidget {
//   const Signinoptions({super.key});
//   @override
//   State<Signinoptions> createState() => _signin();
// }

// class _signin extends State<Signinoptions> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

  

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Assignment",
//           style: TextStyle(
//             fontStyle: FontStyle.italic,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//             child: Center(
//           child: Column(
//               children: [
//                 Center(
//                   child: Column(
//                     children: [
//                       SizedBox(height: 40,),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(40)),
//                           boxShadow: [
//                             BoxShadow(blurRadius: 20)
//                             ],
//                           color: Colors.white,
//                         ), 
//                         child: Padding(
//                         padding: EdgeInsets.all(50),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               "Select Login Method",
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                   fontStyle: FontStyle.italic),
//                             ),
//                             SizedBox(
//                               height: 50,
//                             ),
//                             ElevatedButton(
//                                 onPressed: () {
//                                   googlelogin();
//                                 },
//                                 style: ButtonStyle(
//                                   elevation: WidgetStateProperty.all(0),
//                                   backgroundColor:
//                                       WidgetStateProperty.all(Colors.transparent),
//                                 ),
//                                 child: Text(
//                                   "Google",
//                                   style: TextStyle(fontSize: 20),
//                                 )),
//                           ],
//                         ),
//                       ),
//                                       ),
//                     ],
//                   ),),
//                 SizedBox(height: 60,),
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => authScreen()));
//                     },
//                     style: ButtonStyle(
//                         elevation: WidgetStateProperty.all(0),
//                         backgroundColor:
//                             WidgetStateProperty.all(Colors.transparent)),
//                     child: Text("Back to email login", style: TextStyle(
//                       fontSize: 30
//                     ),)
//                     ),
//               ],
//             ),
//           ),
//         )),
        
                    
//       );

//   }
// }
