import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_shapes/flutter_shapes.dart';
import 'package:burn_out/Theme.dart';
import 'package:burn_out/circle.dart';
import 'package:burn_out/screens/DrawerPage.dart';
import 'package:burn_out/screens/settings/setting_main.dart';
import 'package:burn_out/screens/settings/Contact_Us.dart';
import 'package:burn_out/screens/settings/Exit.dart';
import 'package:burn_out/screens/settings/FAQs.dart';
import 'package:burn_out/screens/settings/Restart_Progress.dart';
import 'package:burn_out/screens/settings/ShareThisApp.dart';


class FAQs extends StatelessWidget{
  static const routeName = '/faqsPage';
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
          Column(
            children: <Widget>[

              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 10.0,
                      child: ListTile(
                        leading: Icon(Icons.arrow_back, color: Iconstyle,),
                        onTap: (){
                          // Open Contact Us Page.
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: 90.0,
                      child: ListTile(
                        //leading: Icon(Icons.arrow_forward, color: Colors.black,),
                        title: Text("FAQ's", style: Labeltextstyle,),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: 500.0,
                color: Colors.black,
                child: Text(
                  "1] HOW OFTEN SHOULD I WORK OUT TO SEE RESULTS?\n\n"
    "Getting in shape means working out on a regular basis. It's better to work out two to three times a week rather than just once in a while."
    "Working out regularly is more fun and gives you results. If you only hit the gym once in a while, you'll end up tired, sore and demotivated, which"
    "leads to quitting!",
                  style: Normaltextstyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
