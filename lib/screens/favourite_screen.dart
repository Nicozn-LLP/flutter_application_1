import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          child: Center(
            child: Column(
              children: [
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

                          final productId = data['productid'];

                          return StreamBuilder<DocumentSnapshot>(
                            stream: productsQuery.doc(productId).snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text('Loading');
                              }
                              final productData =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              // final productDocument = documents[index];

                              final productBrand = productData['brand'];
                              final productModel = productData['model'];
                              final productImageUrl = productData['imageUrl'];
                              final productLocation = productData['location'];
                              final productPrice = productData['price'];
                              final productDocumentId = productId;

                              return ItemBox(
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
                              );
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
        ),
      ),
    );
  }
}
