import 'package:burn_out/screens/UserProfile.dart';
import 'package:burn_out/screens/HomePage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:burn_out/Theme.dart';

class LogInPage extends StatefulWidget {
  static const routeName = '/logInPage';
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  bool _passwordVisible = false;
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg2.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'Log In',
              style: welcomeTextStyle,
            ),
            backgroundColor: Colors.teal,
          ),
          body: Stack(
            children: <Widget>[
              Center(
                child: SingleChildScrollView(
                  child: Container(
                    // margin: EdgeInsets.all(15.0),
                    height: MediaQuery.of(context).size.height,
                    child: Form(
                      key: _key,
                      child: logInForm(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget logInForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            child: new Image.asset('images/logo.png',
                fit: BoxFit.fitWidth, height: 300),
            padding: EdgeInsets.only(top: 30.0)),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Id.',
                labelStyle: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                focusColor: Colors.teal,
                prefixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (String value) {
                EmailValidator.validate(value) ? null : "Invalid Email Address";
                return null;
              }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextFormField(
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 20.0,
                  color: Colors.white),
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
            controller: _passwordController,
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
        MaterialButton(
          elevation: 15.0,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(100.0)),
          textColor: Color(0xFF53CA6B),
          color: Color(0xFF03424F),
          splashColor: Colors.tealAccent,
          child: Text(
            "Log In",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          onPressed: () async {
            Center(
              child: CircularProgressIndicator(),
            );
            if (_key.currentState.validate()) {
              _signInWithEmailAndPassword();
            } else {
              showMessageSnackBar("Please fill the valid Details!!");
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      final user1 = _auth.currentUser;
      var userId = user1.uid;
      UserProfile me = new UserProfile(userId: userId);
      print("Me: $me");
      if (!user.emailVerified) {
        showMessageSnackBar("Please Verify your Email.");
        await user.sendEmailVerification();
      } else {
        onLoading(context, me);
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void showMessageSnackBar(String message) {
    final snackBar = new SnackBar(
      content: new Text("$message"),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  // ignore: unused_element
  void _signOut() async {
    await _auth.signOut();
  }

  void onLoading(BuildContext context, UserProfile me) {
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
                new Text("Loading"),
              ],
            ),
          ),
        );
      },
    );
    new Future.delayed(
        new Duration(seconds: 3),
        () => {
              Navigator.pop(context), //pop dialog
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return HomePage(
                  me: me,
                );
              })),
            });
  }
}
