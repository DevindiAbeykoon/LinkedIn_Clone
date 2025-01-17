import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:linked_in/views/home/profile_page.dart';
import 'package:provider/provider.dart';
import 'viewmodels/user_viewmodel.dart';
import 'views/auth/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyDQH_aD0OwsF0LWjwluQbsWF6femOA5Tmc',
    appId: '1:168454343427:android:be8370a4fbfe2951013736',
    messagingSenderId: '168454343427',
    projectId: 'linkedin-84353',
    storageBucket: 'linkedin-84353.firebasestorage.app',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: '/',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(17, 104, 192, 1),
          ),
          useMaterial3: true,
        ),
        home: SignupPage(),
      ),
    );
  }
}
