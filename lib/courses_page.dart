import 'package:flutter/material.dart';
import 'app_bar.dart'; // Custom AppBar file

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> with TickerProviderStateMixin {
  int _currentLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithGradient(title: 'Courses', showBackButton: true), // Custom AppBar
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'), // Add your image path here
                  fit: BoxFit.cover, // Make sure the image covers the whole background
                ),
              ),
            ),
          ),
          // Semi-transparent overlay to dim the background image
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.0), // Adjust the opacity to dim the background
            ),
          ),
          // Your scrollable content with a semi-transparent background
          SingleChildScrollView( // Vertical scroll
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0), // Padding inside content container
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 60, 58, 58).withOpacity(1.0), // Semi-transparent background for content
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                    crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                    children: [
                      SizedBox(height: 50), // Space before Start point
                      _buildStartEndPoint(isStart: true),
                      SizedBox(height: 20), // Space between Start point and path
                      _buildVerticalPath(isCompleted: _currentLevel >= 0),
                      SizedBox(height: 30),

                      // Level 1: Traffic Light
                      _buildLevelTile(
                        context,
                        icon: Icons.traffic,
                        label: 'Traffic Light',
                        levelIndex: 0,
                      ),
                      _buildVerticalPath(isCompleted: _currentLevel > 0),
                      SizedBox(height: 30),

                      // Level 2: Bus
                      _buildLevelTile(
                        context,
                        icon: Icons.directions_bus,
                        label: 'Bus',
                        levelIndex: 1,
                      ),
                      _buildVerticalPath(isCompleted: _currentLevel > 1),
                      SizedBox(height: 30),

                      // Level 3: Classroom
                      _buildLevelTile(
                        context,
                        icon: Icons.class_,
                        label: 'Classroom',
                        levelIndex: 2,
                      ),
                      SizedBox(height: 30),

                      _buildStartEndPoint(isStart: false),
                      SizedBox(height: 50), // Extra space at the bottom after End point
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalPath({required bool isCompleted}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500), // Duration of animation
      width: 10, // Thin Path width
      height: 80, // Reduced Path height
      decoration: BoxDecoration(
        color: isCompleted ? Color.fromARGB(171, 193, 35, 241) : Colors.grey[300], // Path color (red if completed, grey otherwise)
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            spreadRadius: 2.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
    );
  }

  Widget _buildStartEndPoint({required bool isStart}) {
    return Column(
      children: [
        Container(
          width: 80, // Adjust size as needed
          height: 80, // Adjust size as needed
          decoration: BoxDecoration(
            color: isStart ? Colors.green : Colors.red,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                spreadRadius: 2.0,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              isStart ? Icons.play_circle_fill : Icons.flag,
              size: 60,
              color: Colors.white, // White icon color for contrast
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          isStart ? 'Start' : 'End',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isStart ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _buildLevelTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int levelIndex,
  }) {
    String status;
    Color borderColor;
    Color statusColor;

    if (levelIndex < _currentLevel) {
      status = 'Completed';
      borderColor = Colors.green; // Green border for completed
      statusColor = Colors.green; // Green text for completed
    } else if (levelIndex == _currentLevel) {
      status = 'In Progress';
      borderColor = Colors.yellow; // Yellow border for in-progress
      statusColor = Colors.yellow; // Yellow text for in-progress
    } else {
      status = 'Next';
      borderColor = Colors.grey; // Grey border for not started
      statusColor = Colors.grey; // Grey text for not started
    }

    bool isUnlocked = levelIndex <= _currentLevel;

    return GestureDetector(
      onTap: isUnlocked
          ? () {
              _showLevelPopup(context, label, status);
              setState(() {
                if (levelIndex == _currentLevel) {
                  _currentLevel = levelIndex + 1; // Progress to next level
                }
              });
            }
          : null, // Disable tap if not unlocked
      child: Opacity(
        opacity: isUnlocked ? 1.0 : 0.5, // Lock opacity if not unlocked
        child: Container(
          width: 140, // Reduced width
          height: 120, // Reduced height
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white, // Inside color
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2, // Border width
              color: borderColor, // Border color based on level status
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                spreadRadius: 2.0,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center contents vertically
            children: [
              Icon(icon, size: 36, color: isUnlocked ? Colors.grey : Colors.grey[400]),
              SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isUnlocked ? Colors.black : Colors.grey[600],
                ),
              ),
              SizedBox(height: 8),
              Text(
                status,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: statusColor, // Status text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLevelPopup(BuildContext context, String label, String status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$label Info'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Status: $status'),
              SizedBox(height: 20),
              Icon(
                Icons.info_outline,
                size: 50,
                color: Colors.blue,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}