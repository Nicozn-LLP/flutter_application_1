import 'package:flutter/material.dart';
import 'package:renttt/screens/styles.dart';

import 'add_post.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What are you renting?',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                height: 1.21,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Select the Category',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                height: 1.6,
                letterSpacing: 0.5,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
                children: [
                  CategoryBox(
                    label: 'Cars',
                    image: 'assets/png/cars.png',
                    cardColor: primaryColor, // Set color to blue
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Addpost(category: 'Cars')),
                      );
                    },
                  ),
                  CategoryBox(
                    label: 'Bike',
                    image: 'assets/png/bike.png',
                    cardColor: primaryColor, // Set color to yellow
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Addpost(category: 'Bike')),
                      );
                    },
                  ),
                  CategoryBox(
                    label: 'Apparels',
                    image: 'assets/png/apparels.png',
                    cardColor: primaryColor, // Set color to green
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Addpost(category: 'Apparels')),
                      );
                    },
                  ),
                  CategoryBox(
                    label: 'Accessories',
                    image: 'assets/png/accessories.png',
                    cardColor: primaryColor, // Set color to red
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Addpost(category: 'Accessories')),
                      );
                    },
                  ),
                  CategoryBox(
                    label: 'Services',
                    image: 'assets/png/services.png',
                    cardColor: primaryColor, // Set color to brown
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Addpost(category: 'Services')),
                      );
                    },
                  ),
                  CategoryBox(
                    label: 'Events',
                    image: 'assets/png/event.png',
                    cardColor: primaryColor, // Set color to pink
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Addpost(category: 'Events')),
                      );
                    },
                  ),
                  // Rest of the CategoryBox widgets
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String label;
  final String image;
  final Color cardColor;
  final Color textColor;
  final VoidCallback onTap;

  const CategoryBox({
    Key? key,
    required this.label,
    required this.image,
    required this.cardColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cardColor, // Use the provided cardColor
          border: Border.all(
            color: const Color(0xFF005851),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 135,
              height: 135,
              fit: BoxFit.cover,
            ),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Inter-Bold',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                height: 1.6,
                letterSpacing: 0.5,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: const Center(
        child: Text('Category Screen'),
      ),
    );
  }
}
