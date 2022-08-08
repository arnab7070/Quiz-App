// ignore_for_file: avoid_print, use_key_in_widget_constructors, prefer_const_constructors, unused_import, unused_element, prefer_const_literals_to_create_immutables

import 'package:app/quiz.dart';
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> questions = [
      {
        'questionText': 'What\'s your current year?',
        'answers': ['1st', '2nd', '3rd', '4th'],
      },
      {
        'questionText': 'What\'s your stream',
        'answers': ['CSE', 'CSBS', 'ECE', 'ME'],
      },
      {
        'questionText': 'What programming language do you prefer?',
        'answers': ['C', 'C++', 'Python', 'Java'],
      },
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('General Info'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Thanks for using my app',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Start the quiz again?',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                      onPressed: reset,
                      color: Colors.deepOrangeAccent,
                      child: Text('Restart'))
                ],
              ),
      ),
    );
  }

  void reset() {
    setState(() {
      _questionIndex = 0;
    });
  }
}
