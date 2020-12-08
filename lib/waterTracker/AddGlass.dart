import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:burn_out/Theme.dart';

import 'package:burn_out/waterTracker/glassfill.dart';


class AddGlasses extends StatefulWidget {
  var currentGlass;
  var totalGlass;
  AddGlasses({this.currentGlass, this.totalGlass});

  @override
  _AddGlassesState createState() => _AddGlassesState();
}

class _AddGlassesState extends State<AddGlasses> {
  //String _choice = 'NO';widget.currentGlass

  GlassLoadingController _flareController = GlassLoadingController();

  double percentToadd;
  void addWater() {
    setState(() {
      if (widget.currentGlass <= widget.totalGlass) {
        widget.currentGlass = widget.currentGlass + 1;
      }
    });
  }

  void subWater() {
    setState(() {
      widget.currentGlass = widget.currentGlass - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    int _add = widget.currentGlass;
    int _total = widget.totalGlass;

    return AlertDialog(
      title: Center(child: Text('Total Glass Dranked', style: LabelTextStyle,),),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RoundIconButton(
            icon: FontAwesomeIcons.minus,
            onPressed: subWater,
          ),
          Text('$_add',style: NumberTextStyle,),
          RoundIconButton(
            icon: FontAwesomeIcons.plus,
            onPressed: addWater,
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel', style: LabelTextStyle,),
          onPressed: Navigator.of(context).pop,
        ),
        FlatButton(
          child: Text('Ok', style: LabelTextStyle,),
          onPressed: (){
            Navigator.of(context).pop(widget.currentGlass);
          },
        )
      ],
    );
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