import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:flutter/material.dart';

class ExerciseList{
  // final Image exerciseImage;
  // final String exerciseName;
  // final String exerciseTimeOrRep;
  // ExerciseList({this.exerciseImage, this.exerciseName, this.exerciseTimeOrRep, this.exerciseListMap});
  // GifController controller = GifController(vsync: this);
  // dynamic cont = List<dynamic>();
  // cont[0] = controller.repeat(min:0,max:6,period:Duration(milliseconds: 1000));

  var exerciseListMap = {
    "Full Body": {
      "Jumping Jack": [
        "1_jumping-jack.gif",
        "Jumping Jack",
        "00:20",
        "Jumping jacks being a cardio exercise, uses oxygen to meet the energy demands thereby stimulating your heart muscles. The pumping up of heart muscles in turn gives you a relief from the terrible thoughts of a block or stroke."
      ],
      "Abdominal Crunches": [
        "2_AbdominalCrunches.gif",
        "Abdominal Crunches",
        "x 16",
        "The crunch is one of the most popular abdominal exercises. When performed properly, it engages all the abdominal muscles but primarily it works the rectus abdominis muscle and the obliques. It allows both building six-pack abs, and tightening the belly."
      ],
      "Russian Twists": [
        "3_RussianTwists.gif",
        "Russian Twists",
        "x 20",
        "The Russian twist is a type of exercise that is used to work the abdominal muscles by performing a twisting motion on the abdomen. The exercise is believed by those who practice it to build explosiveness in the upper torso."
      ],
      "Mountain Climber": [
        "4_MountainClimber.gif",
        "Mountain Climber",
        "x 16",
        "Mountain climbers are great for building cardio endurance, core strength, and agility. You work several different muscle groups with mountain climbers—it's almost like getting a total-body workout with just one exercise. ... And because it's a cardio exercise, you'll get heart health benefits and burn calories."
      ],
    },
    "Chest": {
      "Cobra Stretch": [
        "8_CobraStretch.gif",
        "Cobra Stretch",
        "00:30",
        "Cobra pose (Bhujangasana) can be a great counteraction to stretch out your spine and chest throughout the day. Although this asana can bring more flexibility to your spine and open your chest and heart, it can also cause back pain itself if not practiced correctly."
      ],
    },
    "Lower Body": {
      "Squats": [
        "10_Squats.gif",
        "Squats",
        "x 10",
        "A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up. During the descent of a squat, the hip and knee joints flex while the ankle joint dorsiflexes; conversely the hip and knee joints extend and the ankle joint plantarflexes when standing up."
      ],
      "Lunge": [
        "11_Lunge.gif",
        "Lunge",
        "x 14",
        "A lunge can refer to any position of the human body where one leg is positioned forward with knee bent and foot flat on the ground while the other leg is positioned behind."
      ],
      "Heel Touch": [
        "5_HeelTouch.gif",
        "Heel Touch",
        "x 20",
        "Increases core strength in the obliques and the rectus abdominis. Engages upper-back muscles. Great beginner exercise for targeting obliques. Rectus abdominis contract isometrically while obliques contract dynamically."
      ],
      "Leg Raises": [
        "6_LegRaises.gif",
        "Leg Raises",
        "x 16",
        "The leg raise is a strength training exercise which targets the iliopsoas. Because the abdominal muscles are used isometrically to stabilize the body during the motion, leg raises are also often used to strengthen the rectus abdominis muscle and the internal and external oblique muscles."
      ],
    },
    "Shoulder & Back": {
      "Push Ups": [
        "9_PushUps.gif",
        "Push Ups",
        "x 4",
        "A push-up is a common calisthenics exercise beginning from the prone position. By raising and lowering the body using the arms, push-ups exercise the pectoral muscles, triceps, and anterior deltoids, with ancillary benefits to the rest of the deltoids, serratus anterior, coracobrachialis and the midsection as a whole."
      ],
      "Plank": [
        "7_plank.gif",
        "Plank",
        "00:20",
        "The plank (also called a front hold, hover, or abdominal bridge) is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time. The most common plank is the forearm plank which is held in a push-up-like position, with the body's weight borne on forearms, elbows, and toes. Many variations exist such as the side plank and the reverse plank."
      ],
    },
  };
}