import 'package:flutter/material.dart';
import 'courses_page.dart'; // Import the CoursesPage
import 'activities_page.dart'; // Import the ActivitiesPage
import 'quiz_page.dart'; // Import the QuizPage
import 'memory_game_page.dart'; // Import the MemoryGamePage

class MainHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainHomePage> {
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesPage()));
              },
            ),
            SizedBox(height: 20),
            _buildNavigationButton(
              context,
              icon: Icons.quiz,
              label: 'Quiz',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
              },
            ),
            SizedBox(height: 20),
            _buildNavigationButton(
              context,
              icon: Icons.work,
              label: 'Activities',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ActivitiesPage()));
              },
            ),
            SizedBox(height: 20),
            _buildNavigationButton(
              context,
              icon: Icons.games,
              label: 'Memory Game',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MemoryGamePage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context,
      {required IconData icon, required String label, required Function() onTap}) {
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
            border: Border.all(color: Color.fromARGB(255, 186, 11, 230), width: 1),
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

ActivitiesPage() {
}

MemoryGamePage() {
}

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
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: Text('Dashboard Menu'),
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MainHomePage()),
                        (route) => false,
                      );
                    },
                    child: Text('Dashboard'),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Other Option'),
                  ),
                ],
              );
            },
          );
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.person, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(210, 88, 112, 228),
              Color.fromARGB(255, 195, 19, 208)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Page Content')),
    );
  }
}
