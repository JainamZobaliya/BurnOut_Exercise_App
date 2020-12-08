import 'package:burn_out/screens/DrawerPage.dart';
import 'package:burn_out/screens/ExerciseList.dart';
import 'package:burn_out/screens/UserProfile.dart';
// import 'package:burn_out/screens/HomPageArguments.dart';
import 'package:burn_out/screens/HomePageCard.dart';
import 'package:burn_out/Theme.dart';
import 'package:burn_out/circle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  UserProfile me;
  HomePage({this.me});
  static const routeName = '/homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> weekGoalDate = [
    01,
    02,
    03,
    04,
    05,
    06,
    07,
    08,
    09,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ];
  Future<void> caller() async {
    await widget.me.getFormData(widget.me.userId);
  }
  ExerciseList listy = new ExerciseList();
  @override
  Widget build(BuildContext context) {
    // GlobalVariables global = new GlobalVariables(widget.userId);
    // final HomePageArguments args = ModalRoute.of(context).settings.arguments;
    caller();
    widget.me.setLogInStatus(true);
    print("In homepage uid is: $widget.me");
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        drawer: DrawerPage(me: widget.me,),
        drawerEnableOpenDragGesture: true,
        drawerEdgeDragWidth: MediaQuery.of(context).size.width / 4,
        appBar: AppBar(
          title: Text(
            'BurnOut',
            style: Theme.of(context).textTheme.headline6,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.8,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: CustomPaint(
                      painter: Circle(),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "${widget.me.workout}",
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("WorkOut",
                                      style:
                                          Theme.of(context).textTheme.headline5),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "${widget.me.getWorkOutTime()}",
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Minutes",
                                      style:
                                          Theme.of(context).textTheme.headline5),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        decoration: new BoxDecoration(
                          gradient: weekGoalGradientBox,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Card(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.transparent,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Week Goal",
                                    style: weekGoalTextStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    for (var i in weekGoalDate)
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(10.0),
                                          width: 43,
                                          child: Text(
                                            "$i",
                                            style: weekGoalDateTextStyle,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Workout Plans",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.width * 10,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Hero(
                            tag: "card1",
                            child: HomePageCard2(
                              heroTag: "card1",
                              title: "Full Body",
                              subTitle: "Variety of Exercise",
                              trailingImage: Padding(
                                padding: const EdgeInsets.only(left: 140.0),
                                child: Image.asset(
                                  "images/img1.png",
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.contain,
                                ),
                              ),
                                exerciseList: listy.exerciseListMap["Full Body"],
                              me: widget.me,
                              onTab: (){
                                return 5;
                              },
                            ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Hero(
                            tag: "card2",
                            child: HomePageCard2(
                              heroTag: "card2",
                              title: "Chest",
                              subTitle: "Do PushUps",
                              trailingImage: Image.asset(
                                "images/img2.jpeg",
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                              ),
                              exerciseList: listy.exerciseListMap["Chest"],
                              me: widget.me,
                              onTab: (){
                                return 5;
                              },
                            ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Hero(
                          tag: "card3",
                          child: HomePageCard2(
                            heroTag: "card3",
                            title: "Lower Body",
                            subTitle: "Regularly Squats",
                            trailingImage: Image.asset(
                              "images/img3.jpg",
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                            exerciseList: listy.exerciseListMap["Lower Body"],
                            me: widget.me,
                            onTab: (){
                              return 5;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Hero(
                          tag: "card4",
                          child: HomePageCard2(
                            heroTag: "card4",
                            title: "Shoulder & Back",
                            subTitle: "Do SitUps",
                            trailingImage: Image.asset(
                              "images/img4.jpg",
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                            exerciseList: listy.exerciseListMap["Shoulder & Back"],
                            me: widget.me,
                            onTab: (){
                              return 5;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
