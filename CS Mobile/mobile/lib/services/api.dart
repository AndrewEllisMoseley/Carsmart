import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// The application ID
const String _appID = "";

// token storage key
const String _storageKeyToekn = "token";

// base URL
const String _baseURL = "http://localhost:8000";

// api endpoint on base url
const String _apiEndpoint = "/api/";

// unique device indentity
String _deviceIdentity = "";

// Method that will run once to gather the device indentity
final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

Future<String> _getDeviceIdentity() async {
  if (_deviceIdentity == '') {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo info = await _deviceInfoPlugin.androidInfo;
        _deviceIdentity = "${info.device}-${info.id}";
      } else if (Platform.isIOS) {
        IosDeviceInfo info = await _deviceInfoPlugin.iosInfo;
        _deviceIdentity = "${info.model}-${info.identifierForVendor}";
      }
    } on PlatformException {
      _deviceIdentity = "unknown";
    }
  }

  return _deviceIdentity;
}

/// ----------------------------------------------------------
/// Method that returns the token from Shared Preferences
/// ----------------------------------------------------------

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<String> _getMobileToken() async {
  final SharedPreferences prefs = await _prefs;

  return prefs.getString(_storageKeyToekn) ?? '';
}

/// ----------------------------------------------------------
/// Method that saves the token in Shared Preferences
/// ----------------------------------------------------------
Future<bool> _setMobileToken(String token) async {
  final SharedPreferences prefs = await _prefs;

  return prefs.setString(_storageKeyToekn, token);
}
