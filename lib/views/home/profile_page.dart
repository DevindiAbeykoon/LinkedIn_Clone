import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linked_in/views/auth/login_page.dart'; // Ensure you have Firebase Auth imported

class ProfilePage extends StatelessWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bpic.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: Icon(Icons.logout, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/profilepic.jpg'), // Replace with your asset image path
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            Center(
              child: Column(
                children: [
                  Text(
                    username, // Display dynamic username
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Freelance iOS Developer | UIKit | SwiftUI',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'LEAN TRANSITION SOLUTIONS - LTS',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '4,413',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text('Followers'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '500+',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text('Connections'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 1),
            ListTile(
              leading: Icon(Icons.work, color: Colors.blue),
              title: Text('Open to work'),
              subtitle: Text('iOS Developer roles'),
              trailing: Icon(Icons.edit, color: Colors.grey),
            ),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Dashboard',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _dashboardTile('111', 'Who viewed\nyour profile'),
                      _dashboardTile('500', 'Post Views'),
                      _dashboardTile('85', 'Search\nappearances'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardTile(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign out the user
      Navigator.pushReplacementNamed(
          context, '/login'); // Navigate to login page
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: ${e.toString()}')),
      );
    }
  }
}
