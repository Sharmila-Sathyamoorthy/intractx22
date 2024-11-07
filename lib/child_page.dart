// child_page.dart
import 'package:flutter/material.dart';
import 'page1.dart'; // Import the page1.dart file

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart'; // For formatting the date

class ChildPage extends StatefulWidget {
  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  DateTime? _birthDate;
  int? _age;
  String? _parentName;
  String? _relationship;
  String? _mobileNo;

  // Challenges list
  List<String> _challenges = ['Light', 'Bright Colors', 'Smell', 'Taste', 'Sound'];
  List<String> _selectedChallenges = [];

  // Function to open the date picker and calculate age
  void _pickBirthDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthDate = picked;
        _age = DateTime.now().year - _birthDate!.year;
        if (DateTime.now().month < _birthDate!.month ||
            (DateTime.now().month == _birthDate!.month &&
                DateTime.now().day < _birthDate!.day)) {
          _age = _age! - 1;
        }
      });
    }
  }

  // Function to open modal dialog for selecting challenges
  void _showMultiSelectChallenges() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Challenges"),
          content: SingleChildScrollView(
            child: ListBody(
              children: _challenges.map((challenge) {
                return CheckboxListTile(
                  title: Text(challenge),
                  value: _selectedChallenges.contains(challenge),
                  onChanged: (bool? selected) {
                    setState(() {
                      if (selected == true) {
                        _selectedChallenges.add(challenge);
                      } else {
                        _selectedChallenges.remove(challenge);
                      }
                    });
                    Navigator.of(context).pop();
                    _showMultiSelectChallenges(); // Reopen dialog to reflect changes
                  },
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Details', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(210, 88, 112, 228),
                Color.fromARGB(255, 195, 19, 208),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(210, 88, 112, 228),
                    Color.fromARGB(255, 195, 19, 208),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.white, size: 40),
                  SizedBox(width: 10),
                  Text(
                    'Registration Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.person, 'Username: Example', () {}),
            _buildDrawerItem(Icons.email, 'Email: example@mail.com', () {}),
            _buildDrawerItem(Icons.phone, 'Phone: 1234567890', () {}),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Other Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
            _buildDrawerItem(Icons.settings, 'Settings', () {}),
            _buildDrawerItem(Icons.help, 'Help', () {}),
            _buildDrawerItem(Icons.logout, 'Logout', () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/logo.png',
                height: 100,
                width: 100,
              ),
              SizedBox(height: 20),

              // Child Name
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Child Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Birth Date picker and age calculation
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: _birthDate == null
                            ? 'Select Birth Date'
                            : DateFormat.yMMMd().format(_birthDate!),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      onTap: () => _pickBirthDate(context),
                    ),
                  ),
                  SizedBox(width: 20),
                  if (_age != null)
                    Text(
                      'Age: $_age',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
              SizedBox(height: 20),

              // Challenges Multi-Selection
              Text(
                'Select Challenges:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: _showMultiSelectChallenges,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedChallenges.isEmpty
                              ? 'Tap to select challenges'
                              : _selectedChallenges.join(', '),
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Parent Name
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Parent Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (value) {
                  setState(() {
                    _parentName = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Relationship Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Relationship',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.people),
                ),
                value: _relationship,
                items: [
                  DropdownMenuItem(child: Text('Father'), value: 'Father'),
                  DropdownMenuItem(child: Text('Mother'), value: 'Mother'),
                  DropdownMenuItem(child: Text('Siblings'), value: 'Siblings'),
                  DropdownMenuItem(child: Text('Caretaker'), value: 'Caretaker'),
                ],
                onChanged: (value) {
                  setState(() {
                    _relationship = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Mobile No
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mobile No',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {
                    _mobileNo = value;
                  });
                },
              ),
              SizedBox(height: 30),

              // Submit button with gradient
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(210, 88, 112, 228),
                      Color.fromARGB(255, 195, 19, 208),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Submit action and navigate to Page1
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  icon: Icon(Icons.arrow_forward),
                  label: Text(
                    'SUBMIT',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
    );
  }
}