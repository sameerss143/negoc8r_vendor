import 'package:flutter/material.dart';

class MyInventoryPage extends StatefulWidget {
  MyInventoryPage({Key key}) : super(key: key);

  @override
  _MyInventoryPageState createState() => _MyInventoryPageState();
}

class _MyInventoryPageState extends State<MyInventoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('My Inventory'),
      ),
      body: RaisedButton(onPressed: () {
        Navigator.pushNamed(context, '/productcatalog');
      }),
    );
  }
}
