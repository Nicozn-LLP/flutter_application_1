import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/styles.dart';

class PrivacyPolicyPage extends StatelessWidget {
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
              child: const Icon(Icons.arrow_back),
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
                      'Privacy Policy',
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla auctor augue dui, a eleifend mi maximus eu. In consectetur sapien at elit dapibus sagittis. In scelerisque nisi vel erat efficitur rhoncus. Morbi nec sem non ex dapibus vehicula. Aenean eget sem eu enim convallis gravida a in turpis. Fusce porta pharetra ipsum a lobortis. Nam a tincidunt ipsum. Phasellus faucibus purus id nisl vestibulum efficitur. Quisque malesuada facilisis risus, a rutrum mauris placerat nec. Suspendisse potenti. Cras sagittis, leo eu pharetra ullamcorper, odio nunc maximus tellus, at sollicitudin enim mauris id tellus. Quisque ac luctus justo, vitae malesuada odio. Duis a sagittis ex. Morbi porttitor, dui ac semper accumsan, ligula metus placerat sem, eu sollicitudin nisl tortor ac dolor. Sed sollicitudin turpis sed ex eleifend fermentum.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    // Add more policy details as needed
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
