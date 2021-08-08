import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/questions_control.dart';
import 'package:websafe_svg/websafe_svg.dart';


class ScoreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    QuestionControl _questionControl = Get.put(QuestionControl());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/Cornered-Stairs.svg", fit: BoxFit.fill),
          Column(
            children: [
                Spacer(flex: 3,),
                Text("Score", 
                style: Theme.of(context).textTheme.headline3.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text("${_questionControl.correctAns*10 }/${_questionControl.questions.length*10}",
              style: Theme.of(context).textTheme.headline4.copyWith(color: kSecondaryColor),),
              Spacer(flex: 3,)
            ],
          )
        ],
      ),
      
    );
  }
}