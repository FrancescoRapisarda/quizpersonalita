import 'package:flutter/material.dart';

import 'package:proj01rfcs/quiz.dart';
import 'package:proj01rfcs/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _question = const [
    {
      'questionText': 'Il tuo colore preferito?',
      'answers': [
        {'text': 'Viola', 'score': 10},
        {'text': 'Rosso', 'score': 6},
        {'text': 'Giallo', 'score': 4},
        {'text': 'Verde', 'score': 1},
      ],
    },
    {
      'questionText': 'Il tuo animale preferito?',
      'answers': [
        {'text': 'Coccodrillo', 'score': 10},
        {'text': 'Pipistrello', 'score': 6},
        {'text': 'Elefante', 'score': 4},
        {'text': 'Leone', 'score': 1},
      ],
    },
    {
      'questionText': 'Il tuo cantante preferito?',
      'answers': [
        {'text': 'Laura Pausini', 'score': 10},
        {'text': 'Max Pezzali', 'score': 6},
        {'text': 'Gianni Morandi', 'score': 4},
        {'text': 'Noemi', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _question.length) {
      print('We have more questions!');
    } else {
      print('We have not more question!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _question,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
