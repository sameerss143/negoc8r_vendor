import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateNewOffer extends StatefulWidget {
  CreateNewOffer({Key key}) : super(key: key);

  @override
  _CreateNewOfferState createState() => _CreateNewOfferState();
}

class _CreateNewOfferState extends State<CreateNewOffer> {
  String _category;
  String _subCategory;
  String _productId;
  int _quantity = 0;
  double _offerPrice = 0.0;
  final _formKey = GlobalKey<FormState>();
  User _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('New Offer'),
      ),
      body: new Form(
        key: _formKey,
        child: new ListView(
          //fields for product, location(fixed for each vendor), quantity and offer price
          children: <Widget>[
            //category
            DropdownButtonFormField(
              items: _getCategoryList(),
              // onChanged: (newValue) {
              //   _category = newValue.toString();
              //   setState(newValue);
              onChanged: (newValue) {
                setState(
                  () {
                    //if (newValue != null) {
                    _category = newValue;
                    //}
                  },
                );
              },
              hint: Text('Select Category'),
            ),
            //subcategory
            DropdownButtonFormField(
              items: _getSubCategoryList(),
              onChanged: (newValue) {
                setState(
                  () {
                    _subCategory = newValue;
                  },
                );
              },
              hint: Text('Select Sub-category'),
            ),
            //get product
            DropdownButtonFormField(
              items: _getProductList(),
              onChanged: (newValue) {
                setState(
                  () {
                    _productId = newValue;
                  },
                );
              },
              hint: Text('Select Product'),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Quantity',
              ),
              initialValue: '0',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value != null) {
                  _quantity = int.parse(value);
                } else {
                  _quantity = 0;
                }
              },
              validator: (value) {
                if (_quantity < 1 && _quantity > 10) {
                  return "Please enter less than 10 items";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Offer Price',
              ),
              initialValue: '0',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value != null) {
                  _offerPrice = double.parse(value);
                } else
                  _offerPrice = 0.0;
              },
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                //add offer to firestore
                print(
                    ': $_category > $_subCategory > $_productId > $_quantity > $_offerPrice');
                if (_validateForm()) {
                  _submitOffer();
                  print('Offer submitted');
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _getCategoryList() {
    //fetch products from inventory list
    return ['Mobile', 'Computer', 'Electronics', 'Fashion', 'HomeAppliances']
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e.toString(),
            ),
            value: e,
          ),
        )
        .toList();
  }

  _getSubCategoryList() {
    return ['Android', 'iPhone', 'Accessories']
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e.toString(),
            ),
            value: e,
          ),
        )
        .toList();
  }

  _getProductList() {
    //fetch products from inventory list
    return ['Goolge Pixel 4a', 'iPhone 11 Pro', 'Samsung A21']
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: e,
          ),
        )
        .toList();
  }

  _validateForm() {
    if (_formKey.currentState.validate()) {
      print('form is valid');
      return true;
    } else {
      return false;
    }
  }

  _submitOffer() async {
    try {
      await FirebaseFirestore.instance.collection('VendorOffer').add(
        {
          'vendorId': 'vendor/' + _user.uid,
          'city': 'Mumbai',
          'area': 'Ghatkopar',
          'subArea': 'Pantnagar',
          'productId': 'product/wyrBLHYu6uhsvBKSrSra',
          'quantity': _quantity,
          'offerPrice': _offerPrice,
          'isActive': true,
          'status': 'Active',
          'dateInserted': Timestamp.now(),
          'dateModified': Timestamp.now()
        },
      );
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
