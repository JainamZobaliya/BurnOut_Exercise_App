import 'package:burn_out/Theme.dart';
import 'package:burn_out/screens/ExerciseArguments.dart';
import 'package:burn_out/screens/ExerciseInfoCard.dart';
import 'package:burn_out/screens/ExercisePage.dart';
import 'package:burn_out/screens/ExerciseCard.dart';
import 'package:burn_out/screens/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePageCard1 extends StatelessWidget {
  String heroTag;
  String title;
  String subTitle;
  String exerciseInfo;
  String trailingImage;
  VoidCallback onTab;

  HomePageCard1({this.heroTag, this.title, this.subTitle, this.trailingImage, this.exerciseInfo});

  @override
  Widget build(BuildContext context) {
    var i=0;
    onTab = ()=>showDialog(
      context: context,
      builder: (BuildContext context) => ExerciseInfoCard(
        exerciseName: title,
        exerciseDescription: exerciseInfo,
        exerciseImage: trailingImage,
      ),
    );
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 5, 0, 16),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 180,
              child: Card(
                color: const Color(0xFFffffff),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onTap: onTab,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        margin: const EdgeInsets.only(left: 172),
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Text(
                            title,
                            maxLines: 2,
                            style: exercisePageCardTitleTextStyle,
                          ),
                        ),
                      ),
                      subtitle: Container(
                          margin: const EdgeInsets.only( left: 200),
                          child: Text(subTitle,
                            style: exercisePageCardSubTitleTextStyle,)),
                      // subtitle: Container(
                      //   height: 60,
                      //   width: 60,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(top:20.0, right: 50.0),
                      //     child: SizedBox(
                      //       width: 20,
                      //       child: Container(
                      //         width: 20,
                      //         color: Colors.red,
                      //         child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: <Widget>[
                      //           Container(
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.all(
                      //                 const Radius.circular(5.0)
                      //               ),
                      //             ),
                      //             child: LinearProgressIndicator(
                      //               backgroundColor: Colors.blueGrey,
                      //               valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                      //               value: 0.6,
                      //               minHeight: 20,
                      //             ),
                      //           ),
                      //           Text('${(0.6 * 100).round()}%'),
                      //         ],
                      //     ),
                      //       ),
                      //   ),
                      //   ),
                      // ),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 1.0,
              ),
            ),
            Container(
              width: 180,
              margin: const EdgeInsets.only(bottom: 10, right: 150),
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: onTab,
                child: Image.asset(
                  "images/$trailingImage",
                  fit: BoxFit.contain,
                  height: 160,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageCard2 extends StatelessWidget {
  String heroTag;
  String title;
  String subTitle;
  Widget trailingImage;
  VoidCallback onTab;
  Map exerciseList;
  UserProfile me;

  HomePageCard2(
      {this.heroTag,
      this.title,
      this.subTitle,
      this.trailingImage,
      this.exerciseList,
        this.me,
      this.onTab});

  @override
  Widget build(BuildContext context) {
    onTab = onTab == null
        ? () {}
        : () {
      print("\n\nHomePage to ExercisePage: ${me.fullName}\n\n");
      print("\n\nHomePage to ExercisePage: ${exerciseList.length}\n\n");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return ExercisePage(
                heroTag: heroTag,
                exerciseTitle: title,
                exerciseSubTitle: subTitle,
                me: me,
                exerciseImage: trailingImage,
              exerciseList: exerciseList,
            );
          }));

            // Navigator.pushNamed(
            //   context,
              // MaterialPageRoute(
              //     builder: (context) => ExercisePage(
              //         heroTag: heroTag,
              //         exerciseTitle: title,
              //         exerciseSubTitle: subTitle,
              //         exerciseImage: trailingImage)));
              // ExercisePage.routeName,
              // arguments: ExerciseArguments(
              //     heroTag: heroTag,
              //     exerciseTitle: title,
              //     exerciseSubTitle: subTitle,
              //     exerciseImage: trailingImage,
              //     exerciseList: exerciseList),
          };
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Container(
              height: 180,
              child: Card(
                color: Colors.black,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  splashColor: Colors.white12,
                  onTap: onTab,
                  child: trailingImage,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: Text(
                    title,
                    style: homePageCardTextStyle,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Text(subTitle),
                ),
              ),
            ),
            new Positioned.fill(
              child: new Material(
                color: Colors.transparent,
                child: new InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  splashColor: Colors.white12,
                  onTap: onTab,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
