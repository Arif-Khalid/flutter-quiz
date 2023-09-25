import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.onRestart, {super.key});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; ++i) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].text,
        'answer': questions[i].answers[0],
        'userAnswer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData = getSummaryData();
    final int numTotalQuestions = chosenAnswers.length;
    final int numCorrectQuestions = summaryData
        .where((data) => data['userAnswer'] == data['answer'])
        .length;
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz')),
        ],
      ),
    );
  }
}
