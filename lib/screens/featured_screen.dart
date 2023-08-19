import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renttt/screens/slider.dart';
import 'package:renttt/utils.dart/item_box.dart';

class FeaturedScreen extends StatefulWidget {
  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  // Step 1: Define a function to handle bookmark changes
  void _onBookmarkChanged(bool isBookmarked, String documentId) {
    // Update the bookmark status in Firestore for the given documentId
    FirebaseFirestore.instance.collection('products').doc(documentId).update({
      'isBookmarked': isBookmarked,
    }).then((value) {
      print('Bookmark state updated successfully!');
    }).catchError((error) {
      print('Failed to update bookmark state: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Slide(),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text(
                    'Hot Deals',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // Handle error
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading indicator while waiting for data
                  return CircularProgressIndicator();
                }

                final documents = snapshot.data!.docs;

                final uniqueIndices = Set<int>();
                final hotDealsWidgets = <Widget>[];
                final random = Random();

                while (uniqueIndices.length < 8) {
                  final index = random.nextInt(documents.length);
                  if (!uniqueIndices.contains(index)) {
                    uniqueIndices.add(index);
                    final document = documents[index];
                    final data = document.data() as Map<String, dynamic>;

                    final brand = data['brand'];
                    final model = data['model'];
                    final imageUrl = data['imageUrl'];
                    final location = data['location'];
                    final price = data['price'];
                    final documentId = document.id;

                    hotDealsWidgets.add(
                      ItemBox(
                        brand: brand,
                        model: model,
                        imageUrl: imageUrl,
                        location: location,
                        productPrice: price,
                        documentId: documentId,
                        isBookmarked: data['isBookmarked'] ?? false,
                        onBookmarkChanged: (isBookmarked, sss) {
                          // Handle bookmark changes here (e.g., update Firestore)
                          _onBookmarkChanged(isBookmarked, documentId);
                        },
                      ),
                    );
                  }
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.95,
                    children: hotDealsWidgets,
                  ),
                );
              },
            ),
            SizedBox(height: 20.0), // Add spacing between sections
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text(
                    'Fresh Picks',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // Handle error
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading indicator while waiting for data
                  return CircularProgressIndicator();
                }

                final documents = snapshot.data!.docs;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.95,
                    ),
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final document = documents[index];
                      final data = document.data() as Map<String, dynamic>;

                      final brand = data['brand'];
                      final model = data['model'];
                      final imageUrl = data['imageUrl'];
                      final location = data['location'];
                      final price = data['price'];
                      final documentId = document.id;

                      return ItemBox(
                        brand: brand,
                        model: model,
                        imageUrl: imageUrl,
                        location: location,
                        productPrice: price,
                        documentId: documentId,
                        isBookmarked: data['isBookmarked'] ?? false,
                        onBookmarkChanged: (isBookmarked, sss) {
                          // Handle bookmark changes here (e.g., update Firestore)
                          _onBookmarkChanged(isBookmarked, documentId);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: FeaturedScreen()));
}
