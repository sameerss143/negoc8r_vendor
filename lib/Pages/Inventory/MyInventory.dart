import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyInventoryPage extends StatefulWidget {
  MyInventoryPage({Key key}) : super(key: key);

  @override
  _MyInventoryPageState createState() => _MyInventoryPageState();
}

class _MyInventoryPageState extends State<MyInventoryPage> {
  User _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('My Inventory'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('vendor')
            .doc(_user.uid)
            .collection('myInventory')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          if (!snapshot.hasData) {
            return Center(
              //child: Text('data not fetched yet'),
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data.docs.map((DocumentSnapshot inventory) {
                String _thumbnail = inventory.data()['thumbnail'];
                bool _isThumbnailLoaded = _thumbnail.isNotEmpty;

                return ListTile(
                  leading: Container(
                    child: _isThumbnailLoaded
                        ? Image.network(inventory.data()['thumbnail'])
                        : Icon(Icons.network_check_outlined),
                    width: 50.0,
                  ),
                  title: Text(inventory.data()['productName']),
                  //'Offer# Product Name: MRP: OfferPrice: No of Items#'),
                  subtitle: Text(inventory.data()['brand']),
                  trailing: Text('MRP: ' +
                      inventory.data()['MRP'].toString() +
                      '\nBBP: ' +
                      inventory.data()['BBP'].toString()),
                  // subtitle: Text(
                  //   'Qty: ' +
                  //       inventory.data()['quantityOfferred'].toString() +
                  //       ' Offer Price: ' +
                  //       inventory.data()['offerPrice'].toString(),
                  // ),
                  // onTap: () {
                  //   //go to offer page
                  //   //Navigator.pushNamed(context, '/offerdetailspage', ve);

                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => OfferDetailsPage(
                  //           vendorOffer: vendorOffer,
                  //         ),
                  //       ));
                  // },
                );
              }).toList(),
            );
          }
        },
      ),
      floatingActionButton: RaisedButton(
        child: Text('Add new item'),
        onPressed: () {
          //create new offer,
          Navigator.pushNamed(context, '/productcatalog');
        },
      ),
    );
  }
}
