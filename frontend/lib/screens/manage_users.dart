import 'package:flutter/material.dart';

class ManageUsers extends StatelessWidget {
  // Dummy list of 20 users
  final List<Map<String, String>> users = [
    {
      "name": "Alice Johnson",
      "email": "alice@example.com",
      "phone": "9876543210",
      "role": "Admin",
      "status": "Active",
      "registered_on": "2024-01-10"
    },
    {
      "name": "Bob Smith",
      "email": "bob@example.com",
      "phone": "8765432109",
      "role": "User",
      "status": "Active",
      "registered_on": "2024-02-15"
    },
    {
      "name": "Charlie Brown",
      "email": "charlie@example.com",
      "phone": "7654321098",
      "role": "Authority",
      "status": "Inactive",
      "registered_on": "2024-03-20"
    },
    {
      "name": "David Wilson",
      "email": "david@example.com",
      "phone": "6543210987",
      "role": "User",
      "status": "Active",
      "registered_on": "2024-04-05"
    },
    {
      "name": "Emma Thomas",
      "email": "emma@example.com",
      "phone": "5432109876",
      "role": "Admin",
      "status": "Suspended",
      "registered_on": "2024-05-12"
    },
    {
      "name": "Frank White",
      "email": "frank@example.com",
      "phone": "4321098765",
      "role": "User",
      "status": "Active",
      "registered_on": "2024-06-18"
    },
    {
      "name": "Grace Hall",
      "email": "grace@example.com",
      "phone": "3210987654",
      "role": "Authority",
      "status": "Inactive",
      "registered_on": "2024-07-22"
    },
    {
      "name": "Henry King",
      "email": "henry@example.com",
      "phone": "2109876543",
      "role": "User",
      "status": "Active",
      "registered_on": "2024-08-30"
    },
    {
      "name": "Isabella Lewis",
      "email": "isabella@example.com",
      "phone": "1098765432",
      "role": "Admin",
      "status": "Suspended",
      "registered_on": "2024-09-05"
    },
    {
      "name": "Jack Harris",
      "email": "jack@example.com",
      "phone": "0987654321",
      "role": "User",
      "status": "Active",
      "registered_on": "2024-10-12"
    },
    {
      "name": "Kelly Martinez",
      "email": "kelly@example.com",
      "phone": "9876543220",
      "role": "Authority",
      "status": "Inactive",
      "registered_on": "2024-11-15"
    },
    {
      "name": "Liam Young",
      "email": "liam@example.com",
      "phone": "8765432129",
      "role": "User",
      "status": "Active",
      "registered_on": "2024-12-18"
    },
    {
      "name": "Mia Anderson",
      "email": "mia@example.com",
      "phone": "7654321138",
      "role": "User",
      "status": "Suspended",
      "registered_on": "2024-01-22"
    },
    {
      "name": "Noah Moore",
      "email": "noah@example.com",
      "phone": "6543210147",
      "role": "Admin",
      "status": "Active",
      "registered_on": "2024-02-27"
    },
    {
      "name": "Olivia Taylor",
      "email": "olivia@example.com",
      "phone": "5432110986",
      "role": "User",
      "status": "Inactive",
      "registered_on": "2024-03-30"
    },
    {
      "name": "Paul Jackson",
      "email": "paul@example.com",
      "phone": "4321109875",
      "role": "Authority",
      "status": "Active",
      "registered_on": "2024-04-25"
    },
    {
      "name": "Quinn Scott",
      "email": "quinn@example.com",
      "phone": "3211098764",
      "role": "User",
      "status": "Suspended",
      "registered_on": "2024-05-20"
    },
    {
      "name": "Ryan Adams",
      "email": "ryan@example.com",
      "phone": "2109987653",
      "role": "Admin",
      "status": "Active",
      "registered_on": "2024-06-15"
    },
    {
      "name": "Sophia Baker",
      "email": "sophia@example.com",
      "phone": "1099987652",
      "role": "User",
      "status": "Inactive",
      "registered_on": "2024-07-10"
    },
    {
      "name": "Tom Wilson",
      "email": "tom@example.com",
      "phone": "0989987651",
      "role": "Authority",
      "status": "Active",
      "registered_on": "2024-08-05"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Users"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
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
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                title: Text(
                  user["name"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("📧 ${user["email"]}"),
                    Text("📞 ${user["phone"]}"),
                    Text("🗓 Registered: ${user["registered_on"]}"),
                  ],
                ),
                trailing: Chip(
                  label: Text(user["status"]!, style: TextStyle(color: Colors.white)),
                  backgroundColor: _getStatusColor(user["status"]!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case "Active":
        return Colors.green;
      case "Inactive":
        return Colors.orange;
      case "Suspended":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
