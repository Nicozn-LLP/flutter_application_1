import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  final String phoneNumber;

  const Contact({Key? key, required this.phoneNumber}) : super(key: key);

  void _makePhoneCall() async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contact Now',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _makePhoneCall,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      primaryColor), // Change the color here
                ),
                child: Text('Call Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
