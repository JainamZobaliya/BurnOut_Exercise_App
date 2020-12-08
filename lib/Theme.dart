import 'package:flutter/material.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

const appBackgroundColor = Color.fromARGB(255, 20, 20, 20);
const drawerColor = Colors.amber;
final circleColor = <Color>[
  Colors.orange[600],
  Colors.orange[500],
  Colors.orange[100],
];

final Gradient circleGradientBox = new LinearGradient(
  colors: circleColor,
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  stops: [
    0.0,
    0.8,
    1.0,
  ],
);

final weekGoalCardColor = <Color>[
  Colors.blue[100],
  Colors.blue[500],
  Colors.blue[900]
];

final Gradient weekGoalGradientBox = new RadialGradient(
  colors: weekGoalCardColor,
  radius: 3,
  focalRadius: 5,
  stops: [
    0.0,
    1.8,
    2.0,
  ],
);

const weekGoalTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const weekGoalDateTextStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
  color: Colors.lightBlueAccent,
);

final homePageCardColor = <Color>[Colors.black12, Colors.black45, Colors.black];

final Gradient homePageCardGradientBox = new RadialGradient(
  colors: homePageCardColor,
  radius: 3,
  focalRadius: 5,
  stops: [
    0.0,
    1.8,
    2.0,
  ],
);

const homePageCardTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const exercisePageAppBarTextStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Kaushan Script',
  color: Colors.blueAccent,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.blueGrey,
      offset: Offset(5.0, 5.0),
    )
  ],
);

const exercisePageAppBar2TextStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Kaushan Script',
  color: Colors.deepOrangeAccent,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.blueGrey,
      offset: Offset(5.0, 5.0),
    )
  ],
);

const exercisePageCardTitleTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const exercisePageCardSubTitleTextStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

ThemeData baseTheme() {
  TextTheme _baseTextTheme(TextTheme base) {
    return base.copyWith(
      headline6: TextStyle(
        fontSize: 25.0,
        fontFamily: 'Kaushan Script',
        color: Colors.white,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black,
            offset: Offset(5.0, 5.0),
          )
        ],
      ),
      bodyText1: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Architects Daughter',
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.blue,
      ),
      headline4: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
      ),
    );
  }

  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    textTheme: _baseTextTheme(base.textTheme),
    primaryColor: Colors.orange,
  );
}

// const ActiveCardcol = Colors.grey;
// const InactiveCardcol = Colors.blueGrey;
// const LabelTextStyle = TextStyle(fontSize: 20.0, color: Colors.tealAccent);
// const NumberTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700);
// const TitleTextStyle = TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold);


// @Dharmil

const double BottomContHeight = 80.0;

const BottomContColor = Colors.red;

// const ActiveCardcol = Colors.black87;
const Iconstyle = Colors.black;
// const InactiveCardcol = Colors.black12;
const NormalLabelTextStyle = TextStyle(fontFamily: 'Times New Roman',fontWeight: FontWeight.bold,fontSize: 20.0, color: Colors.blueAccent);
const NormalTextStyle = TextStyle(fontFamily: 'Times New Roman',fontSize: 18.0, color: Colors.blueAccent);
const Normaltextstyle = TextStyle(fontFamily: 'Times New Roman', fontSize: 20.0, color: Colors.white,);
const DashBoardNormalTextStyle = TextStyle(fontFamily: 'Times New Roman', fontSize: 1.0, color: Colors.white,);
const DashBoardValueTextStyle = TextStyle(fontFamily: 'Times New Roman',fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white,);
const DashBoardUnitTextStyle = TextStyle(fontFamily: 'Times New Roman',fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.white,);
const Labeltextstyle = TextStyle(fontFamily: 'Times New Roman', fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.white,);
const NumbersTextStyle = TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.black,);
const Titletextstyle = TextStyle(fontFamily: 'COPPERPLATE GOTHIC BOLD', fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white,);
const SubTitletextstyle = TextStyle(fontFamily: 'COPPERPLATE GOTHIC BOLD', fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black,);
const Trackertextstyle = TextStyle(fontFamily: 'Times New Roman', fontSize: 12.5, fontWeight: FontWeight.bold, color: Colors.blueAccent,);
//const BMItextstyle = TextStyle(fontSize: 80.0, fontWeight: FontWeight.w400, color: Colors.white,);
const Viewtextstyle = TextStyle(fontFamily: 'Times New Roman', fontSize: 12.5, fontWeight: FontWeight.bold, color: Colors.white,);
const Resultbodytextstyle = TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic, color: Colors.white,);

const ActiveCardcol = Colors.teal;
const InactiveCardcol = Colors.blueGrey;
const LabelTextStyle = TextStyle(fontSize: 20.0, color: Colors.tealAccent);
const NumberTextStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700);
const TitleTextStyle = TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold);

const welcomeTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Architects Daughter',
  color: Color(0xFF53CA6B),
);

// final circleColor = <Color>[
//   Colors.orange[600],
//   Colors.orange[500],
//   Colors.orange[100],
// ];
//
// final Gradient circleGradientBox = new LinearGradient(
//   colors: circleColor,
//   begin: Alignment.center,
//   end: Alignment.bottomCenter,
//   stops: [
//     0.0,
//     0.8,
//     1.0,
//   ],
// );