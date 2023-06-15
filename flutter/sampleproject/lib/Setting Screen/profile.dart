
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../EP Profile/Navbar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final fnameController = TextEditingController();
  final contactController = TextEditingController();
  final cnicController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final accController = TextEditingController();
  final occController = TextEditingController();
  int maxLength = 11;
  int maxLength1 = 13;
  int maxLength2 = 17;

  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    fnameController.dispose();
    contactController.dispose();
    cnicController.dispose();
    addressController.dispose();
    cityController.dispose();
    countryController.dispose();
    accController.dispose();
    occController.dispose();
  }

  Future<void> updateUserProfile() async {
    if (_formKey.currentState!.validate()) {
      final String name = nameController.text;
      final String email = emailController.text;
      final String fname = fnameController.text;
      final String contact = contactController.text;
      final String cnic = cnicController.text;
      final String address = addressController.text;
      final String city = cityController.text;
      final String country = countryController.text;
      final String accNumber = accController.text;
      final String occupation = occController.text;

      final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

      await users.doc('user_id').update({
        'name': name,
        'email': email,
        'fname': fname,
        'contact': contact,
        'cnic': cnic,
        'address': address,
        'city': city,
        'country': country,
        'accNumber': accNumber,
        'occupation': occupation,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile updated successfully.'),
        ),
      );
    }
  }

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
        title: Text("Edit Profile"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w600,
          color: Colors.orange,
        ),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Navbar()),
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 10, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: Theme
                                .of(context)
                                .scaffoldBackgroundColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250"),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color:
                              Theme
                                  .of(context)
                                  .scaffoldBackgroundColor,
                            ),
                            color: Colors.orange,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.abc)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Fill Required Fields";
                    }
                  },
                ),

                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.name,
                    controller: fnameController,
                    decoration: InputDecoration(
                        labelText: "Father's Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.abc)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Fill Required Fields";
                      }
                    }),

                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.name,
                    controller: cnicController,
                    maxLength: maxLength1,
                    decoration: InputDecoration(
                        labelText: "CNIC",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.perm_identity)),
                    validator: (value) {
                      if (value
                          .toString()
                          .isEmpty) {
                        return 'Fill required fields';
                      } else {
                        return null;
                      }
                    }),

                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.name,
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email)),
                    validator: (value) {
                      bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value == "") {
                        return 'Email Cannot be Empty';
                      } else if (!emailValid) {
                        return 'Invalid Email Address';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                IntlPhoneField(
                    keyboardType: TextInputType.name,
                    controller: contactController,
                    decoration: InputDecoration(
                        labelText: "Contact",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.numbers)),
                    validator: (value) {
                      if (value
                          .toString()
                          .isEmpty) {
                        return 'Fill required fields';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.name,
                    controller: occController,
                    decoration: InputDecoration(
                        labelText: "Occupation",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.work)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Fill Required Fields";
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.name,
                    controller: countryController,
                    decoration: InputDecoration(
                        labelText: "Country",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.flag)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Fill Required Fields";
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.name,
                    controller: cityController,
                    decoration: InputDecoration(
                        labelText: "City",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_city)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Fill Required Fields";
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.name,
                    controller: addressController,
                    decoration: InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_pin)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Fill Required Fields";
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.name,
                    controller: accController,
                    maxLength: maxLength2,
                    decoration: InputDecoration(
                        labelText: "Account Number",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.account_balance)),
                    validator: (value) {
                      if (value
                          .toString()
                          .isEmpty) {
                        return 'Fill required fields';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 35,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
// Perform update operation here
                      updateProfile();
                    }
                  },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Saved",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProfile() {
// Perform the update operation here using Firestore database
// Get the values from the text controllers
    String email = emailController.text;
    String name = nameController.text;
    String fatherName = fnameController.text;
    String cnic = cnicController.text;
    String contact = contactController.text;
    String occupation = occController.text;
    String country = countryController.text;
    String city = cityController.text;
    String address = addressController.text;
    String accountNumber = accController.text;


    emailController.clear();
    nameController.clear();
    fnameController.clear();


    void updateProfile() {
      // Get the user ID or any identifier for the user
      String userId = 'user_id_here';

      // Get the values from the text controllers
      String email = emailController.text;
      String name = nameController.text;
      String fatherName = fnameController.text;
      String cnic = cnicController.text;
      String contact = contactController.text;
      String occupation = occController.text;
      String country = countryController.text;
      String city = cityController.text;
      String address = addressController.text;
      String accountNumber = accController.text;

      // Create a map of the updated profile data
      Map<String, dynamic> updatedProfile = {
        'email': email,
        'name': name,
        'fatherName': fatherName,
        'cnic': cnic,
        'contact': contact,
        'occupation': occupation,
        'country': country,
        'city': city,
        'address': address,
        'accountNumber': accountNumber,
      };

      // Perform the Firestore update operation
      FirebaseFirestore.instance.collection('users').doc(userId).update(
          updatedProfile)
          .then((value) {
        // Update successful
        print('Profile updated successfully!');
        // Clear the text fields after successful update
        emailController.clear();
        nameController.clear();
        fnameController.clear();
        cnicController.clear();
        contactController.clear();
        occController.clear();
        countryController.clear();
        cityController.clear();
        addressController.clear();
        accController.clear();
      })
          .catchError((error) {
        // Error occurred during update
        print('Failed to update profile: $error');
      });
    }
  }

  Future signup() async {
    String name = nameController.text;
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);
      authprofilesetting(result, nameController.text, phonecontroller.text);
      final user = FirebaseAuth.instance.currentUser!;
      final docuser =
      FirebaseFirestore.instance.collection('Users').doc(user.uid);

      final data = {
        'Name': nameController.text,
        'Email': emailController.text,
        'Address': '',
        'Phone': int.parse(phonecontroller.text)
      };
      await docuser.set(data);
      Fluttertoast.showToast(msg: 'Signup Succesful!');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, gravity: ToastGravity.BOTTOM);
    }
    Navigator.pop(context);
  }


}


