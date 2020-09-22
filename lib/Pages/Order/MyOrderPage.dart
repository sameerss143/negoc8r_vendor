import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:negoc8r_vendor/Pages/Order/OrderDetailPage.dart';

class MyOrderPage extends StatefulWidget {
  MyOrderPage({Key key}) : super(key: key);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    User _user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: new AppBar(
        title: Text('My Order page'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('vendor')
            .doc(_user.uid)
            .collection('myOrder')
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
              children: snapshot.data.docs.map((DocumentSnapshot vendorOrder) {
                return ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text(vendorOrder.data()['productId']),
                  //'Offer# Product Name: MRP: OfferPrice: No of Items#'),
                  subtitle: Text(
                    'Qty: ' +
                        vendorOrder.data()['quantity'].toString() +
                        ' Offer Price: ' +
                        vendorOrder.data()['offerPrice'].toString(),
                  ),
                  onTap: () {
                    //go to offer page
                    //Navigator.pushNamed(context, '/offerdetailspage', ve);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetailPage(
                            vendorOrder: vendorOrder,
                          ),
                        ));
                  },
                );
              }).toList(),
            );
          }
        },
      ),
      // body: ListView(
      //   padding: const EdgeInsets.all(8),
      //   children: <Widget>[
      //     ListTile(
      //       title: Text('order#12334'),
      //       subtitle: Text('Product Name'),
      //       leading: new Image.network(
      //         'https://image-us.samsung.com/SamsungUS/home/mobile/phones/galaxy-a/galaxy-a21/pdp/06092020/PDP-GALLERY-A21-black-01-1600x1200.jpg',
      //         fit: BoxFit.scaleDown,
      //       ),
      //       trailing: Text('MRP\nBBP'),
      //       isThreeLine: true,
      //       onTap: () => Navigator.pushNamed(context, '/orderdetailpage'),
      //     ),
      //     Container(
      //       height: 50,
      //       color: Colors.blue[100],
      //       child: const Center(child: Text('order B')),
      //     ),
      //     Container(
      //       height: 50,
      //       color: Colors.blue[200],
      //       child: const Center(child: Text('order C')),
      //     ),
      //   ],
      // ),
    );
  }
}
