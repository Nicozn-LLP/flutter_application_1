import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renttt/utils.dart/item_box.dart';
import 'package:renttt/utils.dart/searching_bar.dart';

class AccessoriesScreen extends StatefulWidget {
  @override
  _AccessoriesScreenState createState() => _AccessoriesScreenState();
}

class _AccessoriesScreenState extends State<AccessoriesScreen> {
  late String _searchText;

  @override
  void initState() {
    super.initState();
    _searchText = '';
  }

  void _updateSearchText(String searchText) {
    setState(() {
      _searchText = searchText;
    });
  }

  List<QueryDocumentSnapshot> getFilteredDocuments(QuerySnapshot snapshot) {
    final documents = snapshot.docs;

    if (_searchText.isEmpty) {
      return documents;
    } else {
      final List<QueryDocumentSnapshot> filteredDocuments = [];

      for (final document in documents) {
        final data = document.data() as Map<String, dynamic>;
        final brand = data['brand'] as String;
        final model = data['model'] as String;

        if (brand.toLowerCase().contains(_searchText.toLowerCase())) {
          filteredDocuments.add(document);
        }
        if (model.toLowerCase().contains(_searchText.toLowerCase())) {
          filteredDocuments.add(document);
        }
      }

      return filteredDocuments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Add padding to the content
          child: Column(
            children: [
              SearchingBar(onTextChanged: _updateSearchText),
              SizedBox(height: 20.0),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('products').where(
                  'category',
                  whereIn: ['Accessories', 'Services'],
                ).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  final filteredDocuments =
                      getFilteredDocuments(snapshot.data!);

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.95,
                    ),
                    itemCount: filteredDocuments.length,
                    itemBuilder: (context, index) {
                      final document = filteredDocuments[index];
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
                          onBookmarkChanged(isBookmarked, documentId);
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onBookmarkChanged(bool isBookmarked, String documentId) {
    // Implement your bookmark functionality here
  }
}
