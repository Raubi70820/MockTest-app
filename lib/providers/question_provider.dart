import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class QuestionProvider with ChangeNotifier {
  List<Map<String, dynamic>> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedAnswer;

  List<Map<String, dynamic>> get questions => _questions;
  int get currentIndex => _currentIndex;
  int get score => _score;
  String? get selectedAnswer => _selectedAnswer;

  // Load questions from Firestore
  Future<void> loadQuestions(String subjectId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('subjects/$subjectId/questions')
        .get();

    _questions = snapshot.docs.map((doc) {
      List<dynamic> options = List<dynamic>.from(doc['options']);
      String correctAnswer = doc['answer'];

      // Combine options and shuffle
      List<String> allOptions = List<String>.from(options)..add(correctAnswer);
      allOptions.shuffle(Random());

      return {
        'question': doc['question'],
        'options': allOptions,
        'correctAnswer': correctAnswer,
      };
    }).toList();

    notifyListeners();
  }

  // Submit answer and highlight the correct or wrong answer
  void submitAnswer(String selectedAnswer, BuildContext context) {
    _selectedAnswer = selectedAnswer;

    // Check if the answer is correct
    if (selectedAnswer == _questions[_currentIndex]['correctAnswer']) {
      _score++;
    }

    notifyListeners();

    // Wait before navigating to the next question
    Future.delayed(Duration(seconds: 1), () {
      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
        _selectedAnswer = null;
        notifyListeners();
      } else {
        Navigator.pushReplacementNamed(context, '/result');
      }
    });
  }
  void updateCurrentIndex(int index) {
  _currentIndex = index;
  
  notifyListeners();
}


  // Reset quiz state for retake
  void resetQuiz() {
    _currentIndex = 0;
    _score = 0;
    _questions.clear();
    _selectedAnswer = null;
    notifyListeners();
  }
}
