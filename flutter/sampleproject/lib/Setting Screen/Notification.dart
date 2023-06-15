import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          String notification = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            title: Text(
              notification,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Notification body',
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              // Handle notification item click
            },
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open Notifications'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Example',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomeScreen(),
    );
  }
}
