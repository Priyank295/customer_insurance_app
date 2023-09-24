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

Future<void> saveToken(String token, String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userToken', token);
  await prefs.setString("id", id);
}

//Get Country flags

//Store Home Insurance Data
Future<void> HomeInsuranceStoreData(Home data) async {
  final apiUrl = Uri.parse(
      'https://soteria.thequantumtech.co.in/public/api/home-insurance');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = await prefs.getString("userToken");
  print("Home :" + token.toString());
  print(jsonEncode(data));
  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Authorization': 'Bearer $token',
      "Accept": 'application/json'
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print(response.body);
    Map<String, dynamic> mData = await jsonDecode(response.body);
    // print(mData);

    // saveToken(data);
    // Data was successfully sent to the server.
    // You can handle the response here if the server sends any data back.
    print('Home Insurance Data Stored successfully');
  } else {
    // Handle the error, e.g., by showing an error message to the user.
    print('Failed to create user. Status code: ${response.body}');
  }
}

//Store Medical Insurance Data
Future<void> MedicalInsuranceData(Medical data) async {
  final apiUrl = Uri.parse(
      'https://soteria.thequantumtech.co.in/public/api/individual-insurance');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = await prefs.getString("userToken");
  print("Medical :" + token.toString());
  print(jsonEncode(data));
  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Accept':
          'application/json', // Set the Accept header to specify the response format
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print(response.body);
    Map<String, dynamic> mData = await jsonDecode(response.body);

    print('Medical Insurance Data Stored successfully');
  } else {
    // Handle the error, e.g., by showing an error message to the user.
    print('Failed to create user. Status code: ${response.body}');
  }
}

//Store Marine Insurance Data
Future<void> MarineInsuranceData(Marine data) async {
  final apiUrl = Uri.parse(
      'https://soteria.thequantumtech.co.in/public/api/marine-insurance');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = await prefs.getString("userToken");
  print("Marine :" + token.toString());
  print(jsonEncode(data));
  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Accept':
          'application/json', // Set the Accept header to specify the response format
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print(response.body);
    Map<String, dynamic> mData = await jsonDecode(response.body);

    print('Marine Insurance Data Stored successfully');
  } else {
    // Handle the error, e.g., by showing an error message to the user.
    print('Failed to create user. Status code: ${response.body}');
  }
}

//Store Pet Insurance Data
Future<void> PetInsuranceData(Pet data) async {
  final apiUrl = Uri.parse(
      'https://soteria.thequantumtech.co.in/public/api/petsinsurance-create');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = await prefs.getString("userToken");
  print("Marine :" + token.toString());
  print(jsonEncode(data));
  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Accept':
          'application/json', // Set the Accept header to specify the response format
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print(response.body);
    Map<String, dynamic> mData = await jsonDecode(response.body);

    print('Pet Insurance Data Stored successfully');
  } else {
    // Handle the error, e.g., by showing an error message to the user.
    print('Failed to create user. Status code: ${response.body}');
  }
}

//Store Automative Insurance Data
Future<void> AutomativeInsuranceData(Automative data) async {
  final apiUrl = Uri.parse(
      'https://soteria.thequantumtech.co.in/public/api/automative-insurance');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = await prefs.getString("userToken");
  print("Automative :" + token.toString());
  print(jsonEncode(data));
  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Accept':
          'application/json', // Set the Accept header to specify the response format
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print(response.body);
    Map<String, dynamic> mData = await jsonDecode(response.body);

    print('Automative Insurance Data Stored successfully');
  } else {
    // Handle the error, e.g., by showing an error message to the user.
    print('Failed to create user. Status code: ${response.body}');
  }
}

//Store Automative Insurance Data
Future<void> AccidentInsuranceData(Accident data) async {
  final apiUrl = Uri.parse(
      'https://soteria.thequantumtech.co.in/public/api/accident-insurance');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = await prefs.getString("userToken");
  print("Automative :" + token.toString());
  print(jsonEncode(data));
  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Accept':
          'application/json', // Set the Accept header to specify the response format
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print(response.body);
    Map<String, dynamic> mData = await jsonDecode(response.body);

    print('Accident Insurance Data Stored successfully');
  } else {
    // Handle the error, e.g., by showing an error message to the user.
    print('Failed to create user. Status code: ${response.body}');
  }
}

//Store Pet Insurance Data
Future<void> UpdateCustomer(Pet data) async {
  final apiUrl = Uri.parse(
      'https://soteria.thequantumtech.co.in/public/api/petsinsurance-create');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = await prefs.getString("userToken");
  print("Marine :" + token.toString());
  print(jsonEncode(data));
  final response = await http.post(
    apiUrl,
    headers: <String, String>{
      'Accept':
          'application/json', // Set the Accept header to specify the response format
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(data),
  );
}
