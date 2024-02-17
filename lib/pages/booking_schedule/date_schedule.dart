import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends StatefulWidget {
  final Set<String> selectedCategories;
  final Map<String, List<String>> subCategoriesMap = {
    'Bio Waste': ['coconut shells', 'Mixed food waste', 'milk cover', 'misc'],
    'Plastic': ['Hard plastic', 'PVC', 'Soft plastic'],
    'Degradable': ['paper', 'food scraps', 'leaves'],
    'Hazardous': ['batteries', 'chemicals', 'paint cans'],
    // ... add more categories and subcategories as needed
  };

  DatePickerPage({required this.selectedCategories});

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Select Date'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("The waste Categories:"),
              // Structure the displayed categories and subcategories
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.selectedCategories.map((subcategory) {
                  final category = widget.subCategoriesMap[subcategory];
                  print(category);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getCategoryForSubcategory(
                            subcategory, widget.subCategoriesMap),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("- $subcategory"),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  // ... (date picker logic remains the same)
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                  );

                  if (pickedDate != null && pickedDate != _selectedDate) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: Text('Select Date'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getCategoryForSubcategory(
      String subcategory, Map<String, List<String>> subCategoriesMap) {
    // Find the category the subcategory belongs to
    for (final category in subCategoriesMap.keys) {
      if (subCategoriesMap[category]!.contains(subcategory)) {
        return category;
      }
    }

    // Handle cases where the subcategory isn't found in the map
    return 'Unknown Category';
  }
}
