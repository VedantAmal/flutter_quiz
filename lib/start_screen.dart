import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget
{
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context)
  {
    return 
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', 
          width: 300,
          color: const Color.fromARGB(138, 255, 255, 255),
          ),
          const SizedBox(height: 50),
          const Text('Learn Flutter the fun way!', 
          style: TextStyle(
            color: Color.fromARGB(255, 231, 224, 14),
            fontSize: 24),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(onPressed: (){
            startQuiz();
          }, 
          style: OutlinedButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 231, 224, 14),
            backgroundColor: Colors.black,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
          ),
        ],
      ),
      );
  }
}