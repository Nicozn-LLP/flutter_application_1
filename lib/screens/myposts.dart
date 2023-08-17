import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils.dart/item_box.dart';

class Myposts extends StatelessWidget {
  const Myposts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Row(
              children: [
                SizedBox(width: 120),
                Text(
                  'My Posts!',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('products')
                  .where('userId',
                      isEqualTo: uid) // Filter by current user's ID
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Text('No posts found.');
                }

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    mainAxisSpacing: 10.0, // Spacing between rows
                    crossAxisSpacing: 10.0, // Spacing between columns
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data!.docs[index];
                    final data = doc.data() as Map<String, dynamic>;

                    // Check if the current user ID matches the product's user ID
                    if (data['userId'] == uid) {
                      return ItemBox(
                        // Pass the necessary data to your ItemBox widget
                        brand: data['brand'],
                        model: data['model'],
                        imageUrl: data['imageUrl'],
                        location: data['location'],
                        productPrice: data['price'],
                        documentId: doc.id,
                        isBookmarked:
                            false, // You can set this based on your bookmark logic
                        onBookmarkChanged: (isBookmarked, documentId) {
                          // Handle bookmark changes here
                        },
                      );
                    } else {
                      return SizedBox
                          .shrink(); // If the user ID doesn't match, hide the item
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
