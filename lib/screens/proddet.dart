import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/rating.dart';

import 'contact.dart';

class Proddet extends StatefulWidget {
  const Proddet({Key? key}) : super(key: key);

  @override
  State<Proddet> createState() => _ProddetState();
}

class _ProddetState extends State<Proddet> {
  int _rating = 0;

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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 10,
                  child: Text(
                    'Maruti Suzuki',
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
                  top: 50,
                  child: Text(
                    'Ignis',
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
                  top: 100,
                  child: Container(
                    width: 320,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvORd7vfF74tltspL7oVQ4k6PWco6Ebmy9Bg&usqp=CAU'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 340,
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
                  left: 44,
                  top: 393,
                  child: Text(
                    '5 Passengers',
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
                  left: 44,
                  top: 427,
                  child: Text(
                    'Bluetooth',
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
                  left: 217,
                  top: 393,
                  child: Text(
                    '4 Doors',
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
                  left: 217,
                  top: 425,
                  child: Text(
                    'GPS',
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
                  left: 44,
                  top: 459,
                  child: Text(
                    'Manual',
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
                  top: 525,
                  child: Container(
                    width: 360,
                    height: 100,
                    color: Color(0xFF16161A),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 550,
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
                          '₹1800/Day',
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
                  left: 250,
                  top: 550,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Contact(
                            phoneNumber: '8097147818',
                          ),
                        ),
                      ); // Handle button click event
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF005851),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      width: 50,
                      height: 20,
                      child: Center(
                        child: Text(
                          'Call Now',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: 0.02,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 550,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingButton(), // Add RatingButton widget
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
