import 'package:flutter/material.dart';

class MyInventoryPage extends StatefulWidget {
  MyInventoryPage({Key key}) : super(key: key);

  @override
  _MyInventoryPageState createState() => _MyInventoryPageState();
}

class _MyInventoryPageState extends State<MyInventoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('My Inventory'),
      ),
      body: ListView(
        children: <Widget>[
          Text('List of existing items:'),
          ListTile(
            title: Text('Product Name'),
            leading: Icon(Icons.ac_unit),
            trailing: Text('Total: XX \nSold: XX'),
          ),
          RaisedButton(
            child: Text('Add New Item'),
            onPressed: () {
              Navigator.pushNamed(context, '/productcatalog');
            },
          ),
        ],
      ),
    );
  }
}
