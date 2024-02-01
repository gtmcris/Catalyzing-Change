import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Catalyzing Change',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          Text(
            'Add necessary app details here.',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
