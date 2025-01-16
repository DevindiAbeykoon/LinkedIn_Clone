// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../models/post_model.dart';
// import '../../viewmodels/user_viewmodel.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home")),
//       body: Column(
//         children: [
//           // Display User Info
//           Consumer<UserViewModel>(
//             builder: (context, userViewModel, child) {
//               final currentUser = userViewModel.currentUser;
//               return Text(currentUser != null
//                   ? "Welcome, ${currentUser.email}"
//                   : "Please log in");
//             },
//           ),

//           // Display Posts
//           Consumer<PostViewModel>(
//             builder: (context, postViewModel, child) {
//               final posts = postViewModel.posts;
//               return ListView.builder(
//                 itemCount: posts.length,
//                 itemBuilder: (context, index) {
//                   final post = posts[index];
//                   return ListTile(
//                     title: Text(post.author),
//                     subtitle: Text(post.content),
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
