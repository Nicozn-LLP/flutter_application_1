import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/about.dart';
import 'package:flutter_application_1/screens/details.dart';
import 'package:flutter_application_1/screens/myposts.dart';
import 'package:flutter_application_1/screens/otp.dart';
import 'package:flutter_application_1/screens/privacypolicy.dart';
import 'package:flutter_application_1/screens/styles.dart';
import 'package:flutter_application_1/screens/terms.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                width: 318.26,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Details()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(width: 10), // Adjust the spacing here
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage('assets/images/photo.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Adjust the spacing here
                        Text(
                          'James Dsouza',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                width: 318.26,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Myposts()),
                    );
                  },
                  child: Text('My Posts'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: 318.26,
                height: 50,
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
              SizedBox(height: 16),
              Container(
                width: 318.26,
                height: 50,
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
              SizedBox(height: 16),
              Container(
                width: 318.26,
                height: 50,
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
              SizedBox(height: 16),
              Container(
                width: 318.26,
                height: 50,
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
            ],
          ),
        ),
      ),
    );
  }
}
