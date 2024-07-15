import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiztale/routes/routes.dart';
import 'package:quiztale/screens/welcome_screen.dart';
import '../data/question_model.dart';

class QuestionController extends GetxController {
  String name = '';
  var nameController = TextEditingController();
  final List<QuestionModel> _questionList = [
    QuestionModel(
      id: 1,
      question: "What does a variable do?",
      answer: 2,
      options: ['Nothing', 'Stores values', 'hold an index', 'Complain'],
    ),
    QuestionModel(
      id: 2,
      question: "Best bootcamp you've attended",
      answer: 1,
      options: [
        'KodeCamp BootCamp',
        'CodeHauz BootCamp',
        'University Bootcamp',
        'None of the above'
      ],
    ),
    QuestionModel(
      id: 3,
      question: "Which is not a programming language",
      answer: 1,
      options: ['Java', 'Kotlin', 'C', 'MongoDb'],
    ),
  ];

  List<QuestionModel> get questionList => [...questionList];
  bool _isPressed = false;
  bool get isPressed => _isPressed;

  final double _numberOfQuestions = 1;
  double get numberOfQuestions => _numberOfQuestions;

  int? _selectedAnswer;
  int? get selectedAnswer => _selectedAnswer;

  int? _correctAnswer;
  int? get correctAnswer => _correctAnswer;

  int _countOfCorrectAnswers = 0;
  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  //map to check if the question has been answered
  final Map<int, bool> _questionIsAnswered = {};

  Timer? _timer;

  final maxSec = 10;
  final sec = 10.obs;

  double get scoreResult {
    return _countOfCorrectAnswers * 100 / _questionList.length;
  }

  void checkAnswer(QuestionModel questionModel, int selectedAnswer) {
    _isPressed = true;
    _selectedAnswer = selectedAnswer;
    _correctAnswer = questionModel.answer;
    if (_correctAnswer == _selectedAnswer) {
      _countOfCorrectAnswers++;
    }
    stopTimer();
    _questionIsAnswered.update(
      questionModel.id,
      (value) => true,
    );
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) => nextQuestion(),
    );
    update();
  }

  //check if the question has been answered
  bool checkIsQuesionAnswered(int questionId) {
    return _questionIsAnswered.entries
        .firstWhere(
          (element) => element.key == questionId,
        )
        .value;
  }

  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (sec.value > 0) {
          sec.value--;
        } else {
          stopTimer();
          nextQuestion();
        }
      },
    );
  }

  void resetTimer() => sec.value = maxSec;

  void stopTimer() => _timer?.cancel();

  void nextQuestion() {}

  void resetAnswer() {
    for (var element in _questionList) {
      _questionIsAnswered.addAll({element.id: false});
      update();
    }
  }

  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswer();
    _selectedAnswer = null;
    Get.offAllNamed(Routes.welcomeScreenRoute);
  }
}
