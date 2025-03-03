import 'package:flutter/material.dart';

class ManageIncidents extends StatelessWidget {
  // Dummy list of cybercrime incidents
  final List<Map<String, String>> incidents = [
    {
      "incident_type": "Phishing Attack",
      "description": "User received an email pretending to be from their bank asking for login details.",
      "status": "Pending"
    },
    {
      "incident_type": "Ransomware Attack",
      "description": "A company's data was encrypted, and the attacker demanded a ransom payment.",
      "status": "Under Review"
    },
    {
      "incident_type": "Identity Theft",
      "description": "Personal information was stolen and used for fraudulent activities.",
      "status": "Resolved"
    },
    {
      "incident_type": "Social Engineering",
      "description": "An employee was tricked into sharing sensitive company data.",
      "status": "Pending"
    },
    {
      "incident_type": "DDoS Attack",
      "description": "An online service was flooded with fake traffic, causing downtime.",
      "status": "Under Review"
    },
    {
      "incident_type": "Online Fraud",
      "description": "A user was tricked into paying for a fake online service.",
      "status": "Resolved"
    },
    {
      "incident_type": "Spyware Infection",
      "description": "Malicious software was installed unknowingly, tracking user activity.",
      "status": "Pending"
    },
    {
      "incident_type": "Dark Web Data Leak",
      "description": "Personal credentials were found on the dark web after a data breach.",
      "status": "Under Review"
    },
    {
      "incident_type": "Fake Tech Support Scam",
      "description": "Scammers posed as tech support and tricked a user into granting access to their system.",
      "status": "Resolved"
    },
    {
      "incident_type": "Cryptojacking",
      "description": "User's computer was hijacked to mine cryptocurrency without consent.",
      "status": "Pending"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Incidents")),
      body: ListView.builder(
        itemCount: incidents.length,
        itemBuilder: (context, index) {
          final incident = incidents[index];
          return Card(
            margin: EdgeInsets.all(8),
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.warning, color: Colors.red), // Warning icon
              title: Text(
                incident["incident_type"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(incident["description"]!),
              trailing: Chip(
                label: Text(incident["status"]!),
                backgroundColor: _getStatusColor(incident["status"]!),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.orange;
      case "Under Review":
        return Colors.blue;
      case "Resolved":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
