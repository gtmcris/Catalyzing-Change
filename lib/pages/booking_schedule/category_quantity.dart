import 'package:flutter/material.dart';
import 'package:userhomepage/pages/booking_schedule/date_schedule.dart';
import 'package:userhomepage/pages/schedule.dart';

class CategoryQuantity extends StatefulWidget {
  final Map<String, List<String>> selectedCategories;

  const CategoryQuantity({required this.selectedCategories});

  @override
  _CategoryQuantityState createState() => _CategoryQuantityState();
}

class _CategoryQuantityState extends State<CategoryQuantity> {
  Set<String> selectedSubcategories = {};

  Map<String, List<String>> subcategories = {
    'Bio Waste': ['coconut shells', 'Mixed food waste', 'milk cover', 'misc'],
    'Plastic': ['Hard plastic', 'PVC', 'Soft plastic'],
    'Degradable': ['paper', 'food scraps', 'leaves'],
    'Hazardous': ['batteries', 'chemicals', 'paint cans'],
    // Add more categories and their subcategories as needed
  };

  void handleSubcategorySelection(String subcategory) {
    setState(() {
      if (selectedSubcategories.contains(subcategory)) {
        selectedSubcategories.remove(subcategory);
      } else {
        selectedSubcategories.add(subcategory);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Waste Subcategories'),
      ),
      body: ListView(
        children: widget.selectedCategories.entries.map((entry) {
          String category = entry.key;
          List<String> subcategoryList = subcategories[category] ?? [];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: subcategoryList.map((subcategory) {
                  return CheckboxListTile(
                    title: Text(subcategory),
                    value: selectedSubcategories.contains(subcategory),
                    onChanged: (value) {
                      handleSubcategorySelection(subcategory);
                    },
                  );
                }).toList(),
              ),
            ],
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print(selectedSubcategories);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DatePickerPage(
                selectedCategories: selectedSubcategories.toSet(),
              ),
            ),
          );
        },
        label: Text('Continue'),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}
