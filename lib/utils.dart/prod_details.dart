import 'package:flutter/material.dart';

import '../screens/slider.dart';
import '../screens/styles.dart';

class Productdetail extends StatelessWidget {
  final String imageUrl1;
  final String model;
  final String brand;
  final String fuel;
  final String features;
  final String price;
  const Productdetail(
      {Key? key,
      required this.imageUrl1,
      required this.model,
      required this.brand,
      required this.fuel,
      required this.features,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
                ),
                child: const Icon(Icons.arrow_back),
              ),
            ),
            Positioned(
              left: 20,
              top: 118,
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
              top: 162,
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
              top: 210,
              child: Container(
                width: 370,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl1),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 429,
              child: Text(
                'Specifications',
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
              top: 571,
              child: Text(
                'Car Features',
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
              top: 472,
              child: Container(
                width: 77,
                height: 76,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 512,
              child: Text(
                'Fuel',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  letterSpacing: 0.02,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 528,
              child: Text(
                fuel,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  letterSpacing: 0.02,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 44,
              top: 614,
              child: Text(
                features,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  letterSpacing: 0.02,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 712,
              child: Container(
                width: 412,
                height: 100,
                color: Color(0xFF16161A),
              ),
            ),
            Positioned(
              left: 20,
              top: 734,
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
                        fontSize: 14,
                        letterSpacing: 0.02,
                        color: Color(0xFF94A1B2),
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: 0.02,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 238,
              top: 732,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Slide()),
                  ); // Handle button click event
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF005851),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Container(
                  width: 117,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Call Now',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: 0.02,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
