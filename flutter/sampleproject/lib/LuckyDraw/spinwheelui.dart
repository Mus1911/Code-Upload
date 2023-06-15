// import 'dart:math';
// import 'package:flutter/material.dart';
//
//
// class SpinWheel extends StatefulWidget {
//   final List<String> items;
//   final Function(String) onResult;
//
//   SpinWheel({required this.items, required this.onResult});
//
//   @override
//   _SpinWheelState createState() => _SpinWheelState();
// }
//
// class _SpinWheelState extends State<SpinWheel> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//     int _currentIndex = 0;
//   bool _isSpinning = false;
//
//   final Random _random = Random();
//   @override
//
//  void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 5),
//     );
//     _animation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(_controller)
//       ..addListener(() {
//         setState(() {
//           if (_isSpinning) {
//             _currentIndex = (_currentIndex + 1) % widget.items.length;
//           }
//         });
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   void _spin() {
//     _isSpinning = true;
//     _controller.forward().whenComplete(() {
//       _isSpinning = false;
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('You Win Rs .....'),
//             content: Text(widget.items[_currentIndex]),
//
//           );
//         },
//       );
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final double radius = 200;
//     return Center(
//       child: GestureDetector(
//          onTap: () {
//         if (!_isSpinning) {
//           _spin();
//         }
//       },
//         child: Transform.rotate(
//           angle: _animation.value * 2 * pi,
//           child: Container(
//             width: radius * 2,
//             height: radius * 2,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Colors.purple[400]!,
//                 Colors.pink[400]!,
//                 Colors.red[400]!,
//                 Colors.orange[400]!,
//                 Colors.yellow[400]!,
//                 Colors.green[400]!,
//                 Colors.blue[400]!,
//               ],
//             ),
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 5,
//                   color: Colors.grey.withOpacity(0.5),
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Text(
//             widget.items[_currentIndex],
//             style: TextStyle(
//               fontSize: 15,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//                       ),
//                     ),
//                   ),
//             );
//
//   }
// }