import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renttt/utils.dart/item_box.dart';

class FashionScreen extends StatelessWidget {
  final String category;

  const FashionScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').where(
                'category',
                whereIn: ['Apparels', 'Events']) // Filter by type (Bike or Car)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final documents = snapshot.data!.docs;

          return GridView.builder(
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

              // Extract vehicle data
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
                  onBookmarkChanged(isBookmarked, documentId);
                },
              );
            },
          );
        },
      ),
    );
  }

  void onBookmarkChanged(bool isBookmarked, String documentId) {}
}
