import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/styles.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
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
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Center(
                        child: Text(
                          'About',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'App Name: My Flutter App',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Version: 1.0.0',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Developer: John Doe',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    // Add more details as needed
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
