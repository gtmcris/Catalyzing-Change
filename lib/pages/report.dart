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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 21, 24, 29),
      ),
      body: Container(
        color: Color.fromARGB(255, 21, 24, 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Issues related to waste collection',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  ..._getWasteCollectionIssues(),
                  const SizedBox(height: 32),
                  Text(
                    'Issues in the neighbourhood',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
                        style: TextStyle(color: Color.fromARGB(255, 23, 0, 88)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
          activeColor: Color.fromARGB(255, 42, 3, 150),
          checkColor: Color.fromARGB(255, 255, 255, 255),
          side: BorderSide(color: Colors.grey),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        Expanded(
          child: Text(
            issue,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.white),
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
