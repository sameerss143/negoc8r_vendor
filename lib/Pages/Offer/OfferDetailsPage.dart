import 'package:flutter/material.dart';

class OfferDetailsPage extends StatefulWidget {
  OfferDetailsPage({Key key}) : super(key: key);

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
    );
  }
}
