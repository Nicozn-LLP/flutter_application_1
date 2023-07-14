import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/styles.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Color(0xFF005851),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 2,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms and Services',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Cras sed aliquam velit. Nullam auctor risus vitae turpis '
                      'dignissim, ac ullamcorper dolor tincidunt. Nulla facilisi. '
                      'Nullam id nunc in tortor fringilla laoreet. Mauris rutrum '
                      'massa eu justo interdum, ac malesuada lectus pulvinar. '
                      'Suspendisse vestibulum tincidunt tortor, eu ullamcorper '
                      'dolor pharetra eu. Mauris quis mi nec purus laoreet aliquam. '
                      'Donec ac nisl nulla.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '1. Agreement',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'By using this app, you agree to the terms and services '
                      'outlined in this document.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '2. User Responsibilities',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Users are responsible for maintaining the confidentiality '
                      'of their account and any actions taken using their account.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    // Add more terms and services as needed
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
