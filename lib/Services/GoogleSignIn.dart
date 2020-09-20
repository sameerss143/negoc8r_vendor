// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
//import 'dart:convert' show json;

//import "package:http/http.dart" as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/user.phonenumbers.read',
    'https://www.googleapis.com/auth/userinfo.profile',
    //'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Google Sign In',
//       home: SignInDemo(),
//     ),
//   );
// }

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount _currentUser;
  String _contactText;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        print('user logged in successfully');
        _updateVendorAccount();
        //_handleGetContact();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      print('Logged in successfully');

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      print(error);
    }
  }

  Future<void> _gotoHome() async {
    Navigator.popUntil(
      context,
      ModalRoute.withName('/myhomepage'),
    );
    Navigator.pushNamed(context, '/myhomepage');
  }

  Future<void> _handleSignOut() {
    _googleSignIn.disconnect();
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  Widget _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          const Text("Signed in successfully."),
          Text(_contactText ?? ''),
          RaisedButton(
            child: const Text('Go to Home Page'),
            textColor: Colors.white,
            onPressed: () => _gotoHome(),
            //() => Navigator.pushNamed(context, '/myhomepage'),
            color: Colors.green[400],
          ),
          RaisedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
            color: Colors.red[400],
          ),
          // RaisedButton(
          //   child: const Text('REFRESH'),
          //   onPressed: _handleGetContact,
          // ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          RaisedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }

  _updateVendorAccount() async {
    //FirebaseFirestore.instance.collection('vendor').add();
  }
}

// Future<void> _handleGetContact() async {
//   setState(() {
//     _contactText = "Loading contact info...";
//   });
//   final http.Response response = await http.get(
//     'https://people.googleapis.com/v1/people/me/connections'
//     '?requestMask.includeField=person.names',
//     headers: await _currentUser.authHeaders,
//   );
//   if (response.statusCode != 200) {
//     setState(() {
//       _contactText = "People API gave a ${response.statusCode} "
//           "response. Check logs for details.";
//     });
//     print('People API ${response.statusCode} response: ${response.body}');
//     return;
//   }
//   final Map<String, dynamic> data = json.decode(response.body);
//   final String namedContact = _pickFirstNamedContact(data);
//   setState(() {
//     if (namedContact != null) {
//       _contactText = "I see you know $namedContact!";
//     } else {
//       _contactText = "No contacts to display.";
//     }
//   });
// }

// String _pickFirstNamedContact(Map<String, dynamic> data) {
//   final List<dynamic> connections = data['connections'];
//   final Map<String, dynamic> contact = connections?.firstWhere(
//     (dynamic contact) => contact['names'] != null,
//     orElse: () => null,
//   );
//   if (contact != null) {
//     final Map<String, dynamic> name = contact['names'].firstWhere(
//       (dynamic name) => name['displayName'] != null,
//       orElse: () => null,
//     );
//     if (name != null) {
//       return name['displayName'];
//     }
//   }
//   return null;
// }
