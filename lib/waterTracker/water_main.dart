import 'package:burn_out/screens/DrawerPage.dart';
import 'package:burn_out/screens/UserProfile.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:burn_out/waterTracker/AddGlass.dart';
import 'package:burn_out/Theme.dart';
import 'package:burn_out/circle.dart';
import 'package:burn_out/waterTracker/glassfill.dart';
//import 'liquid_circular_progress_indicator.dart';

class WaterTrackerMain extends StatefulWidget {
  UserProfile me;
  WaterTrackerMain({this.me});
  static const routeName = 'waterTrackerPage';
  @override
  _WaterTrackerMainState createState() => _WaterTrackerMainState();
}

class _WaterTrackerMainState extends State<WaterTrackerMain> {
  int glass = 0;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  GlassLoadingController _flareController;
  static const int totalGlass = 8;
  @override
  void initState() {
    _flareController = GlassLoadingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentGlass = widget.me.glassConsumed;
    double percentToadd = currentGlass / totalGlass;
    _flareController.updateWaterPercent(percentToadd);
    return Scaffold(
      drawer: DrawerPage(me: widget.me,),
      appBar: AppBar(
        title: Text("Water Tracker",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
      Stack(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: Circle(),
              ),
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(20.0,20.0,20.0,10.0),
                  padding: const EdgeInsets.fromLTRB(10,10,10,5),
                  height: Theme.of(context).textTheme.headline4.fontSize * 1 + 500.0,
                  width: Theme.of(context).textTheme.headline4.fontSize * 1.1 + 300.0,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Text("Water Consumed Details", style: NormalLabelTextStyle,),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 15.0),
                        padding: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        height: 3.0,
                        color: Colors.redAccent,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Text("Glass Drunk: ${widget.me.glassConsumed}/8", style: NormalTextStyle,),
                            Container(
                              margin: const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 10.0),
                            ),

                            Container(
                              height: 200,
                              width: double.infinity,
                              child: FlareActor(
                                "assets/fillWater.flr",
                                controller: _flareController,
                                artboard: "Artboard",
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 0.0, top: 15.0, right: 5.0, bottom: 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () async{
                                      if (currentGlass<totalGlass){
                                      currentGlass = await showDialog(
                                        context: context,
                                        builder: (context) => AddGlasses(currentGlass: currentGlass, totalGlass: totalGlass),
                                      );
                                      setState(() {
                                        widget.me.addWaterGlass(currentGlass);
                                        percentToadd = currentGlass / totalGlass;
                                        _flareController.updateWaterPercent(percentToadd);
                                      });}
                                      else{
                                        showMessageSnackBar("Today's Goal is Achieved!");
                                      }
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
                ),
              ],
            ),
          ],
      ),
    );
  }

  void showMessageSnackBar(String message) {
    final snackBar = new SnackBar(
      content: new Text("$message"),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      elevation: 8.0,
      shape: CircleBorder(),
      fillColor: Colors.deepOrangeAccent,
      onPressed: onPressed,
    );
  }

}