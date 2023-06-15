import 'package:flutter/material.dart';
import 'package:sampleproject/EP%20Profile/Add%20Post/proposal_navbar.dart';
import 'package:sampleproject/EP%20Profile/chat.dart';
import 'package:sampleproject/LuckyDraw/lotto.dart';

import '../LuckyDraw/SpinWheel.dart';
import 'Add Post/Add_Post.dart';

// import 'package:sarmaya_app/Change_Password.dart';
// import 'package:sarmaya_app/Settings.dart';



class enterpreneuerprofile extends StatefulWidget {
  const enterpreneuerprofile({super.key});


  @override
  State<enterpreneuerprofile> createState() => _enterpreneuerprofileState();
}

class _enterpreneuerprofileState extends State<enterpreneuerprofile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor:  Colors.grey,
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

      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 5,
              // ),
              Stack(
                children: [
                  Container(
                      height: 100, width: double.infinity, color: Colors.transparent
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(

                                image: DecorationImage(image: NetworkImage("https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250")
                                ),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Welcome Ali Raza",
                               style: TextStyle(color: Colors.black, fontSize: 20),

                            ),
                           
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),

                            borderRadius: BorderRadius.circular(30),
                          ),

                          child: TextField(
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: "search Post",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Container(
                            //   margin: EdgeInsets.only(top: 10),
                            //   child: Image.asset("Images/addpost.png"),
                            //   height: 160,
                            //   width: 160,
                            // ),
                            // Icon(Icons.view_agenda_outlined,size: 22,color: Colors.white,),
                            // SizedBox(height: 15,),
                            // Text(
                            //   "View Post",
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 20,
                            //   ),
                            // ),

                                Category(imagePath:"assets/addpost.png", title: "Add Proposal", onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => ProposalNavbar()),
                                          );
                                   },),
                                Category(imagePath:"assets/lottery.png", title: "LOTTO",onTap: (){
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => lotto()));

                                },),
                                Category(imagePath:"assets/chat.png", title: "Chat", onTap: (){
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => ChatScreen()));

                                },),
                                Expanded(child: Category(imagePath:"assets/history.png", title: "History")),
                          ],
                        ),
                      ),
                    ],
                  )

                ],
              )
            ],
          )
      ),

    );
  }
}

class Category extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function()? onTap;
  const Category({Key? key, required this.imagePath, required this.title, this.onTap})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: onTap,
    child :Card(
      child: Container(
        width: 85,
        height: 129,
        child: Column(
          children: [
            Image.asset(imagePath,
              width: 100,
              height: 100,
              // fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title)

          ],
        ),
        ),
      ),
    );
  }
}