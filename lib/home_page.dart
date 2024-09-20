// TODO Implement this library.
import 'package:flutter/material.dart';
import 'page1.dart'; // Import the login page

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to"), // Title text
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Info button functionality
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.language),
          onPressed: () {
            // When the leading button is pressed, navigate to the login page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to Login Page
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Section
            Image.asset(
              'assets/logo.png',  // Make sure the logo image exists
              height: 150, // Increase height
              width: 150,  // Increase width
            ),
            SizedBox(height: 20),

            // Tagline with multi-color effect
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple],
                tileMode: TileMode.mirror,
              ).createShader(bounds),
              child: Text(
                'Unlocking Potential through Virtual Worlds',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,  // Color set to white for the ShaderMask to apply colors
                ),
              ),
            ),

            SizedBox(height: 50),

            // Start Button (Navigates to Login Page)
            ElevatedButton(
              onPressed: () {
                // Start button action (navigate to login page)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to the login page
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                shape: CircleBorder(), // Circular button
              ),
              child: Icon(
                Icons.play_arrow,
                size: 20, // Play icon size
                color: Colors.purple, // Play icon color
              ),
            ),
          ],
        ),
      ),
    );
  }
}