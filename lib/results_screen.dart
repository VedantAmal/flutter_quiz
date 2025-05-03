import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget
{
  const ResultsScreen(this.chosenAnswers,this.onRestart, {super.key});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String,Object>> getSummaryData() 
  {
    final List<Map<String,Object>> summary=[];
    for(var i=0; i<chosenAnswers.length; i++)
    {
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context)
  {
    final summaryData=getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return 
    SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!', 
            style: TextStyle(color: Colors.white, fontSize: 20),),
            SizedBox(height: 30),
            QuestionsSummary(getSummaryData()),
            SizedBox(height: 30),
            TextButton.icon(onPressed: onRestart, 
            icon: const Icon(Icons.refresh),
            label: Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}