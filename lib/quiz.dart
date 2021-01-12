import 'package:flutter/cupertino.dart';
import 'package:project_questions/answer.dart';
import 'package:project_questions/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int quetionSelected;
  final void Function(int) answer;

  Quiz({
    @required this.questions,
    @required this.quetionSelected,
    @required this.answer,
  });

  bool get hasQuestionSelected {
    return quetionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasQuestionSelected ? questions[quetionSelected]['answer'] : null;

    return Column(
      children: <Widget>[
        Question(questions[quetionSelected]['text']),
        ...answers
            .map((ans) => Answer(ans['text'], () => answer(ans['note'])))
            .toList()
      ],
    );
  }
}
