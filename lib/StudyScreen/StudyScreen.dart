
import 'package:flutter/material.dart';

import 'package:test_dart/StudyScreen/Rcorded_lecture.dart';
import 'package:test_dart/StudyScreen/articles_screen.dart';
import 'package:test_dart/StudyScreen/books_screen.dart';
import 'package:test_dart/StudyScreen/previous%20_year_question.dart';

class Studyscreen extends StatefulWidget {
  const Studyscreen({super.key});

  @override
  State<Studyscreen> createState() => _StudyscreenState();
}

class _StudyscreenState extends State<Studyscreen> {
  // List of button details
  final List<Map<String, dynamic>> studyItems = [
    {'color': Colors.amber, 'text': 'Maths', 'image': 'assets/maths.png', 'screen': ArticlesScreen()},
    {'color': Colors.blue, 'text': 'Science', 'image': 'assets/science.png', 'screen': BooksScreen()},
    {'color': Colors.red, 'text': 'History', 'image': 'assets/history.png', 'screen': RecordedLecture()},
    {'color': Colors.green, 'text': 'Polity', 'image': 'assets/polity.png', 'screen': PreviousYearQuestion()},
    {'color': Colors.blueGrey, 'text': 'English', 'image': 'assets/english.png', 'screen': BooksScreen()},
    {'color': Colors.greenAccent, 'text': 'Geography', 'image': 'assets/maths.png', 'screen': BooksScreen()},
    {'color': Colors.orange, 'text': 'Economics', 'image': 'assets/maths.png', 'screen': BooksScreen()},
    {'color': Colors.purple, 'text': 'Computer', 'image': 'assets/studying.png', 'screen': BooksScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Screen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: studyItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two buttons per row
            crossAxisSpacing: 16, // Horizontal spacing
            mainAxisSpacing: 16, // Vertical spacing
            childAspectRatio: 1, // Square shape
          ),
          itemBuilder: (context, index) {
            final item = studyItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['screen']),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 2),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item['image'], width: 60, height: 60), // Image
                    SizedBox(height: 8),
                    Text(
                      item['text'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
