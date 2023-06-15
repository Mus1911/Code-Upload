import 'package:flutter/material.dart';

class investor_login extends StatefulWidget {
  const investor_login({Key? key}) : super(key: key);

  @override
  State<investor_login> createState() => _investorState();
}

class _investorState extends State<investor_login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black45, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Image.asset("assets/sarmayalogo.png",
          fit: BoxFit.contain,
          height: 50,),
        // title: Text("Sarmaya"),
        // centerTitle: true,
        // titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.w700, color: Colors.deepOrange),
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_active_rounded,
              color: Colors.white,

            ),

            onPressed: () {
            },
          ),
        ],
      ),

    );
  }
}

