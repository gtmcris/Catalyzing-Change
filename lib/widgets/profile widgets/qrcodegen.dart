import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QRCodeGen extends StatefulWidget {
  final String phoneNumber;

  const QRCodeGen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<QRCodeGen> createState() => _QRCodeGenState();
}

class _QRCodeGenState extends State<QRCodeGen> {
  String? qrData;
  bool isQRDisplayed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isQRDisplayed = !isQRDisplayed;
              });
            },
            icon: const Icon(
              Icons.qr_code_scanner,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Use the phone number passed from user_details page
            Text(
              'QR Code for Phone Number: ${widget.phoneNumber}',
              style: TextStyle(fontSize: 16.0),
            ),
            // Display QR code for the phone number when isQRDisplayed is true
            if (isQRDisplayed && widget.phoneNumber.isNotEmpty)
              PrettyQrView.data(data: widget.phoneNumber),
          ],
        ),
      ),
    );
  }
}
