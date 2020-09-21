import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OfferDetailsPage extends StatefulWidget {
  final DocumentSnapshot vendorOffer;
  OfferDetailsPage({Key key, @required this.vendorOffer}) : super(key: key);

  @override
  _OfferDetailsPageState createState() => _OfferDetailsPageState();
}

class _OfferDetailsPageState extends State<OfferDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Offer Details'),
      ),
      body: Column(
        children: [
          Text(
            'Offer Id: ' +
                widget.vendorOffer.id +
                '\nProduct Id: ' +
                widget.vendorOffer.data()['productId'] +
                '\nQuantity: ' +
                widget.vendorOffer.data()['quantity'].toString() +
                '\nOffer Price: ' +
                widget.vendorOffer.data()['offerPrice'].toString(),
            style: TextStyle(fontSize: 20.0),
          ),
          //product details

          // new StreamBuilder(
          //   stream: FirebaseFirestore.instance
          //       .collection('product')
          //       .doc(widget.vendorOffer.data()['productId'])
          //       .snapshots(),
          //   builder: (context, snapshot) {
          //     if (!snapshot.hasData) {
          //       return new Text('Loading');
          //     } else {
          //       var product = snapshot.data;
          //       return new Text(
          //         product["productName"],
          //       );
          //     }
          //   },

          // Text(
          //   'Product name: '
          // ),
          //),
          Text(
            'Location: ' +
                widget.vendorOffer.data()['city'] +
                ' > ' +
                widget.vendorOffer.data()['area'] +
                ' > ' +
                widget.vendorOffer.data()['subArea'],
          ),
        ],
      ),
    );
  }
}
