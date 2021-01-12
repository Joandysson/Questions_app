import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int note;
  final void Function() restartQuiz;

  Result(this.note, this.restartQuiz);

  String get phraseResult {
    if (note < 8) {
      return 'Parabéns';
    }
    if (note < 12) {
      return 'Você é bom!';
    }
    if (note < 16) {
      return 'Impressionante!';
    } else {
      return 'Nivel Jedai!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            phraseResult,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 20),
          ),
          textColor: Colors.blue,
          onPressed: restartQuiz,
        )
      ],
    );
  }
}
