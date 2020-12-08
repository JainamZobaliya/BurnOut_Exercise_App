import 'package:burn_out/db/LogInPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:burn_out/db/ReusableCard.dart';
import 'package:burn_out/Theme.dart';
import 'package:flutter/material.dart';


class RegistrationPage extends StatefulWidget {
  static const routeName = '/registrationPage';
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String fullName, emailId, password, mobileNo;
  final TextEditingController _emailId = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mobileNo = TextEditingController();

  bool enabled = false;
  bool checked = false;
  bool _passwordVisible = false;
  int age = 28;
  int weight = 60;
  int height = 180;
  double minHeight = 120;
  double maxHeight = 220;
  bool _isSuccess;
  DatabaseReference mDatabase = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Sign Up', style: welcomeTextStyle,),
        backgroundColor: Color(0xFF03424F),
        iconTheme: IconThemeData(
        color: Color(0xFF53CA6B),
      ),
      ),
      body:Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("images/bg2.jpg"), fit: BoxFit.cover)),
         child: Center(
          child: SingleChildScrollView(
            child: registerForm(),
          ),
        ),
    ),
    );
  }

  Widget registerForm(){
    return Form(
        key: _formKey,
        child: Card(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: new Image.asset('images/logo.png',fit: BoxFit.fitWidth, height: 300),
                  margin: EdgeInsets.all(10.0),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      labelStyle:TextStyle(fontFamily: 'Times New Roman', fontSize: 20.0, color: Colors.white,),
                      focusColor: Colors.teal,
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    controller: _fullName,
                    validator: (String value) {
                      String pattern = r'(^[a-z A-Z,.\-]+$)';
                      RegExp regExp = new RegExp(pattern);
                      if (value.length == 0) {
                        return "Name cannot be Empty";
                      } else if (!regExp.hasMatch(value)) {
                        return "Name must have Alphabetic characters";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Email Id.',
                        hintText: "e.g abc@gmail.com",
                        labelStyle:TextStyle(fontFamily: 'Times New Roman', fontSize: 20.0, color: Colors.white,),
                        prefixIcon: Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      controller: _emailId,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String value) {
                        EmailValidator.validate(value)
                            ? null
                            : "Invalid Email Address";
                        return null;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(labelText: 'Password',
                      labelStyle:TextStyle(fontFamily: 'Times New Roman', fontSize: 20.0, color: Colors.white),
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.teal),
                      suffixIcon: IconButton(
                        tooltip: _passwordVisible ? "Hide Password" : " Show Password",
                        color: Colors.teal,
                        icon: Icon(
                          _passwordVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.teal,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    controller: _password,
                    obscureText: !_passwordVisible,
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      Pattern pattern =
                          r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                      RegExp regex = new RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return "Invalid Passsword";
                      } else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Mobile No.',
                        labelStyle: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontSize: 20.0,
                            color: Colors.white),
                        prefixIcon: Icon(Icons.phone, color: Colors.teal),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _mobileNo,
                      validator: (String value) {
                        String pattern = r'(^[0-9]*$)';
                        RegExp regExp = new RegExp(pattern);
                        if (value.length == 0) {
                          return "Mobile No. cannot be Empty";
                        } else if (value.length != 10) {
                          return "Must have 10 digits";
                        } else if (!regExp.hasMatch(value)) {
                          return "Mobile Number must only have digits";
                        }
                        return null;
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ReusableCard(
                    color: ActiveCardcol,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: LabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: NumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ReusableCard(
                    color: ActiveCardcol,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: LabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: NumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ReusableCard(
                    color: ActiveCardcol,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: LabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: NumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: LabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.tealAccent,
                            thumbColor: Colors.blue,
                            overlayColor: Colors.teal,
                            thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: minHeight,
                            max: maxHeight,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Send Notification",
                        style: TextStyle(fontSize: 18,color: Colors.teal),
                      ),
                      Switch(
                        onChanged: (bool val) {
                          setState(() {
                            enabled = val;
                          });
                        },
                        activeColor: Colors.tealAccent,
                        value: enabled,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  elevation: 15.0,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100.0)),
                  textColor: Color(0xFF53CA6B),
                  color: Color(0xFF03424F),
                  splashColor: Colors.tealAccent,
                  child: Text("Register", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _registerAccount();
                    }
                    else{
                      showMessageSnackBar("Please fill the valid Details!!");
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/8,
                ),
              ],
            ),
          ),
        ));
  }

  void _registerAccount() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailId.text,
      password: _password.text,
    )).user;
    var uid = user.uid;
    setAllValues(uid);
    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      showMessageSnackBar("Registration Successfull!!");
      onLoading(context);
    } else {
      _isSuccess = false;
    }
  }

  void setAllValues(var userId){
    int defaultValue = 0;
    mDatabase.child("users").child(userId).child("emailId").set(_emailId.text);
    mDatabase.child("users").child(userId).child("fullName").set(_fullName.text);
    mDatabase.child("users").child(userId).child("mobileNo").set(_mobileNo.text);
    mDatabase.child("users").child(userId).child("password").set(_password.text);
    mDatabase.child("users").child(userId).child("age").set(age);
    mDatabase.child("users").child(userId).child("height").set(height);
    mDatabase.child("users").child(userId).child("weight").set(weight);
    mDatabase.child("users").child(userId).child("seconds").set(defaultValue);
    mDatabase.child("users").child(userId).child("workout").set(defaultValue);
    mDatabase.child("users").child(userId).child("workoutTime").set("00:00:00");
    mDatabase.child("users").child(userId).child("waterTracker").child("glassConsumed").set(defaultValue);
    mDatabase.child("users").child(userId).child("waterTracker").child("history");
  }

  void showMessageSnackBar(String message) {
    final snackBar = new SnackBar(
      content: new Text("$message"),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Text("Please Verify your \n Email To Continue...."),
              ],
            ),
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3),
            () =>{Navigator.pop(context), //pop dialog
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return LogInPage();
          })),
        });
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
        width: 40.0,
        height: 40.0,
      ),
      elevation: 8.0,
      shape: CircleBorder(),
      fillColor: Colors.tealAccent,
      onPressed: onPressed,
    );
  }

}
