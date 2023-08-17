import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renttt/screens/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class Productdetails extends StatefulWidget {
  final String productId;

  const Productdetails({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('products')
              .doc(widget.productId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              // Handle error
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              // Display a loading indicator while waiting for data
              return CircularProgressIndicator();
            }

            final document = snapshot.data;
            final data = document!.data() as Map<String, dynamic>;

            final brand = data['brand'];
            final model = data['model'];
            final imageUrl = data['imageUrl'];
            final location = data['location'];
            final price = data['price'];
            final features = data['feature'];
            final description = data['description'];
            final userId = data['userId'];

            return Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 30,
                    child: Text(
                      model,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        letterSpacing: 0.02,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 70,
                    child: Text(
                      brand,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 0.02,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 140,
                    child: Container(
                      width: 320,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 380,
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 0.02,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 410,
                    child: Text(
                      description,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        letterSpacing: 0.02,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 450,
                    child: Text(
                      'Features',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 0.02,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 480,
                    child: Text(
                      features,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        letterSpacing: 0.02,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 550,
                    child: Container(
                      width: 412,
                      height: 100,
                      color: Color(0xFF16161A),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 575,
                    child: Container(
                      width: 99,
                      height: 47,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: 0.02,
                              color: Color(0xFF94A1B2),
                            ),
                          ),
                          Text(
                            price,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              letterSpacing: 0.02,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 250,
                    top: 575,
                    child: ElevatedButton(
                      onPressed: () async {
                        final userSnapshot = await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(userId)
                            .get();
                        if (userSnapshot.exists) {
                          final userData =
                              userSnapshot.data() as Map<String, dynamic>;
                          final Phone = userData['phone'];
                          print(Phone);
                          await _launchUrl('tel:$Phone');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: primaryColor, // Set the button color to black
                      ),
                      child: const Text(
                        'Call Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

// const phoneNumber = '8050242047';
// const url = 'tel:$phoneNumber';
// _launchUrl(url);
