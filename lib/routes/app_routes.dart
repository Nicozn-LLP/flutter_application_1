import 'package:flutter/material.dart';
import 'package:renttt/screens/Register_screen.dart';
import 'package:renttt/screens/otp_screen.dart';
import 'package:renttt/screens/phone_screen.dart';
import 'package:renttt/screens/welcome_screen.dart';

import '../screens/bottom_bar.dart';
import '../screens/featured_screen.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String otp = '/otp';
  static const String phone = '/phone';
  static const String register = '/register';
  static const String featured = '/featured';
  static const String bottombar = '/bottombar';

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
      case featured:
        return _getMaterialRoute(FeaturedScreen());
      case bottombar:
        return _getMaterialRoute(Bottombar());
      default:
        return _getMaterialRoute(WelcomePage());
    }
  }

  static _getMaterialRoute(Widget page) =>
      MaterialPageRoute(builder: (BuildContext context) => page);
}
