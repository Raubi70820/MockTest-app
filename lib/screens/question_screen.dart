import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dart/const/const.dart';
import 'package:test_dart/screens/resultscreen.dart';
import '../providers/question_provider.dart';

class QuestionsScreen extends StatelessWidget {
  // List of colors for options

  final String subjectId;

  QuestionsScreen({super.key, required this.subjectId});

  final List<Color> optionColors = [
    AppColors.blue1,
    AppColors.orange,
    AppColors.purpelAccent,
    AppColors.background1
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<QuestionProvider>(context, listen: false)
        .loadQuestions(subjectId);
    PageController pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 20,
            )),
      ),
      backgroundColor: AppColors.purpelAccent,
      body: Consumer<QuestionProvider>(
        builder: (context, provider, child) {
          if (provider.questions.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return PageView.builder(
            controller: pageController,
            itemCount: provider.questions.length,
            physics: NeverScrollableScrollPhysics(), // Prevent manual swipe
            itemBuilder: (context, index) {
              var currentQuestion = provider.questions[index];

              return Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Question ${provider.currentIndex + 1}: ${currentQuestion['question']}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Map options with rounded corners for Card widget
                    // ...currentQuestion['options'].map<Widget>((option)
                    ...currentQuestion['options']
                        .asMap()
                        .entries
                        .map<Widget>((entry) {
                      // Determine color based on user selection
                      // Color optionColor = Colors.white;
                      // if (provider.selectedAnswer != null) {
                      //   if (option == currentQuestion['correctAnswer']) {
                      //     optionColor = Colors.green;
                      //   } else if (option == provider.selectedAnswer) {
                      //     optionColor = Colors.red;
                      //   }
                      // }
                      int optionIndex = entry.key;
                      String option = entry.value;

                      // Set default color for each option
                      Color optionColor =
                          optionColors[optionIndex % optionColors.length];

                      // Override colors based on user selection and correctness
                      if (provider.selectedAnswer != null) {
                        if (option == currentQuestion['correctAnswer']) {
                          optionColor = AppColors.green; // Correct answer color
                        } else if (option == provider.selectedAnswer) {
                          optionColor = AppColors.red1;
                        }
                      }

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Text(
                            option,
                            style: TextStyle(color: Colors.white),
                          ),
                          tileColor: optionColor,
                          onTap: provider.selectedAnswer == null
                              ? () {
                                  provider.submitAnswer(option, context);

                                  // Move to next question if not last question
                                  if (provider.currentIndex <
                                      provider.questions.length - 1) {
                                    Future.delayed(
                                      Duration(milliseconds: 500),
                                      () {
                                        pageController.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                    );
                                  } else {
                                    // Show results if last question
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResultScreen(),
                                      ),
                                    );
                                  }
                                }
                              : null,
                        ),
                      );
                    }).toList(),
                    ElevatedButton(
                      onPressed: () {
                        provider.resetQuiz();
                        Navigator.pop(context); // Go back to subject screen
                      },
                      child: Text('Restart Quiz'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
