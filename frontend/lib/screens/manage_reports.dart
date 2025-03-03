import 'package:flutter/material.dart';

class ManageReports extends StatelessWidget {
  // Dummy list of cybercrime reports
  final List<Map<String, String>> reports = [
    {
      "title": "Suspicious Login Attempt",
      "message": "Multiple failed login attempts detected on the user's account.",
      "severity": "High",
    },
    {
      "title": "Fake Social Media Profile",
      "message": "User reported a fake social media account impersonating them.",
      "severity": "Medium",
    },
    {
      "title": "Phishing Email",
      "message": "Received an email pretending to be from a bank, asking for credentials.",
      "severity": "High",
    },
    {
      "title": "Unauthorized Transactions",
      "message": "User detected multiple unauthorized credit card transactions.",
      "severity": "High",
    },
    {
      "title": "Ransomware Alert",
      "message": "Company's system was locked by ransomware, demanding payment.",
      "severity": "Critical",
    },
    {
      "title": "Data Breach Notification",
      "message": "User data was leaked in an online breach.",
      "severity": "Critical",
    },
    {
      "title": "Scam Website Reported",
      "message": "Fake e-commerce website scamming users with non-delivered products.",
      "severity": "Medium",
    },
    {
      "title": "Online Harassment",
      "message": "User reported being harassed through social media.",
      "severity": "Medium",
    },
    {
      "title": "Malware Infection",
      "message": "A user accidentally downloaded a malicious file from an email.",
      "severity": "High",
    },
    {
      "title": "Fake Job Offer Scam",
      "message": "User was asked to pay money upfront for a fake job opportunity.",
      "severity": "Low",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Reports"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: _getSeverityColor(report["severity"]!),
                  child: Icon(
                    _getSeverityIcon(report["severity"]!), // ✅ Fixed function call
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                title: Text(
                  report["title"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  report["message"]!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                trailing: Chip(
                  label: Text(
                    report["severity"]!,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: _getSeverityColor(report["severity"]!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to get severity color
  Color _getSeverityColor(String severity) {
    switch (severity) {
      case "Low":
        return Colors.green;
      case "Medium":
        return Colors.orange;
      case "High":
        return Colors.red;
      case "Critical":
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  // ✅ FIX: Function to get severity icons
  IconData _getSeverityIcon(String severity) {
    switch (severity) {
      case "Low":
        return Icons.check_circle;
      case "Medium":
        return Icons.warning;
      case "High":
        return Icons.error;
      case "Critical":
        return Icons.dangerous;
      default:
        return Icons.report;
    }
  }
}
