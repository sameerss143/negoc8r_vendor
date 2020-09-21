import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:negoc8r_vendor/Pages/MyAccount/MyShopPage.dart';

class MyAccountPage extends StatefulWidget {
  MyAccountPage({Key key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    User _user = FirebaseAuth.instance.currentUser;
    String _username = _user.displayName;
    String _email = _user.email;
    String _phoneNumber = _user.phoneNumber;
    String _imgURL = _user.photoURL;

    Future<DocumentSnapshot> _shopDetails = FirebaseFirestore.instance
        .collection('vendor')
        .doc(_user.uid)
        .collection('shopDetails')
        .doc('shop01')
        .get();

    //String _shopName = _shopDetails.;

    return Scaffold(
      appBar: new AppBar(
        title: Text('My Account'),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(_imgURL),
          Text('Vendor Id: ' + _user.uid),
          Text('Name: $_username'),
          Text('Email: $_email'),
          Text('Phone: $_phoneNumber'),
          SizedBox(
            width: 50,
            //height: 100,
            child: RaisedButton(
              child: Text('My Shop Details'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyShopPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
