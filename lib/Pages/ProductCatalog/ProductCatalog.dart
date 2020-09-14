import 'package:flutter/material.dart';
//import 'package:negoc8r_customer/Pages/ProductList.dart';

class ProductCatalog extends StatelessWidget {
  const ProductCatalog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Product Category'),
      ),
      body: (GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            //color: Colors.blue[200],
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[200],
            ),
            child: IconButton(
              icon: Icon(
                Icons.phone_android,
                color: Colors.black,
                size: 100.0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/productlist');
              },
              //_openProductList(context, 'mobile'),
            ),
          ),

          /*
              IconButton(
              icon: Icon(Icons.phone), 
              onPressed: (){}),),
            ),
            padding: const EdgeInsets.all(8),
            const Text('Mobile'),
            color: Colors.teal[100],
            decoration: BoxDecoration(
              //border: Border.all(),
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(10),
               boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.33),
                  spreadRadius: 3,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ], */
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[200],
            ),
            child: IconButton(
              icon: Icon(
                Icons.laptop,
                color: Colors.black,
                size: 100.0,
              ),
              //onPressed: _openProductList(context, 'laptop'),
              onPressed: () {
                Navigator.pushNamed(context, '/productlist');
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[200],
            ),
            child: IconButton(
                icon: Icon(
                  Icons.devices,
                  color: Colors.black,
                  size: 100.0,
                ),
                onPressed: () {}),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[200],
            ),
            child: IconButton(
                icon: Icon(
                  Icons.camera,
                  color: Colors.black,
                  size: 100.0,
                ),
                onPressed: () {}),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[200],
            ),
            child: IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.black,
                  size: 100.0,
                ),
                onPressed: () {}),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[200],
            ),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                  size: 100.0,
                ),
                onPressed: () {}),
          ),
        ],
      )),
    );
  }

/*   _openProductList(BuildContext context, String productType) {
    if (productType == 'mobile') {
      try {
        Navigator.pushNamed(context, '/productlist');
      } catch (e) {
        print(e.toString());
      }
      {}
    } else {
      if (productType == 'laptop') {
        try {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProductList()));
        } catch (e) {
          print(e.toString());
        }
      }
    }
  } */
}