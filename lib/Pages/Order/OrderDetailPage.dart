import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  final DocumentSnapshot vendorOrder;
  OrderDetailPage({Key key, @required this.vendorOrder}) : super(key: key);

  @override
  _OrderDetailPageState createState() => new _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  User _user = FirebaseAuth.instance.currentUser;
  String _status;

  @override
  Widget build(BuildContext context) {
    //load order details
    //String _vendorId = widget.vendorOrder.id;
    String _productId = widget.vendorOrder.data()['productId'];
    String _productName = widget.vendorOrder.data()['productName'];
    String _quantity = widget.vendorOrder.data()['quantity'].toString();
    _status = widget.vendorOrder.data()['status'];
    String _thumbnail = widget.vendorOrder.data()['thumbnail'];
    String _orderPrice = widget.vendorOrder.data()['orderPrice'];
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Order Detail Page'),
      ),
      body: new ListView(
        // maxCrossAxisExtent: 150.0,
        // mainAxisSpacing: 4.0,
        // crossAxisSpacing: 4.0,
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          // new Image.network(
          //   'https://image-us.samsung.com/SamsungUS/home/mobile/phones/galaxy-a/galaxy-a21/pdp/06092020/PDP-GALLERY-A21-black-01-1600x1200.jpg',
          //   fit: BoxFit.scaleDown,
          // ),
          new Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                width: 100,
                height: 100,
                child: Image.network(_thumbnail),
              ),
              new Text(
                'Offer Id: ' +
                    widget.vendorOrder.id +
                    '\nProduct Id: $_productId' +
                    '\nProduct Id: $_productName' +
                    '\nQuantity: $_quantity' +
                    '\nOrder Price: $_orderPrice' +
                    '\nStatus: $_status',
                style: TextStyle(fontSize: 14.0),
              ),
              // new Text(
              //   'Price: ${widget.vendorOrder.data()['soldAtPrice'].toString()}',
              //   style: new TextStyle(
              //       fontSize: 14.0,
              //       color: const Color(0xFF000000),
              //       fontWeight: FontWeight.w200,
              //       fontFamily: "Roboto"),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text('Cancel'),
                    onPressed: _cancelOrder(_status),
                  ),
                  RaisedButton(
                    child: Text('Fulfill'),
                    onPressed: null,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _cancelOrder(String status) {
    if (status == 'Confirmed') {
      FirebaseFirestore.instance
          .collection('vendor')
          .doc(_user.uid)
          .collection('myOrder')
          .doc(widget.vendorOrder.id)
          .update({
        'status': 'Cancelled by Vendor',
        'isActive': false,
      });
      setState(() {
        _status = 'Cancelled by Vendor';
      });
    }
  }
}
