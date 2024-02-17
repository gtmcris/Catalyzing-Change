import 'package:flutter/material.dart';
import 'package:userhomepage/widgets/order_schedule.dart';
import 'package:userhomepage/pages/booking_schedule/date_schedule.dart';
import 'package:userhomepage/pages/booking_schedule/category_quantity.dart';

const Map<String, List<String>> categories = {
  'Bio Waste': ['coconut shells', 'Mixed food waste', 'milk cover', 'misc'],
  'Plastic': ['Hard plastic', 'PVC', 'Soft plastic'],
  'Degradable': ['paper', 'food scraps', 'leaves'],
  'Hazardous': ['batteries', 'chemicals', 'paint cans'],
};

class UserSchedule extends StatefulWidget {
  const UserSchedule({Key? key}) : super(key: key);

  @override
  _UserScheduleState createState() => _UserScheduleState();
}

class _UserScheduleState extends State<UserSchedule> {
  final Map<String, bool> selectedCategories = {};

  void _handleCheckboxChange(String category, bool value) {
    setState(() {
      selectedCategories[category] = value;
    });
  }

  Map<String, List<String>> getFilteredSubcategories() {
    final filteredSubcategories = <String, List<String>>{}; // Explicitly typed
    for (final entry in selectedCategories.entries) {
      if (entry.value) {
        filteredSubcategories[entry.key] = categories[entry.key]!;
      }
    }
    return filteredSubcategories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fill the entire screen with the gradient
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 1, 0, 19), // #4F4D98
              Color.fromARGB(255, 11, 0, 40), // #6B4487
              Color.fromARGB(255, 3, 0, 49), // #5E3B76
              Color.fromARGB(255, 5, 0, 74), // #503365
              Color.fromARGB(255, 0, 1, 79),
            ],
          ),
        ),
        // Use a Column layout
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add space for the top bar if needed
            const SizedBox(height: 24.0),
            // Address button with padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                onPressed: () {}, // Navigate to Add new Address page
                child: Text(
                  '+ Add new Address',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            // Choose Waste Categories section
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose Waste Categories:',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                  for (final category in categories.keys)
                    _buildCategoryCheckbox(category, selectedCategories),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        final filteredSubcategories =
                            getFilteredSubcategories();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryQuantity(
                              selectedCategories: filteredSubcategories,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Color.fromARGB(255, 23, 0, 88),
                          ),
                          Text(
                            'Choose Schedule',
                            style: const TextStyle(
                              color: const Color.fromARGB(255, 23, 0, 88),
                            ),
                          ),
                        ],
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

  Widget _buildCategoryCheckbox(
      String category, Map<String, bool> selectedCategories) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: selectedCategories.containsKey(category), // Use containsKey
          onChanged: (value) {
            setState(() {
              if (value != null && value) {
                selectedCategories[category] = true; // Use [=] operator
              } else {
                selectedCategories.remove(category);
              }
            });
          },
          activeColor: Color.fromARGB(255, 26, 0, 153),
          checkColor: Color.fromARGB(255, 255, 255, 255),
          side: const BorderSide(color: Colors.grey),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        Text(
          category,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
