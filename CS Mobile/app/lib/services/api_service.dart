import 'dart:convert';
import 'package:app/config/settings.dart';
import 'package:app/exceptions/exceptions.dart';
import 'package:app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  final JsonDecoder _decoder = JsonDecoder();
  final _client = new http.Client();
  String _accessToken = "token";
  String _refreshToken = "token";
  User user;

  Future<dynamic> httpGet(String url) {
    return _client.get(url).then<dynamic>((http.Response response) {
      final String data = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || data == null) {
        throw Exception("Error while fetching data");
      }
      return json.decode(data);
    });
  }

  Future<dynamic> httpPost(String url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    final response = await _client
        .post(url, body: body, headers: headers, encoding: encoding)
        .timeout(Duration(seconds: 5))
        .catchError((dynamic error, dynamic stackTrace) {
      throw AuthenticationException(message: error);
    });
    final String data = response.body;
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || data == null) {
      dynamic error = _decoder.convert(data);
      throw (error["detail"]);
    }
    if (statusCode == 400) {
      dynamic error = _decoder.convert(data);
      throw AuthenticationException(message: error["email"][0]);
    }

    return json.decode(response.body);
  }

  Future<dynamic> httpGetWithBearer(String url, String bearer) async {
    var headers = {
      'accept': 'application/json',
      'authorization': 'Bearer $accessToken',
    };
    final response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode != 200) {
      dynamic error = _decoder.convert(response.body);
      throw AuthenticationException(message: error["reason"]);
    }

    return json.decode(response.body);
  }

  Future<dynamic> httpPostWithBearer(
      String url, String bearer, dynamic body) async {
    var headers = {
      'accept': 'application/json',
      'authorization': 'Bearer $accessToken',
    };
    print(url);
    print(bearer);
    print(body);
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    if (response.statusCode != 200) {
      throw Exception('http.get error: statusCode= ${response.statusCode}');
    }

    return json.decode(response.body);
  }

  Future<dynamic> httpGetWithImage(String url) async {
    print(url);
    var headers = {
      'accept': 'image/png',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode != 200) {
      throw Exception('http.get error: statusCode= ${response.statusCode}');
    }
    return response;
  }

  /// ----------------------------------------------------------
  /// Method that returns the token from Shared Preferences
  /// ----------------------------------------------------------

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> getAccessToken() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(_accessToken) ?? '';
  }

  /// ----------------------------------------------------------
  /// Method that saves the token in Shared Preferences
  /// ----------------------------------------------------------
  void setAccessToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(_accessToken, token);
  }

  /// ----------------------------------------------------------
  /// Method that returns the token from Shared Preferences
  /// ----------------------------------------------------------

  Future<String> getRefreshToken() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(_refreshToken) ?? '';
  }

  /// ----------------------------------------------------------
  /// Method that saves the token in Shared Preferences
  /// ----------------------------------------------------------
  void setRefreshToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(_refreshToken, token);
  }

  /// ----------------------------------------------------------
  /// Method that removes all shared preference data
  /// ----------------------------------------------------------
  void clearSharedPreference() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }
}

HttpService httpService = new HttpService();
