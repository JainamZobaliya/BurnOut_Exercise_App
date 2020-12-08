import 'package:burn_out/Theme.dart';
import 'package:burn_out/db/RegistrationPage.dart';
import 'package:burn_out/db/LogInPage.dart';
import 'package:flutter/material.dart';

class FirebaseAuthDemo extends StatefulWidget {
  static const routeName = '/firebaseAuthPage';
  @override
  _FirebaseAuthDemoState createState() => _FirebaseAuthDemoState();
}

class _FirebaseAuthDemoState extends State<FirebaseAuthDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        centerTitle: true,
        title: Text("BurnOut", style: welcomeTextStyle,),
        backgroundColor: Color(0xFF03424F),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: MaterialButton(
              elevation: 15.0,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100.0)),
              textColor: Color(0xFF53CA6B),
              color: Color(0xFF03424F),
              splashColor: Colors.tealAccent,
              child: Text("Log In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              onPressed: (){ _pushPage(context, LogInPage());}
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            child:
            MaterialButton(
              elevation: 15.0,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100.0)),
              textColor: Color(0xFF53CA6B),
              color: Color(0xFF03424F),
              splashColor: Colors.tealAccent,
              child: Text("Register", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              onPressed: (){ _pushPage(context, RegistrationPage());}
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    // Navigator.pushNamed(context, route);
    // Navigator.of(context).pushNamed(route);
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
