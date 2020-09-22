import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  AddNewProduct({Key key}) : super(key: key);

  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final _formKey = GlobalKey<FormState>();

  String _category;
  String _subCategory;
  String _brand;
  String _name;
  String _color;
  String _shortDesc;
  String _longDesc;
  double _bbp;
  double _mrp;
  String _thumbnail;
  String _img1;
  String _img2;
  String _img3;
  String _img4;
  List<String> _images;
  //String _images = new List(4);
  double _avgRating;
  int _reviewCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Add new product'),
      ),
      body: Form(
        child: ListView(
          children: [
            //category
            DropdownButtonFormField(
                items: [
                  'Mobile & Accessories',
                  'PC & Laptop',
                  'Electronics',
                  'Camera & Accessories',
                  'Home & Kitchen Appliances',
                  'Fashion'
                ]
                    .map((e) =>
                        DropdownMenuItem(child: Text(e.toString()), value: e))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value;
                  });
                }),
            // TextFormField(
            //   decoration: InputDecoration(hintText: 'Category'),
            //   onChanged: (value) {
            //     _category = value;
            //   },
            //   initialValue: null,
            // ),
            //Sub-category
            TextFormField(
              decoration: InputDecoration(hintText: 'Sub-Category'),
              onChanged: (value) {
                _subCategory = value;
              },
              initialValue: null,
            ),
            //Brand
            TextFormField(
              decoration: InputDecoration(hintText: 'Brand'),
              onChanged: (value) {
                _brand = value;
              },
              initialValue: null,
            ),
            //product name
            TextFormField(
              decoration: InputDecoration(hintText: 'Product name'),
              onChanged: (value) {
                _name = value;
              },
              initialValue: null,
            ),
            //color
            TextFormField(
              decoration: InputDecoration(hintText: 'Color'),
              onChanged: (value) {
                _color = value;
              },
            ),
            //short desc
            TextFormField(
              decoration: InputDecoration(hintText: 'Short Desc'),
              onChanged: (value) {
                _shortDesc = value;
              },
              initialValue: null,
            ),
            //long desc
            TextFormField(
              decoration: InputDecoration(hintText: 'Long Desc'),
              onChanged: (value) {
                _longDesc = value;
              },
              initialValue: null,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'MRP'),
              onChanged: (value) {
                _mrp = double.parse(value);
              },
              initialValue: null,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'BBP'),
              onChanged: (value) {
                _bbp = double.parse(value);
              },
              initialValue: null,
            ),
            //thumbnail url
            TextFormField(
              decoration: InputDecoration(hintText: 'thumbnail'),
              onChanged: (value) {
                _thumbnail = value;
              },
              initialValue: null,
            ),
            //img 1
            TextFormField(
              decoration: InputDecoration(hintText: 'img 1'),
              onChanged: (value) {
                _img1 = value;
              },
              initialValue: null,
            ),
            //img2
            TextFormField(
              decoration: InputDecoration(hintText: 'img 2'),
              onChanged: (value) {
                _img2 = value;
              },
              initialValue: null,
            ),
            //img3
            TextFormField(
              decoration: InputDecoration(hintText: 'img 3'),
              onChanged: (value) {
                print('# $_images[0]');
                _img3 = value;
              },
              initialValue: null,
            ),

            //img4
            TextFormField(
              decoration: InputDecoration(hintText: 'img 4'),
              onChanged: (value) {
                _img4 = value;
              },
              initialValue: null,
            ),

            //reviews
            TextFormField(
              decoration: InputDecoration(hintText: 'Average Ratings'),
              onChanged: (value) {
                _avgRating = double.parse(value);
              },
              initialValue: null,
            ),

            //img4
            TextFormField(
              decoration: InputDecoration(hintText: 'Review Count'),
              onChanged: (value) {
                _reviewCount = int.parse(value);
              },
              initialValue: null,
            ),

            RaisedButton(
              child: Text('Submit product'),
              onPressed: () {
                _submitProduct();
                // if () {
                //   // } else {
                //   //   new AlertDialog(
                //   //     title: Text('Error'),
                //   //   );
                // }
                //_formKey.currentState.reset();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _submitProduct() async {
    try {
      _images = [_img1, _img2, _img3, _img4];
      await FirebaseFirestore.instance.collection('productRequest').add(
        {
          'productName': _name,
          'category': _category,
          'subCategory': _subCategory,
          'brand': _brand,
          'color': _color,
          'shortDescription': _shortDesc,
          'longDescription': _longDesc,
          'MRP': _mrp,
          'BBP': _bbp,
          'thumbnail': _thumbnail,
          'images': FieldValue.arrayUnion(_images),
          // 'image[0]': _img1,
          // 'image[1]': _img2,
          // 'image[2]': _img3,
          // 'image[3]': _img4,
          'numberOfReviews': _reviewCount,
          'averageRating': _avgRating,
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
