import 'package:flutter/material.dart';
import 'courses_page.dart'; // Import the CoursesPage
import 'quiz_page.dart'; // Import the QuizPage
import 'memory_game_page.dart'; // Import the MemoryGamePage
import 'activities_page.dart'; // Import the ActivitiesPage
// Import the ProfilePage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildNavigationButton(
              context,
              icon: Icons.school,
              label: 'Courses',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CoursesPage()));
              },
            ),
            SizedBox(height: 20),
            _buildNavigationButton(
              context,
              icon: Icons.quiz,
              label: 'Quiz',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizPage()));
              },
            ),
            SizedBox(height: 20),
            _buildNavigationButton(
              context,
              icon: Icons.work,
              label: 'Reports',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivitiesPage()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildNavigationButton(
              context,
              icon: Icons.games,
              label: 'Memory Game',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MemoryGamePage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context,
      {required IconData icon,
      required String label,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border:
                Border.all(color: Color.fromARGB(255, 186, 11, 230), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Color.fromARGB(255, 151, 38, 217)),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 133, 12, 173),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

MemoryGamePage() {}

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'InteractX',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Montserrat',
        ),
      ),
      backgroundColor: Color.fromARGB(255, 151, 38, 217),
      leading: IconButton(
        icon: Icon(Icons.dashboard, color: Colors.white),
        onPressed: () {
          // Handle the dashboard button press
          // You can navigate to a different screen here if necessary
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Add logic to navigate to settings page if necessary
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Wrap in SingleChildScrollView to prevent overflow
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'assets/s.png'), // Replace with a suitable profile image asset
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Age: 10',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Autism Level: Mild',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 16),
            Text(
              'Profile Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('School: ABC Elementary'),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite Activity: Drawing'),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('City: New York'),
            ),
            ListTile(
              leading: Icon(Icons.sports_soccer),
              title: Text('Hobbies: Playing with puzzles, Swimming'),
            ),
            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 16),
            Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                // Add logic to navigate to change password page
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification Settings'),
              onTap: () {
                // Add logic to navigate to notification settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Theme'),
              onTap: () {
                // Add logic to navigate to theme settings page (light/dark mode)
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language Preferences'),
              onTap: () {
                // Add logic to navigate to language selection page
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account Management'),
              onTap: () {
                // Add logic to navigate to account settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Privacy Settings'),
              onTap: () {
                // Add logic to navigate to privacy settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help & Support'),
              onTap: () {
                // Add logic to navigate to help page
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                // Add logic to log the user out
              },
            ),
          ],
        ),
      ),
    );
  }
}
