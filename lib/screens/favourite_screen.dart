import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 700,
      color: const Color(0xFFFFFFFF),
      child: Stack(
        children: [
          Positioned(
            width: 120,
            height: 120,
            left: 200 - 120 / 2,
            top: 66,
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
            top: 203,
            child: Text(
              'Change photo',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          Positioned(
            width: 66,
            height: 16,
            left: 38,
            top: 243,
            child: Text(
              'Name',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          Positioned(
            width: 123,
            height: 16,
            left: 38,
            top: 331,
            child: Text(
              'Second name',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          Positioned(
            width: 123,
            height: 16,
            left: 38,
            top: 419,
            child: Text(
              'Phone number',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          Positioned(
            width: 123,
            height: 16,
            left: 38,
            top: 509,
            child: Text(
              'Date of birth',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          Positioned(
            width: 320,
            height: 50,
            left: 38,
            top: 270,
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
            top: 445,
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
            top: 358,
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
            top: 535,
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
            top: 545,
            child: Icon(
              Icons.calendar_today,
              color: const Color(0xFF000000),
            ),
          ),
          Positioned(
            width: 318.26,
            height: 50,
            left: 198 - 318.26 / 2 + 0.13,
            top: 610,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF005851),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            width: 43,
            height: 22,
            left: 198 - 43 / 2 + 1.5,
            top: 625,
            child: Text(
              'Save',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
