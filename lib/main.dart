import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

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
      //   AppRoutes.register: (context) => RegisterPage(),
      // },
    );
  }
}
