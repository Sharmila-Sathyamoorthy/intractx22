// register_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'child_page.dart'; // Import ChildPage

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpg'), // Adjust the path to your logo
            SizedBox(height: 20),
            _buildInputField(
                'Username', _usernameController, false, Icons.person),
            SizedBox(height: 20),
            _buildInputField('Email', _emailController, false, Icons.email),
            SizedBox(height: 20),
            _buildInputField('Password', _passwordController, true, Icons.lock),
            SizedBox(height: 20),
            _buildInputField('Confirm Password', _confirmPasswordController,
                true, Icons.lock),
            SizedBox(height: 20),
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
              child: ElevatedButton(
                onPressed: () {
                  // Perform form validation if needed

                  // Navigate to ChildPage on submit
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChildPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build input fields with borders, padding, icons, and rounded corners
  Widget _buildInputField(String label, TextEditingController controller,
      bool obscureText, IconData icon) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
