import 'package:flutter/material.dart';

class GlobalConstants {
  static const int maxLength = 20;
}
final Authenticator authenticator = Authenticator();

class ThemeConstants {
  static Color primaryColor = Color(0xFF22428f);
  static Color primaryTextColor = Colors.black;
  static Color secondaryTextColor = Colors.grey;
  static Color greyIconColor = Color(0xFF808080);
  static Color buttonColor = primaryColor;
  static Color buttonTextColor = Colors.white;
}

class Paths {
  static const String baseIP = 'http://192.168.6.69';
  static const String baseUrl = '$baseIP/MobileAppRestApi/api/ServiceApi';

  static const String login = '$baseUrl/AuthenticateCustomerWithUserId';
}

class Authenticator {
  String _userToken = '';
  String _clientToken = '';

  void setUserToken(String token) {
    this._userToken = 'bearer $token';
  }

  void setClientToken(String token) {
    this._clientToken = 'bearer $token';
  }

  String getUserToken() {
    if (_userToken != null) {
      return _userToken;
    } else
      return null;
  }

  String getClientToken() {
    if (_clientToken != null && _clientToken != '') {
      return _clientToken;
    } else {
      return null;
    }
  }
}
