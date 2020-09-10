import 'package:flutter/material.dart';

class MyOrderPage extends StatefulWidget {
  MyOrderPage({Key key}) : super(key: key);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('My order page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: Text('order#12334'),
            subtitle: Text('Product Name'),
            leading: new Image.network(
              'https://image-us.samsung.com/SamsungUS/home/mobile/phones/galaxy-a/galaxy-a21/pdp/06092020/PDP-GALLERY-A21-black-01-1600x1200.jpg',
              fit: BoxFit.scaleDown,
            ),
            trailing: Text('MRP\nBBP'),
            isThreeLine: true,
            onTap: () => Navigator.pushNamed(context, '/orderdetailpage'),
          ),
          Container(
            height: 50,
            color: Colors.blue[100],
            child: const Center(child: Text('order B')),
          ),
          Container(
            height: 50,
            color: Colors.blue[200],
            child: const Center(child: Text('order C')),
          ),
        ],
      ),
    );
  }
}
