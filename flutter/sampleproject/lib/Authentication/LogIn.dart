// import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/Authentication/investor_login.dart';
import 'package:sampleproject/LuckyDraw/SpinWheelScreen.dart';
import '../EP Profile/Navbar.dart';
import '../EP Profile/ep.dart';
import 'Forgot_Pass.dart';
import 'Signup.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => Initstate();

}
class Initstate extends State<LoginScreen> {

  bool _passwordhidden = false;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _passwordhidden = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(90)),
                      color: Color(0xffF5591F),
                      gradient: LinearGradient(
                        colors: [
                          (new Color(0xffF5591F)),
                          (new Color(0xffF2861E))
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Image.asset("assets/sarmayalogo.png"),
                          height: 160,
                          width: 160,
                        ),
                Container(
                          margin: EdgeInsets.only(left: 40, top: 50),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Welcome To Sarmaya",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                      controller: emailcontroller,
                      // textInputAction: TextInputAction.next,
                      // validator: (val) {
                      //   bool emailValid = RegExp(
                      //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //       .hasMatch(val!);
                      //   if (val == "") {
                      //     return "Email cannot be Empty";
                      //   } else if (!emailValid) {
                      //     return 'Invalid Email Address';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      cursorColor: Color(0xffF5591F),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Color(0xffF5591F),
                        ),
                        hintText: "Enter Email",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Email is required'),
                        EmailValidator(errorText: 'Enter a valid email address'),
                      ]),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: passcontroller,
                    // textInputAction: TextInputAction.done,
                    // validator: (value) {
                    //   if (value == "")
                    //     return 'Field Cannot be Empty';
                    //   else if (value.toString().length < 6)
                    //     return 'Enter Minimum 6 characters';
                    //   else
                    //     return null;
                    //
                    // },
                    obscureText: true,
                    cursorColor: Color(0xffF5591F),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.vpn_key,
                        color: Color(0xffF5591F),
                      ),
                      hintText: "Enter Password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Password is required'),
                      MinLengthValidator(6, errorText: 'Password must be at least 6 characters'),
                    ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, right: 20),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Text("Forget Password"),
                    onTap: () =>
                    {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword())),
                    },
                  ),

                ),

                //
                // GestureDetector(
                //   onTap: () =>
                //   {
                //
                //     signin(),
                //
                //   },
                //   child: Container(
                //     margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                //     padding: EdgeInsets.only(left: 20, right: 20),
                //     alignment: Alignment.center,
                //     height: 54,
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //           colors: [
                //             (new Color(0xffF5591F)),
                //             (new Color(0xffF2861E))
                //           ],
                //           begin: Alignment.centerLeft,
                //           end: Alignment.centerRight
                //       ),
                //       borderRadius: BorderRadius.circular(50),
                //       boxShadow: [BoxShadow(
                //           offset: Offset(0, 10),
                //           blurRadius: 50,
                //           color: Color(0xffEEEEEE)
                //       )
                //       ],
                //     ),
                //     child: Text('Login'),
                //   ),
                // ),
                // Container(
                //   decoration: BoxDecoration(),
                //   child: GestureDetector(
                //     onTap: () => {
                //
                //       signin(),
                //
                //     },
                //     child: Text('Login'),
                //
                //   ),
                // ),

                // GestureDetector(
                //   onTap: () =>
                //   {
                //     // validate();
                //   if (_formKey.currentState!.validate()) {
                //     Navigator.push(context,
                //         MaterialPageRoute(
                //             builder: (context) => Navbar())),
                //
                //     setState(() {
                //       signin();
                //     })}
                //   },
                //   child: Container(
                //     margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                //     padding: EdgeInsets.only(left: 20, right: 20),
                //     alignment: Alignment.center,
                //     height: 54,
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //           colors: [
                //             (new Color(0xffF5591F)),
                //             (new Color(0xffF2861E))
                //           ],
                //           begin: Alignment.centerLeft,
                //           end: Alignment.centerRight
                //       ),
                //       borderRadius: BorderRadius.circular(50),
                //       boxShadow: [BoxShadow(
                //           offset: Offset(0, 10),
                //           blurRadius: 50,
                //           color: Color(0xffEEEEEE)
                //       )
                //       ],
                //     ),
                 ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // form is valid, perform login action
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>
                              SpinWheel()));
                          // signin();
                        }

                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                //   ),
                // ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have Account? "),
                      GestureDetector(
                        onTap: () =>
                        {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SignUpScreen()

                          ))
                        },
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              color: Color(0xffF5591F)
                          ),
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ));
  }


  Future signin() async {
    final isValid = _formKey.currentState!.validate();
    // if (!isValid) return;
    // showDialog(+
    //   context: context ,
    //   barrierDismissible: false,
    //   builder: (context) =>
    //       Center(
    //         child: Image.asset(
    //           'assets/Eater_loading.gif',
    //           width: 100,
    //           height: 100,
    //         ),
    //       ),
    // );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passcontroller.text);
      // final ref = FirebaseStorage.instance
      //     .ref()
      //     .child("DisplayPicture")
      //     .child(user.uid);
      // global.url = await ref.getDownloadURL();
      User? user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance
          .collection('Users')
          .doc(user?.uid)
          .get()
          .then((DocumentSnapshot documentsnapshot) {
        if (documentsnapshot.exists) {
          if (documentsnapshot.get('role') == 'admin') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SpinWheel(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const investor_login(),
              ),
            );
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logged In!'),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        }
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(), gravity: ToastGravity.BOTTOM);
    }
    Navigator.pop(context);
  }
}
