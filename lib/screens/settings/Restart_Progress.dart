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


class RestartProgress extends StatefulWidget {
  static const routeName = '/restartProgressPage';
  @override
  _RestartProgressState createState() => _RestartProgressState();
}

class _RestartProgressState extends State<RestartProgress> {
  //String _choice = 'NO';
  int _choice = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Do you want to Restart all your Progress?', style: Labeltextstyle,),),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('NO', style: Labeltextstyle,),
          onPressed: Navigator.of(context).pop,
        ),
        FlatButton(
          child: Text('YES', style: Labeltextstyle,),
          onPressed: () {
            setState(() {
              //_choice = 'YES';
              _choice = 1;
            });
            Navigator.of(context).pop(_choice);
          },
        )
      ],
    );
  }
}