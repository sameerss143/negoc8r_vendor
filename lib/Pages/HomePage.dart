import 'package:flutter/material.dart';
import 'package:negoc8r_vendor/MyWidgets/AppDrawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('NegoC8r Vendor App'),
      ),
      drawer: AppDrawer(),
      //add app drawer
      //drawer: build(context),
      body: new GridView.count(
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: <Widget>[
          new InkWell(
            onTap: () => Navigator.pushNamed(context, '/myorderpage'),
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.all(new Radius.circular(10.0)),
              ),
              alignment: Alignment(0, 0),
              child: Text(
                'My Orders',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              //color: Colors.blue[400],
            ),
          ),
          new InkWell(
            onTap: () => Navigator.pushNamed(context, '/myofferpage'),
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.all(new Radius.circular(10.0)),
              ),
              alignment: Alignment(0, 0),
              child: Text(
                'My Offers',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              //color: Colors.blue[400],
            ),
          ),
          new InkWell(
            onTap: () => Navigator.pushNamed(context, '/myinventorypage'),
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.purple[300],
                borderRadius: BorderRadius.all(new Radius.circular(10.0)),
              ),
              alignment: Alignment(0, 0),
              child: Text(
                'My Inventory',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              //color: Colors.blue[400],
            ),
          ),
          new InkWell(
            onTap: () => Navigator.pushNamed(context, '/newproductrequest'),
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.indigo[300],
                borderRadius: BorderRadius.all(new Radius.circular(10.0)),
              ),
              alignment: Alignment(0, 0),
              child: Text(
                'New Product Request',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              //color: Colors.blue[400],
            ),
          ),
        ],
      ),
    );
  }
}
