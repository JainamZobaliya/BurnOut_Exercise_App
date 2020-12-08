import 'package:burn_out/Theme.dart';
import 'package:burn_out/db/LogInPage.dart';
import 'package:burn_out/db/RegistrationPage.dart';
import 'package:burn_out/db/firebaseAuthDemo.dart';
// import 'package:burn_out/screens/HomPageArguments.dart';
import 'package:burn_out/screens/HomePage.dart';
import 'package:burn_out/screens/SongsMain.dart';
import 'package:burn_out/screens/Timer.dart';
import 'package:burn_out/screens/SplashScreen.dart';
import 'package:burn_out/screens/ExercisePage.dart';
// import 'package:burn_out/screens/WaterTracker.dart';
import 'package:burn_out/screens/dashboard_main.dart';
import 'package:burn_out/screens/settings/About_Us.dart';
import 'package:burn_out/screens/settings/Contact_Us.dart';
import 'package:burn_out/screens/settings/Exit.dart';
import 'package:burn_out/screens/settings/FAQs.dart';
import 'package:burn_out/screens/settings/Rate_Us.dart';
import 'package:burn_out/screens/settings/Restart_Progress.dart';
import 'package:burn_out/screens/settings/ShareThisApp.dart';
import 'package:burn_out/screens/settings/setting_main.dart';
import 'package:burn_out/waterTracker/water_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BurnOut());
}

class BurnOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: baseTheme(),
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (BuildContext context) => SplashPage(),
        FirebaseAuthDemo.routeName: (BuildContext context) => FirebaseAuthDemo(),
        RegistrationPage.routeName: (BuildContext context) => RegistrationPage(),
        LogInPage.routeName: (BuildContext context) => LogInPage(),
        ExercisePage.routeName: (BuildContext context) => ExercisePage(),
        Timer.routeName: (BuildContext context) => Timer(),
        Dashboard.routeName: (BuildContext context) => Dashboard(),
        Settings.routeName: (BuildContext context) => Settings(),
        AboutUs.routeName: (BuildContext context) => AboutUs(),
        ContactUs.routeName: (BuildContext context) => ContactUs(),
        Exit.routeName: (BuildContext context) => Exit(),
        FAQs.routeName: (BuildContext context) => FAQs(),
        RateUs.routeName: (BuildContext context) => RateUs(),
        RestartProgress.routeName: (BuildContext context) => RestartProgress(),
        Share.routeName: (BuildContext context) => Share(),
        SongsMain.routeName: (BuildContext context) => SongsMain(),
        HomePage.routeName: (BuildContext context) => HomePage(),
        WaterTrackerMain.routeName: (BuildContext context) => WaterTrackerMain(),
        // WaterTracker.routeName: (BuildContext context) => WaterTracker(),
      },
      // onGenerateRoute: Router2.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
