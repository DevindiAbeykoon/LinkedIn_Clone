import 'package:flutter/material.dart';
import '../viewmodels/post_viewmodel.dart';

class PostViewModel extends ChangeNotifier {
  final List<PostModel> _posts = [
    PostModel(
      author: "Jane Doe",
      position: "Software Engineer",
      content: "Excited to start a new journey at XYZ Corp!",
      profileImage: "assets/images/profile1.png",
    ),
    PostModel(
      author: "John Smith",
      position: "Product Manager",
      content: "Happy to announce the launch of our new app!",
      profileImage: "assets/images/profile2.png",
    ),
  ];

  List<PostModel> get posts => _posts;
}
