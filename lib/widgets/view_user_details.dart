// import 'package:flutter/material.dart';
// import 'package:userhomepage/widgets/edit_profile.dart';

// class ViewDetailsPage extends StatelessWidget {
//   // String fullName;
//   // String address;
//   // String emailAddress;
//   // String phoneNumber;
//   // TextEditingController _fullNameController;
//   // TextEditingController _addressController;
//   // TextEditingController _emailAddressController;
//   // TextEditingController _phoneNumberController;

//   ViewDetailsPage({
//     super.key,
//   });
//   // required this.fullName,
//   // required this.address,
//   // required this.emailAddress,
//   // required this.phoneNumber,
//   // required TextEditingController fullNameController,
//   // required TextEditingController addressController,
//   // required TextEditingController emailAddressController,
//   // required TextEditingController phoneNumberController,
//   // }); : _fullNameController = fullNameController,
//   //       _addressController = addressController,
//   //       _emailAddressController = emailAddressController,
//   //       _phoneNumberController = phoneNumberController,
//   //       super(key: const ValueKey<String>('ViewDetailsPage'));

//   callUserValue(String fullName, String address, String emailAddress,
//       String phoneNumber) {
//     this.fullName = fullName;
//     this.address = address;
//     this.emailAddress = emailAddress;
//     this.phoneNumber = phoneNumber;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('View Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(height: 16),
//             Text(
//               'Primary Details',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             ReusableAddressField(
//               "Full Name",
//               false,
//               false,
//               _fullNameController,
//               initialValue: fullName,
//             ),
//             const SizedBox(height: 16),
//             ReusableAddressField(
//               "Address",
//               true,
//               false,
//               _addressController,
//               initialValue: address,
//             ),
//             const SizedBox(height: 32),
//             Text(
//               'Contact Information',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             ReusableAddressField(
//               "Email Address",
//               false,
//               true,
//               _emailAddressController,
//               initialValue: emailAddress,
//             ),
//             const SizedBox(height: 16),
//             ReusableAddressField(
//               "Phone",
//               false,
//               false,
//               _phoneNumberController,
//               isPhone: true,
//               initialValue: phoneNumber,
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => UserDetailsPage(
//                       fullName: _fullNameController.text,
//                       address: _addressController.text,
//                       emailAddress: _emailAddressController.text,
//                       phoneNumber: _phoneNumberController.text,
//                     ),
//                   ),
//                 );
//               },
//               child: const Text('Edit Details'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// TextFormField ReusableAddressField(
//     String text, bool isMul, bool isEmail, TextEditingController controller,
//     {bool isPhone = false, String? initialValue}) {
//   return TextFormField(
//     controller: controller,
//     initialValue: initialValue, // Add this line
//     cursorColor: Colors.black,
//     style: TextStyle(color: Colors.deepPurple.withOpacity(0.9)),
//     decoration: InputDecoration(
//       labelText: text,
//       labelStyle: TextStyle(color: Colors.deepPurple.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: Colors.grey[200],
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30.0),
//         borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//       ),
//     ),
//     keyboardType: isPhone
//         ? TextInputType.phone
//         : isMul
//             ? TextInputType.multiline
//             : TextInputType.name,
//     maxLines: isMul ? 4 : null,
//     validator: (value) {
//       if (value == null || value.isEmpty) {
//         return 'Please enter a value';
//       }
//       if (isEmail && !(value.contains('@') && value.contains('.'))) {
//         return 'Please enter a valid email';
//       }
//       if (isPhone && value.length != 10) {
//         return 'Please enter a valid phone number';
//       }
//       return null;
//     },
//   );
// }
