import 'package:flutter/material.dart';
import '../service/api_service.dart';

class ViewIncidents extends StatefulWidget {
  @override
  _ViewIncidentsState createState() => _ViewIncidentsState();
}

class _ViewIncidentsState extends State<ViewIncidents> {
  List<dynamic> incidents = [];

  @override
  void initState() {
    super.initState();
    fetchIncidents();
  }

  Future<void> fetchIncidents() async {
    List<dynamic> data = await ApiService.fetchUserIncidents();
    setState(() {
      incidents = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Reported Incidents")),
      body: incidents.isEmpty
          ? Center(child: Text("No incidents reported yet."))
          : ListView.builder(
              itemCount: incidents.length,
              itemBuilder: (context, index) {
                final incident = incidents[index];
                return ListTile(
                  title: Text("Type: ${incident['incident_type']}"),
                  subtitle: Text("Status: ${incident['status']}"),
                  trailing: Text(incident['reported_at'].toString().split('T')[0]),
                );
              },
            ),
    );
  }
}
