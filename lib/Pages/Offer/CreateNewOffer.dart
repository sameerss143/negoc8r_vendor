import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:negoc8r_vendor/Classes/VendorAccount.dart';

class CreateNewOffer extends StatefulWidget {
  CreateNewOffer({Key key}) : super(key: key);

  @override
  _CreateNewOfferState createState() => _CreateNewOfferState();
}

class _CreateNewOfferState extends State<CreateNewOffer> {
  // String _category;
  // String _subCategory;
  String _shopName;
  String _city;
  String _area;
  String _subArea;
  String _productName;
  String _productId;
  //ProductObj _productObj;
  int _quantity = 0;
  double _offerPrice = 0.0;
  final _formKey = GlobalKey<FormState>();
  User _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // Document _shopDetails = await FirebaseFirestore.instance
    //     .collection('vendor')
    //     .doc(_user.uid)
    //     .collection('shopDetails')
    //     .doc('shop01');

    // String _shopName = shopDetails.data()['shopName'];

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
            // DropdownButtonFormField(
            //   items: _getCategoryList(),
            //   // onChanged: (newValue) {
            //   //   _category = newValue.toString();
            //   //   setState(newValue);
            //   onChanged: (newValue) {
            //     setState(
            //       () {
            //         //if (newValue != null) {
            //         _category = newValue;
            //         //}
            //       },
            //     );
            //   },
            //   hint: Text('Select Category'),
            // ),
            // //subcategory
            // DropdownButtonFormField(
            //   items: _getSubCategoryList(),
            //   onChanged: (newValue) {
            //     setState(
            //       () {
            //         _subCategory = newValue;
            //       },
            //     );
            //   },
            //   hint: Text('Select Sub-category'),
            // ),
            //get product
            new StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('vendor')
                  .doc(_user.uid)
                  .collection('myInventory')
                  .snapshots(),
              builder: (context, snapshot) {
                //fill dropdown items
                if (!snapshot.hasData) {
                  return Text('Data Loading');
                } else {
                  //create list
                  List<DropdownMenuItem> productList = [];
                  for (int i = 0; i < snapshot.data.docs.length; i++) {
                    DocumentSnapshot product = snapshot.data.docs[i];
                    String productName = product.data()['productName'];
                    String productId = product.data()['productId'];
                    String mrp = product.data()['MRP'].toString();
                    String bbp = product.data()['BBP'].toString();
                    //print('# $i : $productId : $productName');
                    productList.add(
                      DropdownMenuItem(
                        child: Text('$productName'),
                        value: productId,
                        // ProductObj(
                        //   productId: productId,
                        //   productName: productName,
                        // ),
                      ),
                    );
                  }
                  //assign list to dropdown
                  return DropdownButtonFormField(
                    items: productList,
                    value: _productId,
                    onChanged: (newValue) {
                      setState(
                        () {
                          _productId = newValue;
                        },
                      );
                    },
                  );
                }
              },
            ),

            //
            // DropdownButtonFormField(
            //   items: null,
            //   onChanged: (newValue) {
            //     setState(
            //       () {
            //         _productId = newValue;
            //       },
            //     );
            //   },
            //   hint: Text('Select Product'),
            // ),
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
                // print(
                //     ': $_category > $_subCategory > $_productId > $_quantity > $_offerPrice');
                if (_validateForm()) {
                  _submitOffer();
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // _getCategoryList() {
  //   //fetch products from inventory list
  //   return ['Mobile', 'Computer', 'Electronics', 'Fashion', 'HomeAppliances']
  //       .map(
  //         (e) => DropdownMenuItem(
  //           child: Text(
  //             e.toString(),
  //           ),
  //           value: e,
  //         ),
  //       )
  //       .toList();
  // }

  // _getSubCategoryList() {
  //   return ['Android', 'iPhone', 'Accessories']
  //       .map(
  //         (e) => DropdownMenuItem(
  //           child: Text(
  //             e.toString(),
  //           ),
  //           value: e,
  //         ),
  //       )
  //       .toList();
  // }

  // Future<List<DropdownMenuItem>> _getProductList() async {
  //   //fetch products from inventory list
  //   // return StreamBuilder(
  //   //     stream: FirebaseFirestore.instance
  //   //         .collection('vendor')
  //   //         .doc(_user.uid)
  //   //         .collection('myInventory')
  //   //         .snapshots(),
  //   //     //initialData: initialData ,
  //   //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //   //       return
  //   //     });
  //   // return ['Goolge Pixel 4a', 'iPhone 11 Pro', 'Samsung A21']
  //   //     .map(
  //   //       (e) => DropdownMenuItem(
  //   //         child: Text(e),
  //   //         value: e,
  //   //       ),
  //   //     )
  //   //     .toList();
  // }

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
      //vendors offer collection
      await FirebaseFirestore.instance
          .collection('vendor')
          .doc(_user.uid)
          .collection('myOffer')
          .add(
        {
          'vendorId': _user.uid,
          'city': 'Mumbai',
          'area': 'Ghatkopar',
          'subArea': 'Pantnagar',
          'productId': _productId,
          'productName': _productName,
          'quantity': _quantity,
          'offerPrice': _offerPrice,
          'isActive': true,
          'status': 'Active',
          'dateInserted': Timestamp.now(),
          'dateModified': Timestamp.now()
        },
      );

//all offers collection
      await FirebaseFirestore.instance.collection('VendorOffer').add(
        {
          'vendorId': _user.uid,
          'vendorName': _user.displayName,
          'city': 'Mumbai',
          'area': 'Ghatkopar',
          'subArea': 'Pantnagar',
          'productId': _productId,
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

// class ProductObj {
//   String productId;
//   String productName;

//   ProductObj({this.productId, this.productName});
// }
