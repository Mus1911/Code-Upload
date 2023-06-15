// import 'package:flutter/material.dart';
// import 'dart:math';
// import '../EP Profile/Navbar.dart';
// import 'spinwheelui.dart';
//
// class SpinWheelDemo extends StatefulWidget {
//   @override
//   _SpinWheelDemoState createState() => _SpinWheelDemoState();
// }
//
// class _SpinWheelDemoState extends State<SpinWheelDemo> {
//   final List<String> items = [
//     '10',
//     '20',
//     '50',
//     '100',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         flexibleSpace: Container(
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         colors: [Colors.black45, Colors.deepOrange],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),), ),
//         title: Text("Daily Rewards"),
//         centerTitle: true,
//         titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(
//             Icons.cancel,
//             color: Colors.white,
//           ),
//           onPressed: ()
//            {
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navbar()));
//            },)),
//       body: Center(
//
//
//             child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Spin for a lucky draw!',
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//
//               SizedBox(height: 40),
//               SpinWheel(items: items, onResult: (String ) {  },),
//             ],
//         ),
//       ),
//     );
//   }
// }