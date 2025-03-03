import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ReportIncident extends StatefulWidget {
  @override
  _ReportIncidentState createState() => _ReportIncidentState();
}

class _ReportIncidentState extends State<ReportIncident> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? _image; // Selected image file
  final ImagePicker _picker = ImagePicker();

  // PICK IMAGE FROM CAMERA OR GALLERY
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // UPLOAD INCIDENT DATA & IMAGE TO SERVER
  Future<void> _submitIncident() async {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty || _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields and select an image")),
      );
      return;
    }

    var request = http.MultipartRequest(
      "POST",
      Uri.parse("http://localhost:5000/api/incidents/report"), // CHANGE TO YOUR API ENDPOINT
    );

    request.fields["title"] = titleController.text;
    request.fields["description"] = descriptionController.text;
    
    if (_image != null) {
      request.files.add(
        await http.MultipartFile.fromPath("incidentImage", _image!.path),
      );
    }

    var response = await request.send();
    
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Incident reported successfully!")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to report incident")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report an Incident"), backgroundColor: Colors.red),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Incident Title"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 20),

            // IMAGE PICKER BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.image),
                  label: Text("Gallery"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera_alt),
                  label: Text("Camera"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 10),

            // SHOW SELECTED IMAGE
            _image != null
                ? Image.file(_image!, height: 150)
                : Text("No image selected", style: TextStyle(color: Colors.grey)),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _submitIncident,
              child: Text("Submit Incident"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
