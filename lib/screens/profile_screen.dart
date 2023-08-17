import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renttt/screens/about.dart';
import 'package:renttt/screens/details.dart';
import 'package:renttt/screens/myposts.dart';
import 'package:renttt/screens/phone_screen.dart';
import 'package:renttt/screens/privacypolicy.dart';
import 'package:renttt/screens/styles.dart';
import 'package:renttt/screens/terms.dart';

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
                        // Adjust the spacing here
                        SizedBox(width: 100),

                        UserDisplayNameWidget(), // Display user's name
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
                      MaterialPageRoute(builder: (context) => MyPhone()),
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

class UserDisplayNameWidget extends StatefulWidget {
  @override
  _UserDisplayNameWidgetState createState() => _UserDisplayNameWidgetState();
}

class _UserDisplayNameWidgetState extends State<UserDisplayNameWidget> {
  late final uid = FirebaseAuth.instance.currentUser!.uid;
  late final ref = FirebaseFirestore.instance.collection('Users').doc(uid);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: ref.get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (snapshot.data != null) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            String firstName = data['first_name'] ?? '';
            String lastName = data['last_name'] ?? '';

            String fullName = '$firstName $lastName';

            return Text(
              fullName,
              style: TextStyle(fontSize: 16),
            );
          }
        }

        // Return an empty container when there's no data to display
        return Container();
      },
    );
  }
}
