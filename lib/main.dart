import 'package:flutter/material.dart';
import 'package:project_questions/quiz.dart';
import 'package:project_questions/result.dart';

main() => runApp(new QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _quetionSelected = 0;
  var _totalNote = 0;
  final List<Map<String, Object>> _questions = [
    {
      'text': 'Qual é a sua cor faforita?',
      'answer': [
        {'text': 'Preto', 'note': 10},
        {'text': 'Vermelho', 'note': 6},
        {'text': 'Verde', 'note': 7},
        {'text': 'Branco', 'note': 5},
      ]
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answer': [
        {'text': 'Coelho', 'note': 2},
        {'text': 'Cabra', 'note': 8},
        {'text': 'Elefante', 'note': 6},
        {'text': 'Leão', 'note': 10},
      ]
    },
    {
      'text': 'Qual é o seu instrutor favorito?',
      'answer': [
        {'text': 'Maria', 'note': 3},
        {'text': 'João', 'note': 1},
        {'text': 'Leo', 'note': 0},
        {'text': 'Pedro', 'note': 10},
      ]
    },
  ];

  void _answer(note) {
    if (hasQuestionSelected) {
      setState(() {
        _quetionSelected++;
        _totalNote += note;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _quetionSelected = 0;
      _totalNote = 0;
    });
  }

  bool get hasQuestionSelected {
    return _quetionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: hasQuestionSelected
            ? Quiz(
                questions: _questions,
                quetionSelected: _quetionSelected,
                answer: _answer,
              )
            : Result(_totalNote, _restartQuiz),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
