import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/score/score.dart';


class QuestionControl extends GetxController
  with SingleGetTickerProviderMixin{

  // animation the progress bar
  AnimationController _animationController;
  Animation _animation;
  //to acces the animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data.map((question) => Question
      (
        id: question['id'],
        question: question['question'],
        options: question['options'],
        answer: question ['answer_index']
      
      )).toList();
  List<Question> get questions => this._questions;
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;
  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numberOfCorrectAns = 0;
  int get numberOfCorrectAns => this._numberOfCorrectAns;


  //call immediately after is allocated memory 
  @override
  void onInit() {
    _animationController = AnimationController(duration: Duration(seconds: 10),vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
    ..addListener(() 
    {
      // just like set state 
      update();
     }
    );
    // starts the animation
    //if 20 sec completed go to next question
    _animationController.forward( ).whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }
  @override
  void onClose(){
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }


  void checkAns(Question question, int selectedIndex){
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
// to stop counter
    if(_correctAns == _selectedAns)   _numberOfCorrectAns++;
    _animationController.stop();
    update();
    //delay to go to next next question qfter attempting
    Future.delayed(Duration(seconds: 3),(){
     nextQuestion();
    });

  }
  void nextQuestion(){
    if (_questionNumber.value != _questions.length){
         _isAnswered = false;
      _pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);
      //to reset conter
      _animationController.reset();
      // start it again
      //if timer finishes go to next q 
      _animationController.forward().whenComplete(nextQuestion);

    }
    //simple navigation using get package
    else{Get.to(ScoreScreen());}
    
  }
  void updateTheQnNum(int index){
    _questionNumber.value = index+1;
  }

}