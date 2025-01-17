import 'package:flutter/material.dart';
import 'package:test_dart/StudyScreen/StudyScreen.dart';
import 'package:test_dart/const/const.dart';
// import 'package:test_dart/screens/StudyScreen.dart';
import 'package:test_dart/screens/subjects_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: Column(
          spacing: 10,
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Studyscreen()));
                    },
                    child: Expanded(
                      child: Row(spacing: 10,
                        children: [
                          CircleAvatar(radius: 25,
                          backgroundColor: AppColors.background1,
                          backgroundImage: AssetImage('assets/studying.png',)),
                          // Icon(Icons.computer),
                          // Image.asset(
                          //   'assets/studying.png',
                          //   fit: BoxFit.fill,
                          //   color: Colors.blue,
                          // ),
                          Text('Lesson to Study',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: TextButton(
                    onPressed: () {
                       Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SubjectsScreen()));
                    },
                    child: Row(
                      spacing: 10,
                      children: [
                         CircleAvatar(radius: 25,
                         backgroundColor: AppColors.red1,
                         
                          backgroundImage: AssetImage('assets/studying.png',)),
                        // Image.asset(
                        //   'assets/studying.png',
                        //   color: Colors.blue,
                        // ),
                        Text('Start Mock Test' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
