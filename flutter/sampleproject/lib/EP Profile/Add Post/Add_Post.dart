
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sampleproject/EP%20Profile/Add%20Post/utils.dart';
import '../Navbar.dart';


const List<String> list = <String>['Please select an option','BSCS', 'BSAF', 'BSMS', 'BBA'];
class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);



  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  var _Name;
  var _selectedField;
  var _Title;
  var _Description;
  var _TimePeriod;
  var _selectedRange;
  // var _customAmount;
  // var _otherRange;

  void _updateText(val) {
    setState(() {
      _Name = val;
      _Title = val;
      _Description = val;
      _TimePeriod = val;
    });
  }

  // void _updateCustomAmount(String amount) {
  //   setState(() {
  //     _customAmount = amount;
  //   });
  // }

  void _selectField(String selectedField) {
    setState(() {
      _selectedField = selectedField;
      _selectedRange = _selectedRange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.deepOrange,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Navbar()),
            );
          },
        ),
        title: Text("Add Post"),
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.deepOrangeAccent,
        ),
        actions: [
          TextButton(
            onPressed: () {

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Post",
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextFormField(
              onChanged: (val) {
                _updateText(val);
              },
              decoration: InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            TextFormField(
              onChanged: (val) {
                _updateText(val);
              },

              decoration: InputDecoration(
                labelText: "Title",
                prefixIcon: Icon(Icons.event_available),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedField,
              onChanged: (value) {
                _selectedField(value!);
              },
              decoration: InputDecoration(
                labelText: "Select Filed",
                prefixIcon: Icon(Icons.category),
                border: OutlineInputBorder(),
              ),

              items: [
                DropdownMenuItem(
                  value: "Green Field",
                  child: Text("Green Field"),
                ),
                DropdownMenuItem(
                  value: "Brown Field",
                  child: Text("Brown Field"),
                ),
              ],
            ),

            SizedBox(height: 20),
            TextFormField(
              onChanged: (val) {
                _updateText(val);
              },
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "Description",
                prefixIcon: Icon(Icons.note_add_sharp),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            TextFormField(
              onChanged: (val) {
                _updateText(val);
              },

              decoration: InputDecoration(
                labelText: "Returning Time Period",
                prefixIcon: Icon(Icons.access_time_filled),
                border: OutlineInputBorder(),
              ),
            ),


            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedRange,
              onChanged: (value) {
                _selectedRange(value!);
              },
              decoration: InputDecoration(
                labelText: "select Range",
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
              ),

              items: [
                DropdownMenuItem(
                  value: "50000 - 100000",
                  child: Text("50000 - 100000"),
                ),
                DropdownMenuItem(
                  value: "100000 - 150000",
                  child: Text("100000 - 150000"),
                ),
                DropdownMenuItem(
                  value: "150000 - 200000",
                  child: Text("150000 - 200000"),
                ),
                DropdownMenuItem(
                  value: "200000 - 300000",
                  child: Text("200000 - 300000"),
                ),
            //     DropdownMenuItem(
            //       value: "Other",
            //       child: Text("Other"),
            //     ),
            //   ],
            // ),
            // // SizedBox(height: 20),
            // if (_selectedRange == "Other")
            //   TextFormField(
            //     onChanged: (val) {
            //       setState(() {
            //         _selectedRange = val!;
            //       });
            //       // _updateCustomAmount(val);
            //     },
            //     decoration: InputDecoration(
            //       labelText: "Custom Range",
            //       prefixIcon: Icon(Icons.monetization_on),
            //       border: OutlineInputBorder(),
            //     ),
            //   ),
            // SizedBox(height: 20),
            // if (_selectedRange == "Other" && _otherRange != null)
            //   TextFormField(
            //     onChanged: (val) {
            //       setState(() {
            //         _selectedRange = val!;
            //       });
            //       // _updateCustomAmount(val);
            //     },
            //     decoration: InputDecoration(
            //       labelText: "Custom Amount",
            //       prefixIcon: Icon(Icons.monetization_on),
            //       border: OutlineInputBorder(),
            //     ),
            //   ),


  ])
    ]  ),
    ),
    );

    Future submit() async{
      //var _formkey;
      final isValid = _formKey.currentState!.validate();
      if(!isValid) return;
      String message;
      try{
        final docuser = FirebaseFirestore.instance.collection("Volunteer");
        final data = {
          "fullname": _fullnamecontroller.text,
          "phonenumber": _phonenumbercontroller.text,
          "emailaddress": _emailcontroller.text,
          "registration": _registrationcontroller.text,
          "department": _departmentcontroller.text,

        };
        await docuser.add(data);
        message ='succussfully submitted voluntter';
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message.toString())));
      }
      catch (e){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));

      }


  }
}


