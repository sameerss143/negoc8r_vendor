import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:negoc8r_vendor/Pages/Offer/OfferDetailsPage.dart';

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
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('vendor').doc('ZE1hNqDPjcANClKDEQ9i').collection('myOffers').snapshots(),
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
              children: snapshot.data.docs.map((DocumentSnapshot vendorOffer) {
                return ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text(vendorOffer.data()['productName']),
                  //'Offer# Product Name: MRP: OfferPrice: No of Items#'),
                  subtitle: Text('Qty: ' +
                      vendorOffer.data()['quantityOfferred'].toString() +
                      ' Offer Price: ' +
                      vendorOffer.data()['offerPrice'].toString(),),
                  onTap: () {
                    //go to offer page
                    //Navigator.pushNamed(context, '/offerdetailspage', ve);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OfferDetailsPage(
                            vendorOffer: vendorOffer,
                          ),
                        ));
                  },
                );
              }).toList(),
            );
          }
        },
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
