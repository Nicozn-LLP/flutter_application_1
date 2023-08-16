import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
              width: double.infinity, // Set the fit property to BoxFit.fitWidth
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
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    size: 30,
                    color: const Color(0xFF3F3D3C),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
