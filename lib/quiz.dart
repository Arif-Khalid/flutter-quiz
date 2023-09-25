import 'package:flutter/material.dart';
import 'package:adv_basics/gradient_container.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  String activeScreen = 'start-screen';

  void switchScreen(String screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      switchScreen('results-screen');
    }
  }

  void restart() {
    selectedAnswers.clear();
    switchScreen('start-screen');
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;
    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(() {
        switchScreen('questions-screen');
      });
    } else if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswer);
    } else {
      screenWidget = ResultsScreen(selectedAnswers, restart);
    }

    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          startColor: Colors.deepPurple,
          endColor: Colors.purple,
          child: screenWidget,
        ),
      ),
    );
  }
}
