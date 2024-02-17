import 'package:flutter/material.dart';
import 'package:userhomepage/pages/booking_schedule/date_schedule.dart';
import 'package:userhomepage/widgets/home_details.dart';
import 'package:userhomepage/widgets/view_user_details.dart';

class UserDetailsPage extends StatefulWidget {
  String fullName = '';
  String address = '';
  String emailAddress = '';
  String phoneNumber = '';
  UserDetailsPage({
    required this.fullName,
    required this.address,
    required this.emailAddress,
    required this.phoneNumber,
  });

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Primary Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              reusableAddressField(
                "Full Name",
                false,
                false,
                _fullNameController,
              ),
              const SizedBox(height: 16),
              reusableAddressField(
                "Address",
                true,
                false,
                _addressController,
              ),
              const SizedBox(height: 32),
              const Text(
                'Contact Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              reusableAddressField(
                "Email Address",
                false,
                true,
                _emailAddressController,
              ),
              const SizedBox(height: 16),
              reusableAddressField(
                "Phone",
                false,
                false,
                _phoneNumberController,
                isPhone: true,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission here
                    // Save changes
                    //callUserValue(_fullNameController.text, _addressController.text, _emailAddressController.text, _phoneNumberController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeDetails()),
                    );
                  }
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _fullNameController.dispose();
    _addressController.dispose();
    _emailAddressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}

TextFormField reusableAddressField(String text, bool isMul, bool isEmail,
    TextEditingController controller, // Pass controller for the text field
    {bool isPhone = false}) {
  return TextFormField(
    controller: controller, // Set the controller for the text field
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.deepPurple.withOpacity(0.9)),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(color: Colors.deepPurple.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPhone
        ? TextInputType.phone
        : isMul
            ? TextInputType.multiline
            : TextInputType.name,
    maxLines: isMul ? 4 : null,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a value';
      }
      if (isEmail && !(value.contains('@') && value.contains('.'))) {
        return 'Please enter a valid email';
      }
      if (isPhone && value.length != 10) {
        return 'Please enter a valid phone number';
      }
      return null;
    },
  );
}
