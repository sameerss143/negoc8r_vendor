import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:negoc8r_vendor/Classes/RefLocations.dart';

class MyShopPage extends StatefulWidget {
  MyShopPage({Key key}) : super(key: key);

  @override
  _MyShopPageState createState() => _MyShopPageState();
}

class _MyShopPageState extends State<MyShopPage> {
  // String _locationFileURL =
  //     'https://firebasestorage.googleapis.com/v0/b/negoc8r-dev.appspot.com/o/Reference%2FLocations%2Flocations.json?alt=media&token=137b5af3-4322-4a03-bc44-f79f0d521e65';
  // String _data;
  // var _jsonFile;
  // String _response;
  String _shopName;
  String _addrLine1;
  String _addrLine2;
  String _phoneNumber;
  String _mapLocation;
  String _city;
  String _area;
  String _subArea;
  User _user = FirebaseAuth.instance.currentUser;

  List<City> _cityList = [
    City(id: '1', name: 'Mumbai'),
    City(id: '2', name: 'Navi Mumbai'),
    City(id: '3', name: 'Thane'),
    City(id: '4', name: 'Pune')
  ];
  List<Area> _areaList = [];
  List<SubArea> _subAreaList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop Details'),
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                //hintText: 'Enter shop name',
                labelText: 'Shop Name',
                labelStyle: TextStyle(fontSize: 14.0),
                alignLabelWithHint: true,
              ),
              //controller: _formKey,
              onChanged: (value) {
                _shopName = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                //hintText: 'Enter address line 1',
                labelText: 'Address Line 1',
                labelStyle: TextStyle(fontSize: 14.0),
                alignLabelWithHint: true,
              ),
              //controller: _formKey,
              onChanged: (value) {
                _addrLine1 = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                //hintText: 'Enter address line 1',
                labelText: 'Address Line 2',
                labelStyle: TextStyle(fontSize: 14.0),
                alignLabelWithHint: true,
              ),
              //controller: _formKey,
              onChanged: (value) {
                _addrLine2 = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                //hintText: 'Enter address line 1',
                labelText: 'Phone',
                labelStyle: TextStyle(fontSize: 14.0),
                alignLabelWithHint: true,
              ),
              //controller: _formKey,
              onChanged: (value) {
                _phoneNumber = value;
              },
            ),
            //City
            DropdownButtonFormField(
              hint: Text('Select City'),
              items: _getCityList(),
              onChanged: (value) {
                setState(() {
                  _city = value;
                  _areaList = [];
                  _subAreaList = [];
                  _setAreaList(_city);
                });
              },
            ),
            //Area
            DropdownButtonFormField(
              hint: Text('Select Area'),
              items: _getAreaList(),
              onChanged: (value) {
                setState(() {
                  _area = value;
                  _subAreaList = [];
                  _setSubAreaList(_area);
                });
              },
            ),
            //SubArea
            DropdownButtonFormField(
              hint: Text('Select Sub-Area'),
              items: _getSubAreaList(),
              onChanged: (value) {
                setState(() {
                  _subArea = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                //hintText: 'Enter map location',
                labelText: 'Map Location',
                labelStyle: TextStyle(fontSize: 14.0),
                alignLabelWithHint: true,
              ),
              //controller: _formKey,
              onChanged: (value) {
                _mapLocation = value;
              },
            ),
            RaisedButton(
              child: Text('Update'),
              onPressed: () => _updateShopDetails(),
            ),
          ],
        ),
      ),
    );
  }

  void _updateShopDetails() async {
    try {
      await FirebaseFirestore.instance
          .collection('vendor')
          .doc(_user.uid)
          .collection('shopDetails')
          .doc('shop01')
          .set(
        {
          'shopName': _shopName,
          'addressLine1': _addrLine1,
          'addressLine2': _addrLine2,
          'phone': _phoneNumber,
          'city': _city,
          'area': _area,
          'subArea': _subArea,
          'mapLocation': _mapLocation,
        },
      );
    } on Exception catch (e) {
      // TODO
      print(e.toString());
    }
  }
  // _updateShopDetails async() {
  //   await FirebaseFirestore.instance
  //       .collection('vendor')
  //       .doc(_user.uid)
  //       .collection('shopDetails')
  //       .doc()
  //       .set(
  //     {
  //       'shopName': _shopName,
  //       'addressLine1': _addrLine1,
  //       'addressLine2': _addrLine2,
  //       'phone': _phoneNumber,
  //       'city': _city,
  //       'area': _area,
  //       'subArea': _subArea,
  //       'mapLocation': _mapLocation,
  //     },
  //   );
  // }

  List<DropdownMenuItem<String>> _getCityList() {
    return _cityList.map((City c) {
      return DropdownMenuItem<String>(
        value: c.name,
        child: Text(c.name),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> _getAreaList() {
    return _areaList.map((Area c) {
      return DropdownMenuItem<String>(
        value: c.name,
        child: Text(c.name),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> _getSubAreaList() {
    return _subAreaList.map((SubArea c) {
      return DropdownMenuItem<String>(
        value: c.name,
        child: Text(c.name),
      );
    }).toList();
  }

  _setAreaList(String city) {
    print('City : $city');
    switch (city) {
      case 'Mumbai':
        _areaList = [
          Area(id: '1', name: 'Ghatkopar'),
          Area(id: '2', name: 'Mulund'),
          Area(id: '3', name: 'Kanjur Marg'),
          Area(id: '4', name: 'Dadar'),
          Area(id: '5', name: 'Boriwali'),
          Area(id: '6', name: 'Kandiwali'),
          Area(id: '7', name: 'Andheri'),
          Area(id: '8', name: 'Vikhroli'),
        ];
        break;
      case 'Thane':
        _areaList = [
          Area(id: '1', name: 'Dombivli'),
          Area(id: '2', name: 'Kalyan'),
          Area(id: '3', name: 'Thane'),
          Area(id: '4', name: 'Kalwa'),
          Area(id: '5', name: 'Mumbra'),
          Area(id: '6', name: 'Diva'),
          Area(id: '7', name: 'Thakurli'),
          Area(id: '8', name: 'Ulhasnagar'),
        ];
        break;
      case 'Navi Mumbai':
        _areaList = [
          Area(id: '1', name: 'Airoli'),
          Area(id: '2', name: 'Rabale'),
          Area(id: '3', name: 'Vashi'),
          Area(id: '4', name: 'Panvel'),
          Area(id: '5', name: 'Koparkhairane'),
          Area(id: '6', name: 'Belapur'),
          Area(id: '7', name: 'Turbhe'),
          Area(id: '8', name: 'Nerul'),
        ];
        break;
      case 'Pune':
        _areaList = [
          Area(id: '1', name: 'Pune'),
          Area(id: '2', name: 'Shivaji Nagar'),
          Area(id: '3', name: 'Wakad'),
          Area(id: '4', name: 'Viman nagar'),
          Area(id: '5', name: 'Hadapsar'),
          Area(id: '6', name: 'Bibwewadi'),
          Area(id: '7', name: 'Pimpri'),
          Area(id: '8', name: 'Chinchwad'),
          Area(id: '8', name: 'Hinjewadi'),
        ];
        break;
      default:
        _areaList = [];
    }
  }

  _setSubAreaList(String area) {
    switch (area) {
      case 'Ghatkopar':
        _subAreaList = [
          SubArea(id: '1', name: 'Pantnagar'),
          SubArea(id: '2', name: 'Bhatwadi'),
          SubArea(id: '3', name: 'Garudiya'),
          SubArea(id: '4', name: 'Samta Colony'),
          SubArea(id: '5', name: 'Naidu Colony'),
        ];
        break;
      case 'Mulund':
        _subAreaList = [
          SubArea(id: '1', name: 'Indira nagar'),
          SubArea(id: '2', name: 'Sarvodaya nagar'),
          SubArea(id: '3', name: 'Garudiya'),
          SubArea(id: '4', name: 'Salpa Devi Pada'),
          SubArea(id: '5', name: 'Tambe nagar'),
        ];
        break;

      case 'Hinjewadi':
        _subAreaList = [
          SubArea(id: '1', name: 'Phase 1'),
          SubArea(id: '2', name: 'Phase 2'),
          SubArea(id: '3', name: 'Phase 3'),
        ];
        break;

      case 'Bibwewadi':
        _subAreaList = [
          SubArea(id: '1', name: 'Indira nagar'),
          SubArea(id: '2', name: 'Sant Eknath nagar'),
          SubArea(id: '3', name: 'Shivtej nagar'),
          SubArea(id: '3', name: 'Chaitraban'),
        ];
        break;
      default:
    }
  }
}
// if (area == 'Ghatkopar') {
//   _subAreaList = [
//     SubArea(id: '1', name: 'Pantnagar'),
//     SubArea(id: '2', name: 'Bhatwadi'),
//     SubArea(id: '3', name: 'Garudiya'),
//     SubArea(id: '4', name: 'Samta Colony'),
//     SubArea(id: '5', name: 'Naidu Colony'),
//   ];
// }

//_updateShopDetails() {}

// List<DropdownMenuItem> _getCityList() {
//   return ['Mumbai', 'Pune', 'Thane', 'Navi Mumbai']
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

// Future<String> _readLocationJson() async {

//    _readLocationJson();

//   _data = _response;
//   _jsonFile = JsonDecoder().convert(_data);

//   //Future.delayed(duration: Duration.secondsPerHour);

//   print(
//     '#1 jsonfile: ' + _jsonFile.toString(),
//   );

//   _cityList = _jsonFile.map<City>((_data) {
//     return City.fromJson(_jsonFile);
//   }).toList();
//   //print('#2' + _cityList.toString());
//   var response = await http.get(_locationFileURL);
//   _response = response.body;
//   return _response;
//   //print(response.toString());
//return (json.decode(_data));

//print(_jsonFile.toString());
// for (var city in _jsonFile) {
//   //var area = city['area'];
// print(
//   '#' + city['id'].toString() + city['city'],
// );
// for (var area in city['area']) {
//   print('## ' + area['name']);
//   for (var subArea in area['subArea']) {
//     print('### ' + subArea['name']);
//   }
// }

//print('#' + city.toString());

// for (city['area'] in city) {
// print('#' + area['id'].toString() + area['name']);
// }
//}
//}
