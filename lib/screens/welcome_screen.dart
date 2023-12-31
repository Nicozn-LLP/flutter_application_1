import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:renttt/routes/app_routes.dart';
import 'package:renttt/screens/styles.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(
                color: primaryColor,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_3mcu1lCXFW.json'),
            const SizedBox(height: 16),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    final doc = (await FirebaseFirestore.instance
                        .collection('Users')
                        .doc(user.uid)
                        .get());

                    if (doc.exists) {
                      Navigator.pushNamed(context, AppRoutes.bottombar);
                      return;
                    }
                    Navigator.pushNamed(context, AppRoutes.register);
                  }

                  Navigator.pushNamed(context, AppRoutes.phone);
                },
                child: Text("Let's get started"),
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
