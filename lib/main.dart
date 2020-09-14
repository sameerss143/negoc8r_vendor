import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:negoc8r_vendor/Pages/HomePage.dart';
import 'package:negoc8r_vendor/Pages/Inventory/MyInventory.dart';
import 'package:negoc8r_vendor/Pages/LoginPage.dart';
import 'package:negoc8r_vendor/Pages/Order/ActiveOrderPage.dart';
import 'package:negoc8r_vendor/Pages/Order/MyOrderPage.dart';
import 'package:negoc8r_vendor/Pages/Order/OrderDetailPage.dart';
import 'package:negoc8r_vendor/Pages/ProductCatalog/NewProductRequest.dart';
import 'package:negoc8r_vendor/Pages/ProductCatalog/ProductCatalog.dart';
import 'package:negoc8r_vendor/Pages/ProductCatalog/ProductListPage.dart';
import 'package:negoc8r_vendor/Services/GoogleSignIn.dart';

import 'Pages/Offer/MyOffersPage.dart';

//change
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      //home: WelcomePage(),
      routes: <String, WidgetBuilder>{
        '/': (context) => LoginPage(),
        '/myhomepage': (context) => MyHomePage(),
        '/myorderpage': (context) => MyOrderPage(),
        '/myofferpage': (context) => MyOffersPage(),
        '/myinventorypage': (context) => MyInventoryPage(),
        '/activeorderpage': (context) => ActiveOrderPage(),
        '/orderdetailpage': (context) => OrderDetailPage(),
        '/productcatalog': (context) => ProductCatalog(),
        '/productlist': (context) => ProductListPage(),
        '/newproductrequest': (context) => NewProductRequest(),
        '/googlesignin': (context) => SignInDemo(),
        //'/vendoraccount': (context) => VendorAccountHome(),
        //'/loginpage': (context) => LoginPage(),
        //'/signindemo': (context) => SignInDemo(),
      },
    ),
  );
}
