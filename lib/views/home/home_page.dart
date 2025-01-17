import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                // Profile Icon
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profilepic.jpg'),
                ),
                SizedBox(width: 90),
                // LinkedIn Logo
                Image.asset(
                  'assets/images/Linkedin-Logo.png',
                  width: screenWidth * 0.25,
                ),
                Spacer(),
                // Bell Icon
                IconButton(
                  icon: Icon(Icons.notifications_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.qr_code_scanner),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(height: 10),
          // Horizontal Profile Stories
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.blue,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/images/profilepic.jpg'),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "User $index",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          // Sample Post
          Expanded(
            child: ListView(
              children: [
                _buildPost(
                  profileImage: 'assets/images/profilepic.jpg',
                  name: 'Tony Antonio',
                  position: 'Android Dev at Nixa',
                  timeAgo: '1w • Edited',
                  postText:
                      'Creating opportunity for every member of the global workforce drives everything we do at Link...',
                  postImage: 'assets/images/postpic.jpg',
                  likes: '97',
                  comments: '77',
                ),
                _buildPost(
                  profileImage: 'assets/images/profilepic.jpg',
                  name: 'Sam White',
                  position: 'Software Developer at AIO Tech',
                  timeAgo: '1w',
                  postText:
                      'Internship Opportunities Available at @All in one technologies...',
                  postImage: 'assets/images/postpic2.jpg',
                  likes: '97',
                  comments: '77',
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Network',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildPost({
    required String profileImage,
    required String name,
    required String position,
    required String timeAgo,
    required String postText,
    required String postImage,
    required String likes,
    required String comments,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(profileImage),
                    radius: 20,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "$position • $timeAgo",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_horiz),
                ],
              ),
              SizedBox(height: 10),
              Text(
                postText,
                style: TextStyle(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  postImage,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined, size: 20),
                      SizedBox(width: 5),
                      Text(likes),
                    ],
                  ),
                  Row(
                    children: [
                      Text("$comments comments"),
                      SizedBox(width: 5),
                      Icon(Icons.comment_outlined, size: 20),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
