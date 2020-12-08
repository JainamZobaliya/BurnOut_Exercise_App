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


class ContactUs extends StatelessWidget{
  static const routeName = '/contactUsPage';
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
                          child: ListTile(
                            title: Text('Contact Us', style: Labeltextstyle,),
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
                  "BurnOut\n\n"
                      "Head Office: 5 Houses, Pochinki - [E], Erangle\n\n"
                      "Phone Number: 00154879632"
                      "Email: burnout@xyz.com",
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
