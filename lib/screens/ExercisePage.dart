import 'package:burn_out/screens/HomePage.dart';
import 'package:burn_out/screens/Timer.dart';
import 'package:burn_out/screens/UserProfile.dart';
import 'package:burn_out/Theme.dart';
import 'package:burn_out/screens/HomePageCard.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  final String heroTag;
  final String exerciseTitle;
  final String exerciseSubTitle;
  final exerciseImage;
  final String exerciseInfo;
  final dynamic exerciseList;
  UserProfile me;
  static const routeName = '/exercise';
  ExercisePage(
      {this.heroTag,
      this.exerciseTitle,
      this.exerciseSubTitle,
      this.exerciseImage, this.exerciseInfo, this.exerciseList, this.me});

  @override
  Widget build(BuildContext context) {
    // final ExerciseArguments args = ModalRoute.of(context).settings.arguments;
    final listLength = exerciseList.length;
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blueAccent,
        ),
        title: Text(
          'BurnOut',
          style: exercisePageAppBarTextStyle,
        ),
          leading: GestureDetector(
        onTap:  (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return HomePage(
                  me: me,
                );}
              ));},
        child: Icon(
          Icons.arrow_back,  // add custom icons also
        ),
          ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: "exerciseCard",
            child: HomePageCard2(
              heroTag: heroTag,
              title: exerciseTitle,
              subTitle: exerciseSubTitle,
              trailingImage: exerciseImage,
              onTab: null,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 30,bottom: 5),
            child: Text(
              "$listLength Workouts",
              style: homePageCardTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                ListView.builder(
                  itemCount: listLength,
                  itemBuilder: (BuildContext context, int index) {
                    String key = exerciseList.keys.elementAt(index);
                    return new Column(
                      children: <Widget>[
                        Hero(
                          tag: "exercise1" + key,
                          child: HomePageCard1(
                            heroTag: "exercise1" + key,
                            title: exerciseList[key][1],
                            subTitle: exerciseList[key][2],
                            trailingImage: exerciseList[key][0],
                            exerciseInfo: exerciseList[key][3],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: 70,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.fromLTRB(
                      0, 0, MediaQuery.of(context).size.width / 8, 60),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 12,
                        offset: Offset(2, 5),
                      ),
                    ],
                  ),
                  child: RaisedButton(
                    color: const Color(0xFF2F6F92),
                    textColor: Colors.white,
                    splashColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5.0,
                    onPressed: (){
                    // Navigator.pushNamed(
                    // context,
                    // // MaterialPageRoute(
                    // //     builder: (context) => ExercisePage(
                    // //         heroTag: heroTag,
                    // //         exerciseTitle: title,
                    // //         exerciseSubTitle: subTitle,
                    // //         exerciseImage: trailingImage)));
                    // Timer.routeName,
                    // arguments: args.exerciseList,),
                    // }));
                      print("Widget.me.FullName: ${me.fullName}");
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) {
                      return Timer(exerciseList: exerciseList, me: me,);
                    }
                    )
                    );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 45,
                        ),
                        Text(
                          "START",
                          textAlign: TextAlign.center,
                          textScaleFactor: 2.6,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // showExerciseInfoCard(context) {
  //   Alert(
  //       context: context,
  //       title: exerciseTitle,
  //       desc: exerciseInfo,
  //       image: exerciseImage,
  //       buttons: [
  //         DialogButton(child: Text("OK"),
  //           onPressed: () => Navigator.of(context, rootNavigator: true).pop(),),
  //       ]
  //   ).show();
  // }

}
