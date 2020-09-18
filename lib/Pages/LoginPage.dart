import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('NegoC8r Vendor App'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Text(
            "Welcome to the new age of Selling.",
            style: new TextStyle(
                fontSize: 20.0,
                color: const Color(0xFF8a7f7f),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto"),
          ),
          new RaisedButton(
            key: null,
            onPressed: () {
              Navigator.pushNamed(context, '/googlesignin');
            },
            color: Colors.grey,
            child: new Text(
              "Sign in with Google",
              style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  //fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
          ),
          new RaisedButton(
            key: null,
            onPressed: buttonPressed,
            color: Colors.grey,
            child: new Text(
              "Sign in with Facebook",
              style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  //fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
          ),
          new RaisedButton(
            key: null,
            onPressed: null,
            // () {
            //   Navigator.pushNamed(context, '/addnewproduct');
            // },
            color: Colors.grey,
            child: new Text(
              "AddNewProduct",
              style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  //fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
          )
        ],
      ),
    );
  }

  void buttonPressed() {}
}
