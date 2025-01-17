import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_dart/StudyScreen/StudyScreen.dart';
import 'package:test_dart/const/Loginsignpage/splash_screen.dart';
import 'package:test_dart/const/const.dart';
// import 'package:test_dart/screens/Learn_screen.dart';
// import 'package:test_dart/screens/StudyScreen.dart';
import 'package:test_dart/screens/profile.dart';

import 'package:test_dart/screens/question_screen.dart';

class SubjectsScreen extends StatelessWidget {
   final List subjectcolors = [
      AppColors.orange,
      AppColors.red1,
      AppColors.green,
      AppColors.orange,
      AppColors.blue1,
      AppColors.orange,
      AppColors.deepurpel,
      AppColors.orange,
  ];

  final CollectionReference subjectsCollection =
      FirebaseFirestore.instance.collection('subjects');
  SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Studyscreen()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Studyscreen()));
          } else if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          } else if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Studyscreen()));
          }
        },
        // currentIndex: _currentIndex,
        selectedItemColor: AppColors.blue1,
        unselectedItemColor: AppColors.grey,
        // onTap: _onTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: 'Videos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Account',
              backgroundColor: AppColors.blue1),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/studying.png',
                height: 30,
                width: 30,
              ),
              label: 'Study'),
        ],
      ),
      backgroundColor: AppColors.white1,

      appBar: AppBar(
          backgroundColor: AppColors.black1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreenWithSound()));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: AppColors.white1,
                  )),
              Column(
                children: [
                  Text(
                    'Hi Akash',
                    style: TextStyle(
                        color: AppColors.white1, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lets Start Mock Test',
                    style: TextStyle(fontSize: 20, color: AppColors.white1),
                  )
                ],
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.purpelAccent,
                backgroundImage: Image.asset('assets/profile image.png').image,
              )
            ],
          )),

// end of AppBar

      body: StreamBuilder<QuerySnapshot>(
        stream: subjectsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No subjects available'));
          }

          // Grid layout with fixed button sizes
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two buttons per row
                      crossAxisSpacing:
                          16, // Space between buttons horizontally
                      mainAxisSpacing: 16, // Space between buttons vertically
                      childAspectRatio: 1.5, // Aspect ratio for fixed size
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var doc = snapshot.data!.docs[index];
                      // String subjectName = doc['name'];
                      String imageUrl = doc['imageUrl'];
                      String subjectId = doc.id;
                      return Card(
                        color: subjectcolors[index],
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    QuestionsScreen(subjectId: subjectId),
                              ),
                            );
                          },
                          child:
                           Image.asset(
                            imageUrl,
                            // fit: BoxFit.fill,
                          ),
                        ),
                      );

                      // );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
