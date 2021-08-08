import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  String get assets => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        WebsafeSvg.asset("assets/icons/Cornered-Stairs.svg"),
        SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 2,),
                  Text("Lets Play",style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text("Enter Yours Credentials"),
                  Spacer(),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Full Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
                      ),        
                  ),
                  Spacer(),
                  InkWell(
                    onTap: ()=> Get.to(Quiz()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding*0.75),
                      decoration: BoxDecoration(gradient: kPrimaryGradient,borderRadius: BorderRadius.all(Radius.circular(12)) ),
                      child: Text("Lets Start the Quiz", style: Theme.of(context).textTheme.button.copyWith(color: Colors.black),)
                    ),
                  ),
                Spacer(),
              ],
            ),
          )
        )
      ], 
      ),
    );
  }
}
