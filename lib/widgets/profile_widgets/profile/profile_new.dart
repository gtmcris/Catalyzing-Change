import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userhomepage/widgets/user_details.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  File? _image;
  String _userName = 'John Doe';
  String _userNumber = '1234567890';
  String _userEmail = 'john.doe@example.com';

  Future<void> _selectProfileImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: _selectProfileImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child:
                      _image == null ? Icon(Icons.add_a_photo, size: 40) : null,
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                title: Text('Name: $_userName'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Number: $_userNumber'),
                    Text('Email: $_userEmail'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Navigate to edit profile page
                    // You can implement navigation logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(
                          currentName: _userName,
                          currentNumber: _userNumber,
                          currentEmail: _userEmail,
                        ),
                      ),
                    ).then((updatedData) {
                      if (updatedData != null) {
                        setState(() {
                          _userName = updatedData['name'];
                          _userNumber = updatedData['number'];
                          _userEmail = updatedData['email'];
                        });
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to preferences page
                    // You can implement navigation logic here
                  },
                  icon: Icon(Icons.settings),
                  label: Text('Preferences'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to notifications page
                    // You can implement navigation logic here
                  },
                  icon: Icon(Icons.notifications),
                  label: Text('Notifications'),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
