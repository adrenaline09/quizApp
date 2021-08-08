import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/questions_control.dart';
import 'progressbar.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'question_card.dart';


class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionControl _questioncontroller = Get.put(QuestionControl());
    return Stack(
      children: [
        WebsafeSvg.asset("assets/icons/Cornered-Stairs.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(height: kDefaultPadding,),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(() =>Text.rich(TextSpan(
                  text: "Question ${_questioncontroller.questionNumber.value}",
                  style: Theme.of(context).textTheme.headline4.copyWith(color: kSecondaryColor),
                  children:[
                    TextSpan(
                      text: "/${_questioncontroller.questions.length}",
                      style: Theme.of(context).textTheme.headline5.copyWith(color: kSecondaryColor),
                      )
                    ]
                  )
                ),)
              ),
              Divider(thickness: 1,),
              SizedBox(height: kDefaultPadding,),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questioncontroller.pageController,
                  onPageChanged: _questioncontroller.updateTheQnNum,
                  itemCount: _questioncontroller.questions.length,
                  itemBuilder: (context,index)=>QuestionCard(question: _questioncontroller.questions[index] )   
                ),
              )       
            ],
          ),
        )
      ],
    );
  }
}



