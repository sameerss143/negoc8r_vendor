import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  final DocumentSnapshot vendorOrder;
  OrderDetailPage({Key key, @required this.vendorOrder}) : super(key: key);

  @override
  _OrderDetailPageState createState() => new _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Order Detail Page'),
      ),
      body: new GridView.extent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          // new Image.network(
          //   'https://image-us.samsung.com/SamsungUS/home/mobile/phones/galaxy-a/galaxy-a21/pdp/06092020/PDP-GALLERY-A21-black-01-1600x1200.jpg',
          //   fit: BoxFit.scaleDown,
          // ),
          new Column(
            children: [
              new Text(
                'Offer Id: ' +
                    widget.vendorOrder.id +
                    '\nProduct Id: ' +
                    widget.vendorOrder.data()['productId'] +
                    '\nQuantity: ' +
                    widget.vendorOrder.data()['quantity'].toString() +
                    '\nOffer Price: ' +
                    widget.vendorOrder.data()['deliveryType'] +
                    '\nCustomer Id: ' +
                    widget.vendorOrder.data()['customerId'] +
                    '\nCustomer Phone: ' +
                    widget.vendorOrder.data()['customerPhone'],
                style: TextStyle(fontSize: 14.0),
              ),
              new Text(
                'Price: ${widget.vendorOrder.data()['soldAtPrice'].toString()}',
                style: new TextStyle(
                    fontSize: 14.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
