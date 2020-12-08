import 'package:burn_out/Theme.dart';
import 'package:burn_out/screens/HomePage.dart';
// import 'package:burn_out/screens/TimerArguments.dart';
import 'package:burn_out/screens/TimerCircle.dart';
import 'package:burn_out/screens/UserProfile.dart';
import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  static const routeName = '/timer';
  final dynamic exerciseList;
  UserProfile me;
  Timer({this.exerciseList, this.me});
  int time = 5;
  int relaxTime = 2;
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  AnimationController controller, relaxController;
  var timerButtonIcon = Icon(Icons.pause);
  var timerButtonText = Text("Pause");

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes % 24}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  String get relaxTimerString {
    Duration duration = relaxController.duration * relaxController.value;
    return '${duration.inMinutes % 24}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.time),
      value: 1,
    );
    relaxController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.relaxTime),
      value: 1,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => loopOnce(context));
  }

  List list = [];
  int i = 0;
  int j = 1;

  Future<void> loopOnce2(BuildContext context) async {
    print("j: $j in loopOnce2 i: $i,");
    await relaxController.forward();
    await relaxController.reverse();
    setState(() {
      if (i == list.length) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return HomePage(me: widget.me,);
        }));
      }
      j++;
      controller.value = 1.0;
      controller.repeat(reverse: true);
      WidgetsBinding.instance.addPostFrameCallback((_) => loopOnce(context));
    });
  }

  Future<void> loopOnce(BuildContext context) async {
    print("j: $j in loopOnce i: $i,");
    await controller.forward();
    await controller.reverse();
    setState(() {
      if (i == list.length) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return HomePage(me: widget.me,);
          }));
      }
      j++;
      widget.me.increaseWorkout(widget.time);
      print("\n\nWidget.me.email: ${widget.me.emailId}\n\n");
      relaxController.value = 1.0;
      relaxController.repeat(reverse: true);
      WidgetsBinding.instance.addPostFrameCallback((_) => loopOnce2(context));
    });
  }

  @override
  dispose() {
    controller.dispose();
    relaxController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      for (var x in widget.exerciseList.keys) {
        list.add(x);
      }
    }
    int x = list.length;
    print("i: $i list length: $x");
    if (j % 2 == 0 && i != x - 1) {
      ++i;
      print("j: $j in if i: $i,");
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.deepOrangeAccent,
          ),
          title: Text(
            'Time to Relax',
            style: exercisePageAppBar2TextStyle,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFF1b1b2f),
        body: AnimatedBuilder(
            animation: relaxController,
            builder: (context, child) {
              return Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Color(0xFF162447),
                      height: relaxController.value *
                          MediaQuery.of(context).size.height,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "images/relax.jpg",
                        fit: BoxFit.contain,
                        height: 180,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: AnimatedBuilder(
                                      animation: relaxController,
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return CustomPaint(
                                            painter: TimerCircle(
                                          animation: relaxController,
                                          backgroundColor: Colors.grey,
                                          color: Color(0xFFe43f5a),
                                        ));
                                      },
                                    ),
                                  ),
                                  Container(
                                    alignment: FractionalOffset.topCenter,
                                    margin: EdgeInsets.all(30.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "Count Down Timer",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xFFe43f5a),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 60,
                                        ),
                                        AnimatedBuilder(
                                            animation: relaxController,
                                            builder: (BuildContext context,
                                                Widget child) {
                                              return Text(
                                                relaxTimerString,
                                                style: TextStyle(
                                                  fontSize: 50.0,
                                                  color: Color(0xFFe43f5a),
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: AnimatedBuilder(
                              animation: relaxController,
                              builder: (context, child) {
                                return FloatingActionButton.extended(
                                  onPressed: () {
                                    if (relaxController.isAnimating)
                                      relaxController.stop();
                                    else {
                                      relaxController.reverse(
                                          from: relaxController.value == 0.0
                                              ? 1.0
                                              : relaxController.value);
                                    }
                                    setState(() {
                                      timerButtonIcon = Icon(
                                          relaxController.isAnimating
                                              ? Icons.pause
                                              : Icons.play_arrow);
                                      timerButtonText = Text(
                                          relaxController.isAnimating
                                              ? "Pause"
                                              : "Play");
                                    });
                                  },
                                  icon: timerButtonIcon,
                                  label: timerButtonText,
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      );
    }
    else if (i != x && j % 2 != 0) {
      var img = widget.exerciseList[list[i]][0];
      print("j: $j in else if i: $i, img: $img");
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.blueAccent,
          ),
          title: Text(
            '${widget.exerciseList[list[i]][1]}',
            style: exercisePageAppBarTextStyle,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFF1b1b2f),
        body: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Color(0xFF162447),
                      height:
                          controller.value * MediaQuery.of(context).size.height,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "images/$img",
                        fit: BoxFit.contain,
                        height: 180,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: AnimatedBuilder(
                                      animation: controller,
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return CustomPaint(
                                            painter: TimerCircle(
                                          animation: controller,
                                          backgroundColor: Colors.grey,
                                          color: Color(0xFFe43f5a),
                                        ));
                                      },
                                    ),
                                  ),
                                  Container(
                                    alignment: FractionalOffset.topCenter,
                                    margin: EdgeInsets.all(30.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "Count Down Timer",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xFFe43f5a),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 60,
                                        ),
                                        AnimatedBuilder(
                                            animation: controller,
                                            builder: (BuildContext context,
                                                Widget child) {
                                              return Text(
                                                timerString,
                                                style: TextStyle(
                                                  fontSize: 50.0,
                                                  color: Color(0xFFe43f5a),
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: AnimatedBuilder(
                              animation: controller,
                              builder: (context, child) {
                                return FloatingActionButton.extended(
                                  onPressed: () {
                                    if (controller.isAnimating)
                                      controller.stop();
                                    else {
                                      controller.reverse(
                                          from: controller.value == 0.0
                                              ? 1.0
                                              : controller.value);
                                    }
                                    setState(() {
                                      timerButtonIcon = Icon(
                                          controller.isAnimating
                                              ? Icons.pause
                                              : Icons.play_arrow);
                                      timerButtonText = Text(
                                          controller.isAnimating
                                              ? "Pause"
                                              : "Play");
                                    });
                                  },
                                  icon: timerButtonIcon,
                                  label: timerButtonText,
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      );
    }
    else{
      // controller.stop();
      // relaxController.stop();
      controller.dispose();
      relaxController.dispose();
      // waiting();
      print("In else: i is $i");
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.deepOrangeAccent,
          ),
          title: Text(
            'Completed WorkOut',
            style: exercisePageAppBar2TextStyle,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFF1b1b2f),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "images/finishedWorkOut.jpg",
                    fit: BoxFit.contain,
                    height: 250,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(30.0),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.0),
                child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
                        return HomePage(me: widget.me,);
                      }));
                    },
                    elevation: 1.0,
                    icon: Icon(Icons.settings_backup_restore_rounded),
                    label: Text("Go Back")),
              ),
            ],
          ),
        ),
      );
    }
  }

  Future<void> waiting() async {
    await new Future.delayed(const Duration(seconds: 5000000));
  }
}
