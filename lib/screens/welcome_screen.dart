import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/screens/styles.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(
                color: primaryColor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_3mcu1lCXFW.json'),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
                padding:
                const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                textStyle: const TextStyle(fontSize: 14),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.phone);
              },
              child: const Text("Let's get started"),
            ),
          ],
        ),
      ),
    );
  }
}