import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcome,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      // routes: {
      //   AppRoutes.otp: (context) => OtpPage(),
      //   AppRoutes.phone: (context) => MyPhone(),
      // },
    );
  }
}