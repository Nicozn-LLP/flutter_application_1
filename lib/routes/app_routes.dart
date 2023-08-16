import 'package:flutter/material.dart';
import 'package:renttt/screens/Register_screen.dart';
import 'package:renttt/screens/otp_screen.dart';
import 'package:renttt/screens/phone_screen.dart';
import 'package:renttt/screens/welcome_screen.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String otp = '/otp';
  static const String phone = '/phone';
  static const String register = '/register';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return _getMaterialRoute(WelcomePage());
      case otp:
        return _getMaterialRoute(MyOtp());
      case phone:
        return _getMaterialRoute(MyPhone());
      case register:
        return _getMaterialRoute(MyRegister());
      default:
        return _getMaterialRoute(WelcomePage());
    }
  }

  static _getMaterialRoute(Widget page) =>
      MaterialPageRoute(builder: (BuildContext context) => page);
}
