import 'dart:io';

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class UserRepository {
  String authToken = "";
  User? user;

  Future<String> authenticate(
      String username, String password, String compCode) async {
    if (username != "wincom") {
      return "|Invalid username";
    }
    return "12456|";
  }

  Future<Map> loginBody(username, password, compCode) async {
    var map = Map<String, String>();

    //print(imei);
    map["name"] = username;
    map["fullname"] = "-";
    map["password"] = password;
    //map["access"] = "-";
    map["role"] = "-";
    map["company"] = compCode;
    map["location"] = "";
    map["access"] = "1";

    return map;
  }

  bool isAuthenticated() {
    if (authToken == "") return false;
    return true;
  }

  User getAuthUserInfo() {
    return User(branch: "JB", name: "wincom", company: "AB");
  }

  int decodeToken(token) {
    return 0;
    // 0;
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    return;
  }

  Future<bool> hasToken() async {
    //print("ada token");
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    return token != null;
  }

  Future<String> getTokenOnly() async {
    String token = "";
    try {
      final prefs = await SharedPreferences.getInstance();
      String? authToken = prefs.getString('token');
      token = (authToken == null) ? "" : authToken;
      // token = jsonObj["auth_token"];
    } catch (e) {
      token = "";
    }

    return token;
  }
}
