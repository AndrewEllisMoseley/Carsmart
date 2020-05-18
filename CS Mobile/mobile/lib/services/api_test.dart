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

/// ----------------------------------------------------------
/// Http Handshake
///
/// At application start up, the application needs to synchronize
/// with the server.
/// How does this work?
///   - A. If a previous token exists, the latter is sent to
///   -   the server to be validated.  If the validation is Ok,
///   -   the user is re-authenticated and a new token is returned
///   -   to the application.  The application then stores it.
///
///   - B. If no token exists, the application sends a request
///   -   for a new token to the server, which returns the
///   -   the requested token.  This token will be saved.
/// ----------------------------------------------------------
Future<String> handShake() async {
  String _status = "ERROR";

  return ajaxGet("handshake").then((String responseBody) async {
    Map response = json.decode(responseBody);
    _status = response["status"];
    switch (_status) {
      case "REQUIRES_AUTHENTICATION":
        // We received a new token, so let's save it.
        await _setMobileToken(response["data"]);
        break;

      case "INVALID":
        // The token we passed in invalid ??  why ?? somebody played with the local storage?
        // Anyways, we need to remove the previous one from the local storage,
        // and proceed with another handshake
        await _setMobileToken("");
        break;

      //TODO: add other cases
    }

    return _status;
  }).catchError(() {
    return "ERROR";
  });
}

/// ----------------------------------------------------------
/// Http "GET" request
/// ----------------------------------------------------------
Future<String> ajaxGet(String serviceName) async {
  var responseBody = '{"data": "", "status": "NOK"}';
  try {
    var response =
        await http.get(_baseURL + '/$_apiEndpoint$serviceName', headers: {
      'X-DEVICE-ID': await _getDeviceIdentity(),
      'X-TOKEN': await _getMobileToken(),
      'X-APP-ID': _appID
    });

    if (response.statusCode == 200) {
      responseBody = response.body;
    }
  } catch (e) {
    // An error was received
    throw Exception("AJAX ERROR");
  }
  return responseBody;
}

/// ----------------------------------------------------------
/// Http "POST" request
/// ----------------------------------------------------------
Future<Map> ajaxPost(String serviceName, Map data) async {
  var responseBody = json.decode('{"data": "", "status": "NOK"}');
  try {
    var response = await http.post(_baseURL + '/$_apiEndpoint$serviceName',
        body: json.encode(data),
        headers: {
          'X-DEVICE-ID': await _getDeviceIdentity(),
          'X-TOKEN': await _getMobileToken(),
          'X-APP-ID': _appID,
          'Content-Type': 'application/json; charset=utf-8'
        });
    if (response.statusCode == 200) {
      responseBody = json.decode(response.body);

      //
      // If we receive a new token, let's save it
      //
      if (responseBody["status"] == "TOKEN") {
        await _setMobileToken(responseBody["data"]);

        // TODO: rerun the Post request
      }
    }
  } catch (e) {
    // An error was received
    throw Exception("AJAX ERROR");
  }
  return responseBody;
}
