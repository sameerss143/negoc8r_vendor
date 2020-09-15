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
      //fetch all active orders of the vendor
      body: ListView(
        children: <Widget>[
          Text('List of offers'),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Offer# Product Name: MRP: OfferPrice: No of Items#'),
            onTap: () {
              //go to offer page
              Navigator.pushNamed(context, '/offerdetailspage');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //create new offer,
          Navigator.pushNamed(context, '/createnewoffer');
        },
      ),
    );
  }
}
