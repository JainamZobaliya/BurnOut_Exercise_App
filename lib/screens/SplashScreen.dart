import 'package:burn_out/db/firebaseAuthDemo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splashPage';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.tealAccent,
            body: SizedBox.expand(
                child: Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage('images/BurnOut.png'),
                          fit: BoxFit.fill
                      ),
                    ),
                    child: SplashScreen(
                      imageBackground: AssetImage('images/BurnOut.png'),
                      seconds: 5,
                      photoSize:0.0,
                      navigateAfterSeconds: FirebaseAuthDemo(),
                    )
                  // ],
                ),
            )
    );
  }
}