import 'dart:convert';
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
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> httpPost(String url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    print('before actual post');
    return await _client
        .post(url, body: body, headers: headers, encoding: encoding)
        .timeout(Duration(seconds: 5))
        .then<dynamic>((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        dynamic error = _decoder.convert(res);
        throw (error["detail"]);
      }
      if (statusCode == 400) {
        dynamic error = _decoder.convert(res);
        throw (error["email"][0]);
      }
      return _decoder.convert(res);
    }).catchError((dynamic error, dynamic stackTrace) {
      // error is SecondError
      print('error $error');
      throw AuthenticationException(message: error);
    });
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
