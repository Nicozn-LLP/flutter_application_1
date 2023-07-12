import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailsPage extends StatelessWidget {
  final String phoneNumber;

  const ProductDetailsPage({Key? key, required this.phoneNumber})
      : super(key: key);

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
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Other widgets
            // ...

            ElevatedButton(
              onPressed: _makePhoneCall,
              child: Text('Call Now'),
            ),
          ],
        ),
      ),
    );
  }
}
