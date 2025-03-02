import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _signup();
}

class _signup extends State<Signup> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Customize"),
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 90,),
                    Text("Enter a username", style: TextStyle(
                      fontSize: 25
                    ),),
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      autocorrect: true,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Name",
                        icon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 40,),
                    ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        elevation: WidgetStateProperty.all(0)
                      ), 
                      child: Text("Proceed")
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
