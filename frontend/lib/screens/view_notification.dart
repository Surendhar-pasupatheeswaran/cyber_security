import 'package:flutter/material.dart';
import '../service/api_service.dart';

class ViewNotifications extends StatefulWidget {
  @override
  _ViewNotificationsState createState() => _ViewNotificationsState();
}

class _ViewNotificationsState extends State<ViewNotifications> {
  List<dynamic> notifications = [];

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    List<dynamic> data = await ApiService.fetchNotifications();
    setState(() {
      notifications = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Notifications")),
      body: notifications.isEmpty
          ? Center(child: Text("No notifications yet."))
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return ListTile(
                  title: Text(notification['message']),
                  subtitle: Text("Type: ${notification['notification_type']}"),
                  trailing: Text(notification['sent_at'].toString().split('T')[0]),
                );
              },
            ),
    );
  }
}
