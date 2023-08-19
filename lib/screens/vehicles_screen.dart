import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renttt/utils.dart/item_box.dart';
import 'package:renttt/utils.dart/searching_bar.dart';

class VehiclesScreen extends StatefulWidget {
  @override
  _VehiclesScreenState createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  late String _searchText;
  late List<QueryDocumentSnapshot> _allDocuments;

  @override
  void initState() {
    super.initState();
    _searchText = '';
    _allDocuments = []; // Initialize the list here
    _loadAllDocuments();
  }

  void _loadAllDocuments() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('category', whereIn: ['Cars', 'Bike']).get();

    setState(() {
      _allDocuments = snapshot.docs;
    });
  }

  void _updateSearchText(String searchText) {
    setState(() {
      _searchText = searchText;
    });
  }

  List<QueryDocumentSnapshot> getFilteredDocuments() {
    if (_searchText.isEmpty) {
      return _allDocuments;
    } else {
      final List<QueryDocumentSnapshot> filteredDocuments = [];

      for (final document in _allDocuments) {
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
    final filteredDocuments = getFilteredDocuments();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SearchingBar(onTextChanged: _updateSearchText),
              SizedBox(height: 20.0),
              GridView.builder(
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
