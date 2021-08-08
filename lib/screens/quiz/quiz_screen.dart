import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/questions_control.dart';

import 'components/body.dart';


class Quiz extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    QuestionControl _controller = Get.put(QuestionControl());
    return Scaffold(
      extendBodyBehindAppBar:  true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [TextButton(onPressed:_controller.nextQuestion,
        child: Text("Skip") ,)],),
      body: Body(),
    );
  }
}

