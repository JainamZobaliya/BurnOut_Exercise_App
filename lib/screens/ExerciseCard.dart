import 'package:burn_out/Theme.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ExerciseCard{
  final String exerciseName;
  final Widget exerciseImage;
  final String exerciseInfo;

  ExerciseCard({this.exerciseName, this.exerciseImage, this.exerciseInfo});

  //  showExerciseInfoCard(context){
  //  Alert(
  //    context: context,
  //    title: "$exerciseName",
  //    desc: "$exerciseInfo",
  //    image: exerciseImage,
  //    buttons: [
  //      DialogButton(child: Text("OK"), onPressed: ()=>Navigator.of(context, rootNavigator: true).pop(),),
  //    ]
  //  ).show();
  // }
}