import 'package:flutter/material.dart';

class QuizQuestion {
  const QuizQuestion(this.questionImage, this.textAnswers);
  final Image questionImage;
  final List<String> textAnswers;

  List<String> getShuffledAnswers(){
    final shuffledList = List.of(textAnswers);
    shuffledList.shuffle();
    return shuffledList;
  }
}