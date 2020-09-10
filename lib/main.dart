import 'package:flutter/material.dart';
import 'package:negoc8r_vendor/Pages/HomePage.dart';
import 'package:negoc8r_vendor/Pages/LoginPage.dart';
import 'package:negoc8r_vendor/Pages/Order/ActiveOrderPage.dart';
import 'package:negoc8r_vendor/Pages/Order/MyOrderPage.dart';
import 'package:negoc8r_vendor/Pages/Order/OrderDetailPage.dart';

//change
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    MaterialApp(
      //home: WelcomePage(),
      routes: <String, WidgetBuilder>{
        '/': (context) => LoginPage(),
        '/myhomepage': (context) => MyHomePage(),
        //'/loginpage': (context) => LoginPage(),
        '/myorderpage': (context) => MyOrderPage(),
        '/activeorderpage': (context) => ActiveOrderPage(),
        '/orderdetailpage': (context) => OrderDetailPage(),
        //'/vendoraccount': (context) => VendorAccountHome(),
        //'/signindemo': (context) => SignInDemo(),
      },
    ),
  );
}
