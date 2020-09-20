import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('About NegoC8r Vendor App'),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            'https://firebasestorage.googleapis.com/v0/b/negoc8r-dev.appspot.com/o/Images%2FLogo.png?alt=media&token=ee4103f0-ea73-43ae-a861-1ad74a80f0ca',
          ),
          Text('Compnay Name: '),
          Text('About us: '),
          Row(
            children: <Widget>[
              Text('Website: ' + 'https://negoc8r.com'),
              IconButton(
                icon: new Icon(Icons.launch),
                color: Colors.blue,
                onPressed: () {
                  // launch()
                },
              ),
              // InkWell(
              //   child: ('Visit Site'),
              //   //style: new TextStyle(color: Colors.blue),
              //   onTap: ,
              // ),
            ],
          ),
          Text('Email: '),
          Text('Phone: '),
          Text('Office: '),
        ],
      ),
    );
  }
}
