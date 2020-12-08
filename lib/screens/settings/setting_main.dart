//import 'package:flutter/cupertino.dart';
import 'package:burn_out/Theme.dart';
import 'package:burn_out/circle.dart';
import 'package:burn_out/screens/DrawerPage.dart';
import 'package:burn_out/screens/settings/Rate_Us.dart';
import 'package:burn_out/screens/settings/About_Us.dart';
import 'package:burn_out/screens/settings/Contact_Us.dart';
import 'package:burn_out/screens/settings/Exit.dart';
import 'package:burn_out/screens/settings/FAQs.dart';
import 'package:burn_out/screens/settings/Restart_Progress.dart';
import 'package:burn_out/screens/settings/ShareThisApp.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_shapes/flutter_shapes.dart';

class Settings extends StatelessWidget{
  static const routeName = '/settingsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: DrawerPage(),
    drawerEnableOpenDragGesture: true,
    drawerEdgeDragWidth: MediaQuery.of(context).size.width / 4,
      appBar: AppBar(
        title: Text('Settings', style: Labeltextstyle,),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.black,
      body:Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: Circle(),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(20.0),
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text('About Us', style: Labeltextstyle,),
                        trailing: Icon(Icons.navigate_next),
                        onTap: (){
                          // Open About Us Page.
                          Navigator.pushNamed(
                            context,
                            AboutUs.routeName,);
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 10.0,
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: Icon(Icons.contact_mail),
                        title: Text('Contact Us', style: Labeltextstyle,),
                        trailing: Icon(Icons.navigate_next),
                        onTap: (){
                          // Open Contact Us Page.
                          Navigator.pushNamed(
                            context,
                            ContactUs.routeName,);
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 10.0,
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: Icon(Icons.rate_review),
                        title: Text('Rate Us', style: Labeltextstyle,),
                        trailing: Icon(Icons.navigate_next),
                        onTap: () async{
                          // Open Rate Us Page.
                          int rating = await showDialog(
                            context: context,
                            builder: (context) => RateUs(),
                          );
                          if(rating == null) return;
                          else print('Selected rate stars: $rating');
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 10.0,
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: Icon(Icons.redo),
                        title: Text('Restart Progress', style: Labeltextstyle,),
                        trailing: Icon(Icons.navigate_next),
                        onTap: ()async{
                          // Open Restart Progress Page.
                          int restartChoice = await showDialog(
                            context: context,
                            builder: (context) => RestartProgress(),
                          );
                          if(restartChoice == 0) return;
                          print('Restart Progress: YES ($restartChoice)');
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 10.0,
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text('Share this App', style: Labeltextstyle,),
                        trailing: Icon(Icons.navigate_next),
                        onTap: ()async{
                          // Open Share this App Page.
                          int shareChoice = await showDialog(
                          context: context,
                          builder: (context) => Share(),
                          );
                          if(shareChoice == null) return;
                          print('Selected rate stars: Yes ($shareChoice)');
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 10.0,
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: Icon(Icons.question_answer),
                        title: Text("FAQ's", style: Labeltextstyle,),
                        trailing: Icon(Icons.navigate_next),
                        onTap: (){
                          // Open FAQ's Page.
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FAQs()),
                          );
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 10.0,
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text("Exit", style: Labeltextstyle,),
                        trailing: Icon(Icons.navigate_next),
                        onTap: ()async{
                          // Exit.
                          int exitChoice = await showDialog(
                            context: context,
                            builder: (context) => Exit(),
                          );
                          if(exitChoice == null) return;
                          print('Selected rate stars: Yes ($exitChoice)');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}