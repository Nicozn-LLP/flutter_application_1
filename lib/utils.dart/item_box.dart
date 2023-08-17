import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/proddet.dart';

class ItemBox extends StatefulWidget {
  final String brand;
  final String model;
  final String imageUrl;
  final String location;
  final String productPrice;
  final String documentId;
  final bool isBookmarked;
  final void Function(bool isBookmarked, String documentId) onBookmarkChanged;

  ItemBox({
    required this.brand,
    required this.model,
    required this.imageUrl,
    required this.location,
    required this.productPrice,
    required this.documentId,
    required this.isBookmarked,
    required this.onBookmarkChanged,
  });

  @override
  _ItemBoxState createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  bool isBookmarked = false;

  final uid = FirebaseAuth.instance.currentUser!.uid;
  late final ref = FirebaseFirestore.instance
      .collection('bookmarks')
      .doc('$uid:${widget.documentId}');

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.isBookmarked;
  }

  void _toggleBookmark(bool isExist) async {
    if (isExist) {
      await ref.delete();
      return;
    }

    await ref.set({
      'productid': widget.documentId,
      'userid': uid,
      'name': widget.brand,
      'image': widget.imageUrl
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // Use GestureDetector instead of ItemBox
        onTap: () {
          // Navigate to the product details page and pass necessary data
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Productdetails(
                productId: widget.documentId,
              ),
            ),
          );
        },
        child: Container(
          width: 150,
          height: 250,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: const Color(0xFFE3E6E6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Brand row
              Text(
                widget.brand,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: const Color(0xFF3F3D3C),
                ),
              ),

              SizedBox(
                height: 5.0,
              ),

              // Model row
              Text(
                widget.model,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: const Color(0xFF3F3D3C),
                ),
              ),

              SizedBox(
                height: 5.0,
              ),

              // Image row
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  height: 65.0,
                  width: double
                      .infinity, // Set the fit property to BoxFit.fitWidth
                ),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      // Location
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: const Color(0xFF3F3D3C),
                          ),
                          Text(
                            widget.location,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: const Color(0xFF3F3D3C),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '₹${widget.productPrice}',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color(0xFF3F3D3C),
                        ),
                      )
                    ],
                  ),
                  Expanded(child: SizedBox.shrink()),
                  StreamBuilder(
                      stream: ref.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          // Handle error
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Display a loading indicator while waiting for data
                          return CircularProgressIndicator();
                        }

                        final doc = snapshot.data;

                        if (doc == null) {
                          return const SizedBox.shrink();
                        }

                        return IconButton(
                          onPressed: () {
                            _toggleBookmark(doc.exists);
                          }, // Call the toggle function
                          icon: Icon(
                            doc.exists ? Icons.bookmark : Icons.bookmark_border,
                            size: 30,
                            color: const Color(0xFF3F3D3C),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ));
  }
}
