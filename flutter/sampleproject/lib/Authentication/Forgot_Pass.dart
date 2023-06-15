import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'LogIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  var email = "";

  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  // resetPassword() async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.orangeAccent,
  //         content: Text(
  //           'Password Reset Email has been sent !',
  //           style: TextStyle(fontSize: 18.0),
  //         ),
  //       ),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.orangeAccent,
  //           content: Text(
  //             'No user found for that email.',
  //             style: TextStyle(fontSize: 18.0),
  //           ),
  //         ),
  //       );
  //     }
  //   }
  // }

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
        title: Text("Reset Password"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              'Reset Link will be sent to your email id !',
              style: TextStyle(fontSize: 20.0),
            ),
          ),

          Expanded(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Email: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: emailController,

                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      height: 54,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              (new Color(0xffF5591F)),
                              (new Color(0xffF2861E))
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight
                        ),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)
                        )
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          ResetPassword();
                            // resetPassword();
                          }
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => enterpreneuerprofile()));
                        ,
                        child: Text(
                          "Send Email",
                          style: TextStyle(
                              color: Colors.white
                          ),

                        ),
                      ),
                    ),

                    // Container(
                    //   margin: EdgeInsets.only(left: 60.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       ElevatedButton(
                    //         //  style: ElevatedButton.styleFrom(
                    //         //     primary: Colors.deepOrange,
                    //
                    //         //         textStyle: TextStyle(color: Colors.white),
                    //         //      ),
                    //         onPressed: () {
                    //           // Validate returns true if the form is valid, otherwise false.
                    //           if (_formKey.currentState!.validate()) {
                    //             setState(() {
                    //               email = emailController.text;
                    //             });
                    //             // resetPassword();
                    //           }
                    //         },
                    //         child: Text(
                    //           'Send Email',
                    //           style: TextStyle(fontSize: 18.0),
                    //         ),
                    //       ),

                    // TextButton(
                    //   onPressed: () => {
                    //     Navigator.pushAndRemoveUntil(
                    //         context,
                    //         PageRouteBuilder(
                    //           pageBuilder: (context, a, b) => LoginScreen(),
                    //           transitionDuration: Duration(seconds: 0),
                    //         ),
                    //             (route) => false)
                    //   },
                    //   child: Text(
                    //     'Login',
                    //     style: TextStyle(fontSize: 14.0),
                    //   ),
                    // ),
                    //     ],
                    //   ),
                    // ),

                    // Container(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text("Don't have an Account? "),
                    //       TextButton(
                    //           onPressed: () => {
                    //             Navigator.pushAndRemoveUntil(
                    //                 context,
                    //                 PageRouteBuilder(
                    //                   pageBuilder: (context, a, b) =>
                    //                       SignUpScreen(),
                    //                   transitionDuration:
                    //                   Duration(seconds: 0),
                    //                 ),
                    //                     (route) => false)
                    //           },

                    //           child: Text('Signup'))
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future ResetPassword() async {
    final isvalid = _formKey.currentState!.validate();
    if (!isvalid) return;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      Fluttertoast.showToast(
          msg: 'Password Reset Email was Sent', gravity: ToastGravity.BOTTOM);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.BOTTOM);
    }
    // Navigator.pop(context);
  }
}

//
//   Future ResetPassword() async {
//     final isvalid = _formKey.currentState!.validate();
//     if (!isvalid) return;
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) =>
//             Center(
//               child: Image.asset(
//                 'assets/Eater_loading.gif',
//                 width: 100,
//                 height: 100,
//               ),
//             ));
//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(
//         email: emailController.text.trim(),
//       );
//       Fluttertoast.showToast(
//           msg: 'Password Reset Email was Sent', gravity: ToastGravity.BOTTOM);
//     } on FirebaseAuthException catch (e) {
//       Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.BOTTOM);
//     }
//     Navigator.pop(context);
//   }
// }