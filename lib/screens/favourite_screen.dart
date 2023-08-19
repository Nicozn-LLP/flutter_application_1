import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renttt/screens/styles.dart';

import '../utils.dart/item_box.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late final User? currentUser = FirebaseAuth.instance.currentUser;
  late final Query bookmarksRef = FirebaseFirestore.instance
      .collection('bookmarks')
      .where('userid', isEqualTo: currentUser?.uid);
  late final CollectionReference productsQuery =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, primaryColor],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  'My Bookmarks',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                StreamBuilder<QuerySnapshot>(
                  stream: bookmarksRef.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    final documents = snapshot.data!.docs;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        final document = documents[index];
                        final data = document.data() as Map<String, dynamic>;

                        final productId = data['productid'];

                        return Column(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                              stream: productsQuery.doc(productId).snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }

                                final productSnapshot = snapshot.data;
                                if (!productSnapshot!.exists) {
                                  return SizedBox.shrink();
                                }

                                final productData = snapshot.data!.data()
                                    as Map<String, dynamic>;

                                final productBrand = productData['brand'];
                                final productModel = productData['model'];
                                final productImageUrl = productData['imageUrl'];
                                final productLocation = productData['location'];
                                final productPrice = productData['price'];
                                final productDocumentId = productId;

                                return Column(
                                  children: [
                                    SizedBox(
                                      width: 275,
                                      height: 175,
                                      child: ItemBox(
                                        brand: productBrand,
                                        model: productModel,
                                        imageUrl: productImageUrl,
                                        location: productLocation,
                                        productPrice: productPrice,
                                        documentId: productDocumentId,
                                        isBookmarked: true,
                                        onBookmarkChanged: (isBookmarked, _) {
                                          // Handle bookmark changes here (if needed)
                                        },
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[600],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
