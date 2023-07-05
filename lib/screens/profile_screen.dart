import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/about.dart';
import 'package:flutter_application_1/screens/details.dart';
import 'package:flutter_application_1/screens/otp.dart';
import 'package:flutter_application_1/screens/privacypolicy.dart';
import 'package:flutter_application_1/screens/styles.dart';
import 'package:flutter_application_1/screens/terms.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 700,
      color: const Color(0xFFFFFFFF),
      child: Stack(
        children: [
          Positioned(
            width: 318.26,
            height: 90,
            left: 198 - 318.26 / 2 + 0.13,
            top: 50,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Details()),
                  );
                },
                child: Text('James Dsouza'),
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            width: 60,
            height: 60,
            left: 125 - 120 / 2,
            top: 66,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage('assets/images/photo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            width: 24,
            height: 24,
            left: 300,
            top: 82,
            child: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
          ),
          Positioned(
            width: 318.26,
            height: 50,
            left: 198 - 318.26 / 2 + 0.13,
            top: 180,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Details()),
                  );
                },
                child: Text('Account'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            width: 318.26,
            height: 50,
            left: 198 - 318.26 / 2 + 0.13,
            top: 260,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
                child: Text('About'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            width: 318.26,
            height: 50,
            left: 198 - 318.26 / 2 + 0.13,
            top: 340,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsPage()),
                  );
                },
                child: Text('Terms of Service'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            width: 318.26,
            height: 50,
            left: 198 - 318.26 / 2 + 0.13,
            top: 420,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyPage()),
                  );
                },
                child: Text('Privacy Policy'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            width: 318.26,
            height: 50,
            left: 198 - 318.26 / 2 + 0.13,
            top: 540,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextPage()),
                  );
                },
                child: Text('Log-Out'),
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
