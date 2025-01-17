// import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dart/const/Loginsignpage/splash_screen.dart';
import 'package:test_dart/providers/Auth_provider.dart';


import 'package:test_dart/providers/question_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
 
        );
         runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuestionProvider()),
         ChangeNotifierProvider(create: (context) => AuthProvider()),

        
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          color: const Color.fromARGB(255, 255, 5, 238),
          home: SplashScreenWithSound()

       
          ),
    );
  }
}
