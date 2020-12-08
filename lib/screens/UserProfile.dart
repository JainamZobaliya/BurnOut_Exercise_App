
import 'package:burn_out/db/LogInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserProfile{
  String userId;
  String fullName;
  String emailId;
  String mobileNo;
  int age;
  int weight;
  int height;
  int workout;
  int glassConsumed;
  int sec;
  String workoutTime;
  bool status;

  void setLogInStatus(bool status){
    this.status = status;
  }
  
  DatabaseReference mDatabase = FirebaseDatabase.instance.reference();
  String getWorkOutTime(){
      workoutTime = _printDuration(Duration(seconds: sec));
    return workoutTime;
  }
  var history, waterTracker;

  UserProfile({String userId}){
    this.userId = userId;
    getFormData(userId);
  }

  static String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Future<void> getFormData(String userId) async {
    print("Reached---2");
    final uid = userId;
    print("Reached---1");
    final databaseReference = FirebaseDatabase.instance.reference();
    await databaseReference.once().then((DataSnapshot snapshot) async{
      snapshot.value.forEach((k, vv) => vv.forEach((key, v){
        if(key==uid)
        {
          emailId = v['emailId'];
          fullName = v['fullName'];
          mobileNo = v['mobileNo'];
          age = v['age'];
          weight = v['weight'];
          height = v['height'];
          waterTracker = v['waterTracker'];
          workout = v['workout'];
          workoutTime = v['workoutTime'];
          sec = v['seconds'];
          print("1. sec: $sec");
          print("\n\nhere - 0\n\n");
          print("waterTracker is: $waterTracker");
          print("\n\nhere - 1\n\n");
          waterTrackerHistory(waterTracker);
        }
      }));
    });
  }


  void waterTrackerHistory(var waterTracker){
    waterTracker.forEach((key, value){
      if(key.toString() == "glassConsumed"){
        glassConsumed = waterTracker[key];
      }
      else if(key == "history"){
        history = waterTracker[key];
      }
    });
  }

  void addWaterGlass(int glassDranked){
    // for(int i=0; i<glassDranked;++i) {
      mDatabase.child("users").child(userId).child("waterTracker").child("history").child((glassConsumed+1).toString()).set(DateTime.now().toString());
    glassConsumed = glassDranked;
      mDatabase.child("users").child(userId).child("waterTracker").child("glassConsumed").set(glassConsumed);
    // }
  }

  void increaseWorkout(int seconds){
    this.workout++;
    print("\n\nWorkout is: $workout\n\n");
    increaseWorkoutTimer(seconds);
    mDatabase.child("users").child(userId).child("workout").set(workout);
  }
  void increaseWorkoutTimer(int seconds){
    this.sec+=seconds;
    print("\n\nWorkoutDuration is: $getWorkOutTime()\n\n");
    workoutTime = getWorkOutTime();
    mDatabase.child("users").child(this.userId).child("workoutTime").set(workoutTime);
    mDatabase.child("users").child(userId).child("seconds").set(sec);
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<LogInPage> signOut() async {
    await _auth.signOut();
    return LogInPage();
  }
}