import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sampleproject/Setting%20Screen/settings.dart';
import '../EP Profile/Navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Setting.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey= GlobalKey <FormState>();
  var newPassword =  "";
  var auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  ChangePassword ({email,oldpassword,newpassword}) async {

    var cred = EmailAuthProvider.credential(email: email, password: oldpassword);
        await currentUser!.reauthenticateWithCredential(cred).then((value){
          currentUser!.updatePassword(newPassword);
        }).catchError((error){
          print(error.toString());
        });



  }


  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final oldpasswordController =TextEditingController();
  @override
  void dispose(){

    newPasswordController.dispose();
    confirmPasswordController.dispose();
    oldpasswordController.dispose();

    super.dispose();
  }
  void changePassword(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Navbar()),
    );
  }


  // ChangePassword() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => Navbar()));
  // }
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
        title: Text("Change Password"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () async
           {
             await ChangePassword(
               email: "muskan123@gmail.com",
                 oldpassword: oldpasswordController.text,
               newpassword: newPasswordController.text,
             );
           print("password changed");


      //         Navigator.pushReplacement(
      // context,
      // MaterialPageRoute(builder: (context) => SettingScreen()));
           },
        ),

      ),

    body: Form(
      key: _formKey,
      child: Padding(padding: EdgeInsets.symmetric(
        vertical: 40, horizontal: 50

      ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "New Password",
                  hintText: "Enter New Password",
                  labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.redAccent,fontSize: 15.0),
                ),
                controller: newPasswordController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please Enter Password';
                  }
                  return null;
                },
              ),
            ),
             // Container(
             //  margin: EdgeInsets.symmetric(vertical: 15.0),
             //  child: TextFormField(
             //    autofocus: false,
             //    obscureText: true,
             //    decoration: InputDecoration(
             //      labelText: "Confirm Password",
             //      hintText: "Re-Type Your Password",
             //      labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
             //      border: OutlineInput00Border(),
             //      errorStyle: TextStyle(color: Colors.redAccent,fontSize: 15.0),
             //    ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 15.0),
        child: TextFormField(
          autofocus: false,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Confirm Password",
            hintText: "Re-Type Your Password",
            labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(), // Corrected border property
            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
          ),

      controller: confirmPasswordController,
               validator: (value){
               if(value == null || value.isEmpty){
                return 'Please Enter Password';
                     }
                 if(value != newPasswordController.text){
                return 'Passwords do not match';
                     }
                return null;
                 },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(18),
            //   child: ElevatedButton(
            //     onPressed: (){
            //       if(_formKey.currentState!.validate()){
            //         setState(() {
            //           newPassword=newPasswordController.text;
            //         });
            //         ChangePassword();
            //       }
            //     },
            //    child: Text(
            //     'Change Password',
            //     style: TextStyle(color:Colors.black, fontSize: 18) ,
            //    ),
            //    ),
            // ),
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
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                setState(() {
                   newPassword=newPasswordController.text;
                     });
            ChangePassword();
                  }
                      },
                      child: Text(
                        "Change Password",
                        style: TextStyle(
                            color: Colors.white
                        ),

                      ),
                    ),
                  )
          ],
        ),
      ),

    )
    );

  }
}


