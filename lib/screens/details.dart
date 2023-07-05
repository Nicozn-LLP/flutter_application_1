import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/styles.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 40,
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
              width: 120,
              height: 120,
              left: 200 - 120 / 2,
              top: 116, // Adjusted value
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage('assets/images/photo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              width: 102,
              height: 18,
              left: 200 - 102 / 2,
              top: 253, // Adjusted value
              child: Text(
                'Change photo',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              width: 66,
              height: 16,
              left: 38,
              top: 293, // Adjusted value
              child: Text(
                'Name',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              width: 123,
              height: 16,
              left: 38,
              top: 381, // Adjusted value
              child: Text(
                'Second Name',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              width: 123,
              height: 16,
              left: 38,
              top: 469, // Adjusted value
              child: Text(
                'Phone number',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              width: 123,
              height: 16,
              left: 38,
              top: 559, // Adjusted value
              child: Text(
                'Date of birth',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              width: 320,
              height: 50,
              left: 38,
              top: 326, // Adjusted value
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: TextEditingController(text: ''),
              ),
            ),
            Positioned(
              width: 320,
              height: 50,
              left: 38,
              top: 501, // Adjusted value
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: TextEditingController(text: ''),
              ),
            ),
            Positioned(
              width: 320,
              height: 50,
              left: 38,
              top: 414, // Adjusted value
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: TextEditingController(text: ''),
              ),
            ),
            Positioned(
              width: 320,
              height: 50,
              left: 38,
              top: 591, // Adjusted value
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: TextEditingController(text: ''),
              ),
            ),
            Positioned(
              width: 24,
              height: 24,
              left: 320,
              top: 601, // Adjusted value
              child: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
            ),
            Positioned(
              width: 318.26,
              height: 50,
              left: 198 - 318.26 / 2 + 0.13,
              top: 666, // Adjusted value
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
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
