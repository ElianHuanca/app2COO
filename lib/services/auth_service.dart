import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBYkjsZeQGyr8xSfTdifdu6MiY1XT6AQb4';
  //final storage = new FlutterSecureStorage();

  Future<String> createUser( String email, String password ) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken
    });
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if ( decodedResp.containsKey('idToken') ) {
        // Token hay que guardarlo en un lugar seguro
        //await storage.write(key: 'token', value: decodedResp['idToken']);
        //decodedResp['idToken'];
        return 'null';
    } else {
      return decodedResp['error']['message'];
    }
  }
  

  Future<String> login( String email, String password ) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken
    });
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );

    if ( decodedResp.containsKey('idToken') ) {
        // Token hay que guardarlo en un lugar seguro
        //await storage.write(key: 'token', value: decodedResp['idToken']);
        //decodedResp['idToken'];
        return 'null';
    } else {
      return decodedResp['error']['message'];
    }
  }
}
