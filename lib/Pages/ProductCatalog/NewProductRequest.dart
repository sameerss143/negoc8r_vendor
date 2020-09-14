import 'package:flutter/material.dart';

class NewProductRequest extends StatefulWidget {
  NewProductRequest({Key key}) : super(key: key);

  @override
  _NewProductRequestState createState() => _NewProductRequestState();
}

class _NewProductRequestState extends State<NewProductRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('New Product Request'),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Text(
              'Enter product details',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Product Category
            DropdownButtonFormField(
              items: null,
              onChanged: null,
              hint: Text('Category'),
            ),
            //Product Sub-category
            DropdownButtonFormField(
              items: null,
              onChanged: null,
              hint: Text('Sub-category'),
            ),
            //Brand - Manufacturer
            DropdownButtonFormField(
              items: null,
              onChanged: null,
              hint: Text('Brand name'),
            ),
            //Product name
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Product Name',
              ),
            ),

            //add dynamic search based on product name
            RaisedButton(
              onPressed: null, //submit request and return to home page
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
