import 'package:flutter/material.dart';
import 'package:intractx22/main.dart';
import 'package:intractx22/mainpage.dart';

class AppBarWithGradient extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool
      showBackButton; // Add a flag to control the visibility of the back button

  AppBarWithGradient({required this.title, this.showBackButton = false});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Montserrat',
        ),
      ),
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(
                    context); // Pops the current route off the navigator stack
              },
            )
          : IconButton(
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
                              MaterialPageRoute(builder: (context) {
                                var homePage = HomePage();
                                return homePage;
                              }),
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

  ProfilePage() {}
}
