import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final bool isCorrect = data['userAnswer'] == data['answer'];
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: isCorrect ? Colors.lightBlue : Colors.pink,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    ((data['questionIndex'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['userAnswer'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        data['answer'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            );
          }).toList(),
        ),
      ),
    );
  }
}
