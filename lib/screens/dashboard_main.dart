//import 'package:flutter/cupertino.dart';
import 'package:burn_out/screens/UserProfile.dart';
import 'package:burn_out/Theme.dart';
import 'package:burn_out/circle.dart';
import 'package:burn_out/screens/DrawerPage.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget {
  UserProfile me;
  var fullName, emailId, password, mobileNo, age, weight, height, glassConsumed, history;
  Dashboard({this.me});
  static const routeName = '/dashboardPage';
  @override
  Widget build(BuildContext context) {
    print("In DashBoardpage uid is: $me");
    me.getFormData(me.userId);
    print("\n\n\n\n\nhistory is: ${me.history}\n\n\n");
    return Scaffold(
      drawer: DrawerPage(me: me,),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width / 4,
      appBar: AppBar(
        title: Text('Dashboard', style: Theme.of(context).textTheme.headline6,),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width*0.68,
            child: Stack(
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
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
                      padding: const EdgeInsets.fromLTRB(10,10,10,5),
                      decoration: new BoxDecoration(
                      gradient: weekGoalGradientBox,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Text("Personal Details", style: DashBoardValueTextStyle,),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 7.0),
                            padding: const EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 3.0,
                            color: Colors.redAccent,
                          ),
                          Text("Welcome, ${me.fullName}!!", style: DashBoardValueTextStyle,),
                          Container(
                            margin: const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.5),
                            padding: const EdgeInsets.all(4.0),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Text("Email Id.: ${me.emailId}", style: Labeltextstyle,),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text("Age", style: Labeltextstyle,),
                                        SizedBox(height: 5,),
                                        Text("${me.age}", style: DashBoardValueTextStyle,),
                                        SizedBox(height: 5,),
                                        Text("cm", style: DashBoardUnitTextStyle,),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text("Weight", style: Labeltextstyle,),
                                        SizedBox(height: 5,),
                                        Text("${me.weight}", style: DashBoardValueTextStyle,),
                                        SizedBox(height: 5,),
                                        Text("Kg", style: DashBoardUnitTextStyle,),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text("Height", style: Labeltextstyle,),
                                        SizedBox(height: 5,),
                                        Text("${me.height}", style: DashBoardValueTextStyle,),
                                        SizedBox(height: 5,),
                                        Text("cm", style: DashBoardUnitTextStyle,),
                                      ],
                                    ),
                                  ],
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
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0,0,20.0,30.0),
            padding: const EdgeInsets.fromLTRB(10,10,10,5),
            decoration: new BoxDecoration(
                gradient: weekGoalGradientBox,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text("Your Statistics", style: DashBoardValueTextStyle,),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 7.0),
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 3.0,
                  color: Colors.redAccent,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.5),
                  padding: const EdgeInsets.all(4.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Text("Total Time in Workout : ${me.getWorkOutTime()}", style: Labeltextstyle,),
                      SizedBox(height: 10,),
                      Text("Total Workount Done : ${me.workout}", style: Labeltextstyle,),
                      SizedBox(height: 10,),
                      Text("Total Water Consumed : ${me.glassConsumed}", style: Labeltextstyle,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0,0,20.0,0.0),
            padding: const EdgeInsets.fromLTRB(10,10,10,5),
            decoration: new BoxDecoration(
                gradient: weekGoalGradientBox,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text("History", style: DashBoardValueTextStyle,),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 7.0),
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 3.0,
                  color: Colors.redAccent,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.5),
                  padding: const EdgeInsets.all(4.0),
                  height: 150,
                  alignment: Alignment.centerLeft,
                  child: getData(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget getData(){
    print("me.history : ${me.history}");
    var listArray = [];
    if(me.history!=null) {
      for (int i = 1; i < me.history.length; ++i) {
        listArray.add(me.history[i]);
      }
      return new ListView.builder(
          itemCount: listArray.length,
          itemBuilder: (BuildContext ctxt, int Index) {
            var data = listArray[Index].toString();
            return Column(
              children: <Widget>[
                Text("${Index + 1} :  $data"),
                SizedBox(),
              ],
            );
          }
      );
    }
    else{
      return Text("No Records");
    }
  }

}