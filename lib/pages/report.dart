import 'package:flutter/material.dart';
import 'package:userhomepage/widgets/camera.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  List<String> _selectedWasteCollectionIssues = [];
  List<String> _selectedNeighbourhoodIssues = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          // Set common text color for all themes here
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          displayLarge: TextStyle(color: Colors.white),
          // ... other text styles
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Report',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 21, 24, 29),
        ),
        body: SingleChildScrollView(
          child: Container(
            // child: Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [
              //     // Use the same colors as in HomeDetails here
              //     Color.fromARGB(255, 1, 0, 19), // #4F4D98
              //     Color.fromARGB(255, 11, 0, 40), // #6B4487
              //     Color.fromARGB(255, 3, 0, 49), // #5E3B76
              //     Color.fromARGB(255, 5, 0, 74), // #503365
              //     Color.fromARGB(255, 0, 1, 79), // #6B4487
              //     // ... other colors
              //   ],
              // ),
              color: Color.fromARGB(255, 21, 24, 29),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Issues related to waste collection',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ..._getWasteCollectionIssues(),
                const SizedBox(height: 32),
                const Text(
                  'Issues in the neighbourhood',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ..._getNeighbourhoodIssues(),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CameraPage()),
                      );
                    },
                    child: Text(
                      'If any other reason',
                      style: const TextStyle(
                          color: const Color.fromARGB(255, 23, 0, 88)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getWasteCollectionIssues() {
    List<Widget> issues = [];
    for (final issue in [
      'Overflowing bins',
      'Missed collections',
      'Littering',
      'Improper waste sorting',
      'Other (please specify)',
    ]) {
      final localIssue = issue;
      issues.add(
        _buildIssueCheckbox(localIssue, _selectedWasteCollectionIssues,
            (value) {
          setState(() {
            if (value!) {
              _selectedWasteCollectionIssues.add(issue);
            } else {
              _selectedWasteCollectionIssues.remove(issue);
            }
          });
        }),
      );
    }
    return issues;
  }

  List<Widget> _getNeighbourhoodIssues() {
    List<Widget> issues = [];
    for (final issue in [
      'Illegal Waste dumping',
      'Burning harmful waste (Green House gas emitters)',
    ]) {
      final localIssue = issue;
      issues.add(
        _buildIssueCheckbox(localIssue, _selectedNeighbourhoodIssues, (value) {
          setState(() {
            if (value!) {
              _selectedNeighbourhoodIssues.add(issue);
            } else {
              _selectedNeighbourhoodIssues.remove(issue);
            }
          });
        }),
      );
    }
    return issues;
  }

  Widget _buildIssueCheckbox(
    String issue,
    List<String> selectedIssues,
    void Function(bool?) onChangeValue,
  ) {
    return Row(
      children: [
        Checkbox(
          value: selectedIssues.contains(issue),
          onChanged: onChangeValue,
          activeColor: Color.fromARGB(255, 42, 3, 150), // Color when checked
          checkColor: Color.fromARGB(255, 255, 255, 255),
          side: const BorderSide(color: Colors.grey),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        Expanded(
          child: Text(
            issue,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal), // Adjust as needed
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
