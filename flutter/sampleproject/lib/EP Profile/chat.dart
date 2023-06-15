import 'package:flutter/material.dart';
import 'package:sampleproject/EP%20Profile/Navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textController = TextEditingController();
  List<String> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(text);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                  hintText: 'Enter your message'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        message,
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      itemCount: _messages.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildMessage(_messages[index]);
      },
    );
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
                ),), ),
            title: Text("Messaging"),
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
            elevation: 1,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: ()
              {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navbar()));
              },)),
        body: Column(
            children: [
              Expanded(
                child: _buildMessageList(),
              ),
              Divider(height: 2.0),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: _buildTextComposer(),
              ),
            ],
        ),
        );
  }
}


