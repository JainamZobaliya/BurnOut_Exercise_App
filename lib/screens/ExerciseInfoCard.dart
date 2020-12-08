import 'package:flutter/material.dart';

class ExerciseInfoCard extends StatelessWidget {
  final String exerciseName;
  final String exerciseImage;
  final String exerciseDescription;

  ExerciseInfoCard(
      {this.exerciseName, this.exerciseImage, this.exerciseDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 66.0 + 16.0,
            bottom: 16.0,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: new BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 16.0,
                      offset: const Offset(0.0, 16.0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 66.0),
                    Text(
                      exerciseName,
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      exerciseDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 24.0),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          left: 16.0,
          right: 16.0,
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 55.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                "images/$exerciseImage",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: MediaQuery.of(context).size.width/3+90,
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).pop(); // To close the dialog
            },
            child: Text("x",style: TextStyle(fontSize: 25,color: Colors.black,),),
          ),
        ),
      ],
    );
  }
}
