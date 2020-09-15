import 'package:flutter/material.dart';

class ActiveOrderPage extends StatefulWidget {
  ActiveOrderPage({Key key}) : super(key: key);
  @override
  _ActiveOrderPageState createState() => new _ActiveOrderPageState();
}

class _ActiveOrderPageState extends State<ActiveOrderPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Active Orders'),
      ),
      body: new ListView(
        children: <Widget>[
          //fetch all active orders of the vendor
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/orderdetailpage'),
            leading: Text(
              "Product Name",
              style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"),
            ),
            title: Text(
              'MRP: XXX.xx\nBBP: XXX.xx',
              style: new TextStyle(
                fontSize: 14.0,
              ),
            ),
            trailing: Image.network(
                'https://image-us.samsung.com/SamsungUS/home/mobile/phones/galaxy-a/galaxy-a21/pdp/06092020/PDP-GALLERY-A21-black-01-1600x1200.jpg'
                //fit: BoxFit.fill,
                ),
          ),
          // new Icon(Icons.insert_emoticon,
          //     color: const Color(0xFF000000), size: 48.0),
          // ),
        ],
      ),
    );
  }
}
