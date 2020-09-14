import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOffersPage extends StatefulWidget {
  MyOffersPage({Key key}) : super(key: key);

  @override
  _MyOffersPageState createState() => _MyOffersPageState();
}

class _MyOffersPageState extends State<MyOffersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('My Offers'),
      ),
      //drawer: AppDrawer(),
      body: Text('List of offers'),
    );
  }
}
