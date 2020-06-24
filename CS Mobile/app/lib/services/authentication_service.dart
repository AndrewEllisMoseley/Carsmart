import 'dart:convert';
import 'package:app/config/settings.dart';
import 'package:app/services/services.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import '../models/models.dart';

abstract class AuthenticationService with HttpService {
  Future<User> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> completeRegistration(String firstName, String lastName,
      String company, String job, String email, String password);
  dynamic decodeJWT(String token);
  Future<void> signOut();
}

class AuthService extends AuthenticationService {
  @override
  Future<User> getCurrentUser() async {
    dynamic currentToken = await getAccessToken();
    if (currentToken == '') {
      return null;
    }
    String decodedToken = B64urlEncRfc7515.decodeUtf8(currentToken);
    // String jwtUserData = json.encode(decodedToken);
    return User.fromJson(jsonDecode(decodedToken));
  }

  // ---------------------------------------------------------------------
  // Method that authenticates the user during login
  // ---------------------------------------------------------------------
  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    await Future.delayed(Duration(seconds: 3));
    dynamic jwtData = await accessToken(email, password);
    dynamic userJsonData = decodeJWT(jwtData.toString());
    return User.fromJson(userJsonData);
  }

  // ---------------------------------------------------------------------
  // Method that signs out the user
  // ---------------------------------------------------------------------
  @override
  Future<void> signOut() {
    clearSharedPreference();
    User(
        firstName: null,
        lastName: null,
        email: null,
        username: null,
        company: null,
        job: null,
        tokenExpiry: null);
    return null;
  }

  // ---------------------------------------------------------------------
  // Method that registers the user new account with the backend
  // ---------------------------------------------------------------------
  @override
  Future<User> completeRegistration(String firstName, String lastName,
      String company, String job, String email, String password) async {
    String url = '$baseURL$registerUser';
    print('$firstName, $lastName, $company, $job, $email, $password');
    await Future.delayed(Duration(seconds: 5));
    await httpPost(url, body: {
      "username": firstName,
      "first_name": firstName,
      "last_name": lastName,
      "company": company,
      "job": job,
      "email": email,
      "password": password
    });
    dynamic jwtData = await accessToken(email, password);
    dynamic userJsonData = decodeJWT(jwtData.toString());
    return User.fromJson(userJsonData);
  }

  Future<dynamic> accessToken(String email, String password) async {
    String url = '$baseURL$accessTokenEndpoint';
    dynamic token = await httpPost(url, body: {
      "username": "",
      "email": email,
      "password": password,
    }).then<dynamic>((dynamic res) async {
      // await _setMobileToken(res.toString());
      return res;
    });
    return token;
  }

  // ---------------------------------------------------------------------
  // Method that decodes the JWT token sent by the backend to obtain the
  // access and refresh tokens before storing them to the device
  // ---------------------------------------------------------------------
  @override
  dynamic decodeJWT(String token) {
    List<String> parts = token.split('.');
    // get and set refresh token
    String refresh = parts[1].toString();
    setRefreshToken(refresh);
    // get and set access token
    String access = parts[3].toString();
    setAccessToken(access);
    String jwtUserData = B64urlEncRfc7515.decodeUtf8(access);
    return json.decode(jwtUserData);
  }
}
