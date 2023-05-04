import 'package:flutter/material.dart';
import 'package:proj_3/data/questions.dart';
import 'package:proj_3/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    Key? key,
    required this.onSelectedAnswer,
  }) : super(key: key);

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionIndex];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentQuestions.questionImage,
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...currentQuestions
                    .getShuffledAnswers()
                    .map((answer) => AnswerButton(answerText: answer, onTap: (){answerQuestion(answer);})),
              ],
            ),
            // Column(
            //   children: [
            //     AnswerButton(questions[0].textAnswers[0], () => null),
            //
            //     AnswerButton(questions[0].textAnswers[1], () => null),
            //
            //     AnswerButton(questions[0].textAnswers[2], () => null),
            //
            //     AnswerButton(questions[0].textAnswers[3], () => null),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
