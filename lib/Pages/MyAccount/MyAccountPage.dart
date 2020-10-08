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

    String _username;
    String _email;
    String _phoneNumber;
    String _imgURL;
    String _shopName;
    String _shopPhone;
    String _city;
    String _area;
    String _subArea;
    String _addressLine1;
    String _addressLine2;

    if (_user != null) {
      _username = _user.displayName;
      _email = _user.email;
      _phoneNumber = _user.phoneNumber;
      _imgURL = _user.photoURL;
    }

    // Future<DocumentSnapshot> _shopDetails = FirebaseFirestore.instance
    //     .collection('vendor')
    //     .doc(_user.uid)
    //     .collection('shopDetails')
    //     .doc('shop01')
    //     .get();

    //String _shopName = _shopDetails.;

    return Scaffold(
      appBar: new AppBar(
        title: Text('My Account'),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            _imgURL,
            height: 100.0,
            width: 100.0,
          ),
          SizedBox(height: 10.0),
          //Text('Vendor Id: ' + _user.uid),
          // Text('Name: $_username'),
          // Text('Email: $_email'),
          // Text('Phone: $_phoneNumber'),
          // DefaultTextStyle(
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // child:
          FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('vendor')
                .doc(_user.uid)
                .collection('shopDetails')
                .doc('shop01')
                .get(),
            //initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  DocumentSnapshot shopDetails = snapshot.data;
                  _shopName = shopDetails.data()['shopName'];
                  _shopPhone = shopDetails.data()['phone'];
                  _city = shopDetails.data()['city'];
                  _area = shopDetails.data()['area'];
                  _subArea = shopDetails.data()['subArea'];
                  _addressLine1 = shopDetails.data()['addressLine1'];
                  _addressLine2 = shopDetails.data()['addressLine2'];

                  return Table(
                    columnWidths: {
                      0: FractionColumnWidth(0.07),
                      1: FractionColumnWidth(0.28),
                      2: FractionColumnWidth(0.65),
                    },
                    // border: TableBorder.all(
                    //   width: 5.0,
                    //   color: Colors.white,
                    // ),
                    children: [
                      TableRow(
                        children: [
                          Icon(Icons.account_box),
                          Text('Name'),
                          Text('$_username'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Icon(Icons.phone),
                          Text('Phone'),
                          Text('$_phoneNumber'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Icon(Icons.email),
                          Text('Email'),
                          Text('$_email'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Icon(Icons.home),
                          Text('Shop Name'),
                          Text('$_shopName'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Icon(Icons.phone),
                          Text('ShopPhone'),
                          Text('$_shopPhone'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Icon(Icons.location_city),
                          Text('City'),
                          Text('$_city'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Icon(Icons.location_city_outlined),
                          Text('Area'),
                          Text('$_area'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Icon(Icons.location_pin),
                          Text('SubArea'),
                          Text('$_subArea'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Icon(Icons.streetview),
                          Text('Address Line 1'),
                          Text('$_addressLine1'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Icon(Icons.streetview),
                          Text('Address Line 2'),
                          Text('' + '$_addressLine2'),
                        ],
                      ),
                    ],
                  );
                  break;
                case ConnectionState.active:
                case ConnectionState.none:
                case ConnectionState.waiting:
                default:
                  return Text('Waiting');
                  // return CircularProgressIndicator();
                  break;
              }

              // return Text('Shop Details \nShop Name: $_shopName' +
              //     '\nShop Phone: $_shopPhone' +
              //     '\nCity: $_city' +
              //     '\nArea: $_area' +
              //     '\nSubArea: $_subArea');
            },
          ),

          SizedBox(height: 20.0),
          SizedBox(
            //width: 200.0,
            child: ButtonTheme(
              minWidth: 100.0,
              //height: 33.0,
              buttonColor: Colors.grey[300],
              child: RaisedButton(
                child: Text('Update Shop Details'),
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
          ),
        ],
      ),
    );
  }
}
