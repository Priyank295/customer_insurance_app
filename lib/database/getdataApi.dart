import 'dart:convert';

import 'package:customer_insurance_app/models/accident.dart';
import 'package:customer_insurance_app/models/home.dart';
import 'package:customer_insurance_app/models/marine.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/automative.dart';
import '../models/medical.dart';
import '../models/pet.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

Future<User> getUsetData() async {
  // String id = '';
  SharedPreferences _pref = await SharedPreferences.getInstance();
  final id = await _pref.getString('id');
  print("id :" + id.toString());

  List<dynamic> json2 = [];

  final response = await http.get(Uri.parse(
      'https://soteria.thequantumtech.co.in/public/api/customer/${id.toString()}'));

  if (response.statusCode == 200) {
    print(json.decode(response.body));
    //  List<dynamic> jsonResponse = json.decode(response.body)[0]['data'];
    return User.fromJson(json.decode(response.body));
    // final json1 = "[" + response.body + "]";
    // json2 = json.decode(json1)[0]['data'];
    // print(json2[0]);
  } else {
    print(response.body);
  }

  return json2[0];
}
