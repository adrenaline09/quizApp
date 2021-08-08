import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/questions_control.dart';
import 'package:quiz_app/models/Questions.dart';
import '../../../constants.dart';
import 'options.dart';


class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key, 
    @required this.question,
  }) : super(key: key);
  final Question question;
   
  @override
  Widget build(BuildContext context) {
    QuestionControl _control = Get.put(QuestionControl());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
    ),
    child: Column(
      children: [
      Text(
      question.question,
      style: Theme.of(context).textTheme.headline6.copyWith(color: kBlackColor),),
      SizedBox(height: kDefaultPadding),
      ...List.generate(question.options.length, (index) => Options(index: index,text: question.options[index],
      press: () => _control.checkAns(question, index),
      ),
      ),
    ],),
    );
  }
}