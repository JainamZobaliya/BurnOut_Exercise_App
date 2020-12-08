import 'package:burn_out/db/LogInPage.dart';
import 'package:burn_out/screens/HomePage.dart';
// import 'package:burn_out/screens/LoginPage.dart';
import 'package:burn_out/screens/SongsMain.dart';
import 'package:burn_out/screens/UserProfile.dart';
// import 'package:burn_out/screens/WaterTracker.dart';
import 'package:burn_out/screens/dashboard_main.dart';
import 'package:burn_out/screens/settings/setting_main.dart';
import 'package:burn_out/waterTracker/water_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  UserProfile me;
  DrawerPage({this.me});
  @override
  Widget build(BuildContext context) {
    print("In Drawerpage uid is: $me");
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/logo.png"),
                          fit: BoxFit.cover)),
                  child: Text(""),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "Training",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    selectedTileColor: Colors.blueAccent,
                    tileColor: Colors.black26,
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
                        return HomePage(me: me,);
                      }));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.music_note_outlined,
                      size: 40,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "Songs",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    selectedTileColor: Colors.blueAccent,
                    tileColor: Colors.black26,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SongsMain.routeName,);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.track_changes_rounded,
                      size: 40,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "Water Tracker",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    selectedTileColor: Colors.blueAccent,
                    tileColor: Colors.black26,
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) {
                            return WaterTrackerMain(me: me,);
                          }));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.stacked_bar_chart,
                      size: 40,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "Your Statistics",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    selectedTileColor: Colors.blueAccent,
                    tileColor: Colors.black26,
                    onTap: () {
                      onLoading(context, me);
                      // Future.delayed(
                      //     Duration(seconds: 5),
                      //         () =>{
                      //           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
                      //             return Dashboard(me: me,);
                      //           }))
                      //     }
                      // );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      size: 40,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "Settings",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    selectedTileColor: Colors.blueAccent,
                    tileColor: Colors.black26,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Settings.routeName,);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      size: 40,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "Log Out",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    selectedTileColor: Colors.blueAccent,
                    tileColor: Colors.black26,
                    onTap: ()async{
                      // // me.signOut();
                        await FirebaseAuth.instance.signOut();
                      //   Intent i=new Intent(getApplicationContext(),LoginActivity.class);
                      //   startActivity(i);
          
                        Navigator.pushNamed(
                          context,
                          LogInPage.routeName,);

                        },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onLoading(BuildContext context, UserProfile me) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Text("Loading"),
              ],
            ),
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () =>{
      Navigator.pop(context), //pop dialog
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return Dashboard(me: me,);
          })),
        });
  }
}
