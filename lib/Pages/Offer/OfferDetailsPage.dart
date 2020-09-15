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
                widget.vendorOffer.data()['quantity'] +
                '\nOffer Price: ' +
                widget.vendorOffer.data()['offerPrice'].toString(),
          ),
        ],
      ),
    );
  }
}
