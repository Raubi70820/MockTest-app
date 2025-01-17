import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dart/const/const.dart';
import '../providers/question_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionProvider>(context, listen: false);
    final double percentage =
        (provider.score / provider.questions.length) * 100;
  

    return Scaffold(
      backgroundColor: AppColors.black1,
      appBar: AppBar(
        title: Text('Quiz Results'),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    color: AppColors.black1,
                    
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/5022/5022073.png',
                      height: 200,
                      width: 200,
                    )),

                // Icon(Icons.emoji_events, color: Colors.yellow, size: 100,),
                Icon(
                  percentage > 60 ? Icons.check_circle : Icons.cancel,
                  color: percentage > 60 ? AppColors.green : AppColors.red1,
                  size: 100,
                ),
                Text(
                  'Quiz Completed!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white1),
                ),
                Text(
                  percentage > 60
                      ? 'Congratulations you passed the Test! '
                      : 'Sorry You failed the Test!',
                  style: TextStyle(fontSize: 18, color: AppColors.white1),
                ),
              
                Text(
                  'Total Questions Attempt: ${provider.questions.length}',
                  style: TextStyle(fontSize: 18,color: AppColors.white1),
                ),
                Text(' Total Correct Answers:${provider.score}'
                  ,
                  style: TextStyle(
                      fontSize: 18,
                      
                      color: AppColors.white1),
                ),
                // Text( percentage.toString(),style: TextStyle(fontSize: 18,color: Colors.white),),
                Text(
                  '${percentage.toStringAsFixed(0)}%',
                  style: TextStyle(fontSize: 18, color: AppColors.white1),
                ),
                // Text(
                //   percentage>60?'Congratulations you passed the Test ':'fail',
                //   style: TextStyle(fontSize: 18,color: Colors.white),
                // ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    provider.resetQuiz();
                    Navigator.pop(context); // Go back to subject screen
                  },
                  child: Text('Restart Quiz'),
                ),
              ],
            )),
      ),
    );
  }
}
