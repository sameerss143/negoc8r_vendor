import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home Page'),
      ),
      body: new SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.panorama, color: Colors.blue[200], size: 100.0),
            new Icon(Icons.panorama, color: Colors.blue[200], size: 100.0),
            RaisedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/myorderpage');
              },
              icon: Icon(Icons.attach_file),
              label: Text('My Orders'),
            ),
          ],
        ),
      ),
    );
  }
}
