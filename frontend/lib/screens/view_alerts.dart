import 'package:flutter/material.dart';
import '../service/api_service.dart';

class ViewAlerts extends StatefulWidget {
  @override
  _ViewAlertsState createState() => _ViewAlertsState();
}

class _ViewAlertsState extends State<ViewAlerts> {
  List<dynamic> alerts = [];

  @override
  void initState() {
    super.initState();
    fetchAlerts();
  }

  Future<void> fetchAlerts() async {
    List<dynamic> data = await ApiService.fetchScamAlerts();
    setState(() {
      alerts = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scam Awareness Alerts")),
      body: alerts.isEmpty
          ? Center(child: Text("No scam alerts available."))
          : ListView.builder(
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                final alert = alerts[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(alert['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(alert['message']),
                    trailing: Text(alert['severity'].toUpperCase(),
                        style: TextStyle(
                            color: alert['severity'] == 'high' ? Colors.red : (alert['severity'] == 'medium' ? Colors.orange : Colors.green))),
                  ),
                );
              },
            ),
    );
  }
}
