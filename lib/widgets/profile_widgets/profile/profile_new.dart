import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userhomepage/widgets/user_details.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  File? _image;
  late Map<String, dynamic> addressItem;
  String _userName = '';
  String _userNumber = '';
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUserDetails(); // Load user details when the widget is initialized
    _loadProfileImage(); // Load profile image when the widget is initialized
  }

  Future<void> _selectProfileImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _saveProfileImage(pickedFile.path); // Save the selected profile image
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white), // Adjust styles as needed
          // ... other text styles
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'User Profile',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 21, 24, 29),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 21, 24, 29),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _selectProfileImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(255, 241, 246, 251),
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(
                            Icons.add_a_photo,
                            size: 40,
                            color: Color.fromARGB(255, 19, 11, 61),
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: Color.fromARGB(255, 241, 246, 251),
                child: ListTile(
                  title: Text(
                    'Name: $_userName',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 19, 11, 61),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Number: $_userNumber',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Color.fromARGB(255, 19, 11, 61),
                        ),
                      ),
                      Text(
                        'Email: $_userEmail',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Color.fromARGB(255, 19, 11, 61),
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 19, 11, 61),
                    ),
                    onPressed: () {
                      // Navigate to edit profile page
                      // You can implement navigation logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrgDetails(
                            setProfileItem: setProfileItem,
                            profileItem: {
                              'name': _userName,
                              'number': _userNumber,
                              'email': _userEmail,
                            }, // Provide the user details
                          ),
                        ),
                      ).then((updatedData) {
                        if (updatedData != null) {
                          setState(() {
                            _userName = updatedData['name'] ?? '';
                            _userNumber = updatedData['number'] ?? '';
                            _userEmail = updatedData['email'] ?? '';
                            _saveUserDetails(); // Save updated user details
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 241, 246, 251),
                      ),
                    ),
                    icon: Icon(Icons.settings,
                        color: Color.fromARGB(255, 19, 11, 61)),
                    label: Text('Preferences',
                        style: TextStyle(
                          color: Color.fromARGB(255, 19, 11, 61),
                        )),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to notifications page
                      // You can implement navigation logic here
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 241, 246, 251),
                      ),
                    ),
                    icon: Icon(Icons.notifications,
                        color: Color.fromARGB(255, 19, 11, 61)),
                    label: Text('Notifications',
                        style: TextStyle(
                          color: Color.fromARGB(255, 19, 11, 61),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void setProfileItem(Map<String, dynamic> item) {
    addressItem = item;
  }

  Future<void> _loadUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _userNumber = prefs.getString('userNumber') ?? '';
      _userEmail = prefs.getString('userEmail') ?? '';
    });
  }

  Future<void> _saveUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', _userName);
    prefs.setString('userNumber', _userNumber);
    prefs.setString('userEmail', _userEmail);
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profileImagePath');
    setState(() {
      _image = imagePath != null ? File(imagePath) : null;
    });
  }

  Future<void> _saveProfileImage(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('profileImagePath', imagePath);
  }
}
